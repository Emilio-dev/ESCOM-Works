using System;
using System.Collections.Generic;
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

public static class RemoveCartFunction
{
    [FunctionName("RemoveCart")]
    public static async Task<IActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Function, "get", Route = null)] HttpRequest req,
        ILogger log)
    {
        var str = Environment.GetEnvironmentVariable("sqlconn");
        string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
        dynamic data = JsonConvert.DeserializeObject(requestBody);

        try
        {
            using (var connection = new MySqlConnection(str))
            {
                await connection.OpenAsync();

                // Consulta todas las entradas en la tabla "carrito_compra"
                var selectQuery = "SELECT idProduct, quantity FROM carrito_compra";

                using (var selectCommand = new MySqlCommand(selectQuery, connection))
                {
                    using (var reader = await selectCommand.ExecuteReaderAsync())
                    {
                        // Almacena los IDs y cantidades en un diccionario
                        var productQuantities = new Dictionary<int, int>();

                        while (await reader.ReadAsync())
                        {
                            int productId = Convert.ToInt32(reader["idProduct"]);
                            int productQuantity = Convert.ToInt32(reader["quantity"]);

                            productQuantities.Add(productId, productQuantity);
                        }

                        // Cierra el lector de datos antes de realizar otras operaciones
                        reader.Close();

                        // Borra el contenido de la tabla "Products"
                        var deleteQuery = "DELETE FROM carrito_compra";

                        using (var deleteCommand = new MySqlCommand(deleteQuery, connection))
                        {
                            await deleteCommand.ExecuteNonQueryAsync();
                        }

                        // Actualiza la tabla "carrito_compra" con las cantidades correspondientes
                        var updateQuery = "UPDATE products SET quantity = quantity + @Quantity WHERE idProduct = @Id";

                        foreach (var productQuantity in productQuantities)
                        {
                            int productId = productQuantity.Key;
                            int quantity = productQuantity.Value;

                            using (var updateCommand = new MySqlCommand(updateQuery, connection))
                            {
                                updateCommand.Parameters.AddWithValue("@Quantity", quantity);
                                updateCommand.Parameters.AddWithValue("@Id", productId);

                                await updateCommand.ExecuteNonQueryAsync();
                            }
                        }

                        return new OkObjectResult("Products added to cart successfully.");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            log.LogError($"Error adding products to cart: {ex.Message}");
            return new StatusCodeResult(StatusCodes.Status500InternalServerError);
        }
    }
}
