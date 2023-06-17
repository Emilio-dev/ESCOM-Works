using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.JsonPatch.Operations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;

public static class ModifyQuantityFunction
{

    [FunctionName("ModifyQuantity")]
    public static async Task<IActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
        ILogger log)
    {
        var str = Environment.GetEnvironmentVariable("sqlconn");
        string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
        dynamic data = JsonConvert.DeserializeObject(requestBody);

        int id = data?.id;
        int quantity = data?.quantity;

        if (id == 0 || quantity == 0)
        {
            return new BadRequestObjectResult("Please provide both ID and quantity in the request body.");
        }

        try
        {
            using (var connection = new MySqlConnection(str))
            {
                await connection.OpenAsync();

                // Comienza una transacción
                using (var transaction = await connection.BeginTransactionAsync())
                {
                    try
                    {
                        // Consulta la cantidad actual en el carrito de compras para la ID proporcionada
                        var selectCartQuery = "SELECT quantity FROM carrito_compra WHERE idProduct LIKE @Id";
                        int cartQuantity;

                        using (var selectCartCommand = new MySqlCommand(selectCartQuery, connection, transaction))
                        {
                            selectCartCommand.Parameters.AddWithValue("@Id", id);
                            object cartQuantityObj = await selectCartCommand.ExecuteScalarAsync();
                            cartQuantity = Convert.ToInt32(cartQuantityObj);
                        }

                        // Consulta la cantidad actual en productos para la ID proporcionada
                        var selectProductQuery = "SELECT quantity FROM products WHERE idProduct LIKE @Id";
                        int productQuantity;

                        using (var selectProductCommand = new MySqlCommand(selectProductQuery, connection, transaction))
                        {
                            selectProductCommand.Parameters.AddWithValue("@Id", id);
                            object productQuantityObj = await selectProductCommand.ExecuteScalarAsync();
                            productQuantity = Convert.ToInt32(productQuantityObj);
                        }
                      
                        int operationQuantity = quantity - cartQuantity;

                        if (productQuantity < operationQuantity)
                        {
                            return new BadRequestObjectResult("Insufficient quantity of the product.");
                        }
                        if (operationQuantity != 0)
                        {
                            // Resta o suma la cantidad del carrito
                            var updateCartQuery = "UPDATE carrito_compra SET quantity = quantity + @Quantity WHERE idProduct LIKE @Id";
                            using (var updateCartCommand = new MySqlCommand(updateCartQuery, connection, transaction))
                            {
                                updateCartCommand.Parameters.AddWithValue("@Quantity", operationQuantity);
                                updateCartCommand.Parameters.AddWithValue("@Id", id);
                                await updateCartCommand.ExecuteNonQueryAsync();
                            }

                            // Suma o resta la cantidad a la tabla "Products"
                            var updateProductsQuery = "UPDATE products SET quantity = quantity - @Quantity WHERE idProduct LIKE @Id";
                            using (var updateProductsCommand = new MySqlCommand(updateProductsQuery, connection, transaction))
                            {
                                updateProductsCommand.Parameters.AddWithValue("@Quantity", operationQuantity);
                                updateProductsCommand.Parameters.AddWithValue("@Id", id);
                                await updateProductsCommand.ExecuteNonQueryAsync();
                            }

                            // Confirma la transacción
                            await transaction.CommitAsync();

                            return new OkObjectResult("Quantity modified successfully.");
                        }
                        else
                        {
                            return new BadRequestObjectResult("The product will be eliminated.");
                        }
                    }
                    catch (Exception ex)
                    {
                        // Ocurrió un error durante la transacción, se realiza un rollback
                        log.LogError($"Error modifying quantity: {ex.Message}");
                        await transaction.RollbackAsync();
                        return new StatusCodeResult(StatusCodes.Status500InternalServerError);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            log.LogError($"Error modyfiying quantity: {ex.Message}");
            return new StatusCodeResult(StatusCodes.Status500InternalServerError);
        }
    }
}
