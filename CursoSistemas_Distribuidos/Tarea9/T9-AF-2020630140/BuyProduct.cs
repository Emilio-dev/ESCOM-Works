using System;
using System.Data;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;

public static class AddToCartFunction
{

    [FunctionName("AddToCart")]
    public static async Task<IActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
        ILogger log)
    {
        var str = Environment.GetEnvironmentVariable("sqlconn");
        string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
        dynamic data = JsonConvert.DeserializeObject(requestBody);

        int id = Convert.ToInt32(data?.id);
        int quantity = Convert.ToInt32(data?.quantity);

        if (id == 0 || quantity == 0)
        {
            return new BadRequestObjectResult("Please provide an ID and a quantity in the request body.");
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
                        // Consulta el producto en la tabla "Products"
                        var selectQuery = "SELECT * FROM products WHERE idProduct = @Id";

                        using (var selectCommand = new MySqlCommand(selectQuery, connection, transaction))
                        {
                            selectCommand.Parameters.AddWithValue("@Id", id);

                            using (var reader = await selectCommand.ExecuteReaderAsync())
                            {
                                if (reader.HasRows)
                                {
                                    await reader.ReadAsync();

                                    int currentQuantity = Convert.ToInt32(reader["quantity"]);

                                    if (currentQuantity >= quantity)
                                    {
                                        // Recupera los valores del producto
                                        string productName = reader["name"].ToString();
                                        string productDescription = reader["description"].ToString();
                                        decimal productPrice = Convert.ToDecimal(reader["price"]);

                                        // Cierra el lector de datos antes de realizar otras operaciones dentro de la transacción
                                        reader.Close();

                                        // Guarda los valores en la tabla "CarritoDeCompras"
                                        var insertQuery = "INSERT INTO carrito_compra (idProduct, name, description, price, quantity) VALUES (@Id, @Name, @Description, @Price, @Quantity)";

                                        using (var insertCommand = new MySqlCommand(insertQuery, connection, transaction))
                                        {
                                            insertCommand.Parameters.AddWithValue("@Id", id);
                                            insertCommand.Parameters.AddWithValue("@Name", productName);
                                            insertCommand.Parameters.AddWithValue("@Description", productDescription);
                                            insertCommand.Parameters.AddWithValue("@Price", productPrice);
                                            insertCommand.Parameters.AddWithValue("@Quantity", quantity);

                                            await insertCommand.ExecuteNonQueryAsync();
                                        }

                                        // Actualiza la cantidad en la tabla "Products"
                                        var updateQuery = "UPDATE products SET quantity = @UpdatedQuantity WHERE idProduct = @Id";

                                        using (var updateCommand = new MySqlCommand(updateQuery, connection, transaction))
                                        {
                                            int updatedQuantity = currentQuantity - quantity;
                                            updateCommand.Parameters.AddWithValue("@UpdatedQuantity", updatedQuantity);
                                            updateCommand.Parameters.AddWithValue("@Id", id);

                                            await updateCommand.ExecuteNonQueryAsync();
                                        }

                                        // Confirma la transacción
                                        await transaction.CommitAsync();

                                        return new OkObjectResult("Item added to cart successfully.");
                                    }
                                    else
                                    {
                                        // La cantidad solicitada es mayor a la cantidad disponible en la base de datos
                                        return new BadRequestObjectResult("Insufficient quantity available.");
                                    }
                                }
                                else
                                {
                                    // No se encontró el producto en la base de datos
                                    return new NotFoundObjectResult("Product not found.");
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Ocurrió un error durante la transacción, se realiza un rollback
                        log.LogError($"Error adding item to cart: {ex.Message}");
                        await transaction.RollbackAsync();
                        return new StatusCodeResult(StatusCodes.Status500InternalServerError);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            log.LogError($"Error adding item to cart: {ex.Message}");
            return new StatusCodeResult(StatusCodes.Status500InternalServerError);
        }
    }
}
