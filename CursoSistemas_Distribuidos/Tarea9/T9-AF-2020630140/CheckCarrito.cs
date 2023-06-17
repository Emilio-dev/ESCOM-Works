using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;

public static class GetCartItemsFunction
{
    [FunctionName("GetCartItems")]
    public static async Task<IActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Function, "get", Route = null)] HttpRequest req,
        ILogger log)
    {
        var str = Environment.GetEnvironmentVariable("sqlconn");
        try
        {
            using (var connection = new MySqlConnection(str))
            {
                await connection.OpenAsync();

                // Consulta todos los registros de la tabla "CarritoDeCompras"
                var selectQuery = "SELECT * FROM carrito_compra";

                using (var selectCommand = new MySqlCommand(selectQuery, connection))
                {
                    using (var reader = await selectCommand.ExecuteReaderAsync())
                    {
                        List<CartItem> cartItems = new List<CartItem>();

                        while (await reader.ReadAsync())
                        {
                            CartItem cartItem = new CartItem
                            {
                                Id = Convert.ToInt32(reader["idProduct"]),
                                Name = reader["name"].ToString(),
                                Description = reader["description"].ToString(),
                                Price = Convert.ToDecimal(reader["price"]),
                                Quantity = Convert.ToInt32(reader["quantity"])
                            };

                            cartItems.Add(cartItem);
                        }

                        return new OkObjectResult(cartItems);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            log.LogError($"Error getting cart items: {ex.Message}");
            return new StatusCodeResult(StatusCodes.Status500InternalServerError);
        }
    }

    private class CartItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
    }
}
