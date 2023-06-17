using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;

public static class RemoveFromCartFunction
{

    [FunctionName("RemoveFromCart")]
    public static async Task<IActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
        ILogger log)
    {
        var str = Environment.GetEnvironmentVariable("sqlconn");
        string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
        dynamic data = JsonConvert.DeserializeObject(requestBody);

        int id = data?.id;

        if (id == 0 )
        {
            return new BadRequestObjectResult("Please provide ID in the request body.");
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

                        // Borra el contenido de la tabla "Products"
                        var deleteQuery = "DELETE FROM carrito_compra WHERE idProduct LIKE @Id";

                        using (var deleteCommand = new MySqlCommand(deleteQuery, connection))
                        {
                            deleteCommand.Parameters.AddWithValue("@Id", id);
                            await deleteCommand.ExecuteNonQueryAsync();
                        }

                        // Suma la cantidad a la tabla "Products"
                        var updateProductsQuery = "UPDATE products SET quantity = quantity + @Quantity WHERE idProduct LIKE @Id";
                        using (var updateProductsCommand = new MySqlCommand(updateProductsQuery, connection, transaction))
                        {
                            updateProductsCommand.Parameters.AddWithValue("@Quantity", cartQuantity);
                            updateProductsCommand.Parameters.AddWithValue("@Id", id);
                            await updateProductsCommand.ExecuteNonQueryAsync();
                        }

                        // Confirma la transacción
                        await transaction.CommitAsync();

                        return new OkObjectResult("Removed successfully.");
                    }
                    catch (Exception ex)
                    {
                        // Ocurrió un error durante la transacción, se realiza un rollback
                        log.LogError($"Error Removing: {ex.Message}");
                        await transaction.RollbackAsync();
                        return new StatusCodeResult(StatusCodes.Status500InternalServerError);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            log.LogError($"Error Removing: {ex.Message}");
            return new StatusCodeResult(StatusCodes.Status500InternalServerError);
        }
    }
}
