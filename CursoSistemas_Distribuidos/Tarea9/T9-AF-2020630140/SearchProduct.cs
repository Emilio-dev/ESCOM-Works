using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;

public static class SearchProductFunction
{


    [FunctionName("SearchProduct")]
    public static async Task<IActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
        ILogger log)
    {
        var str = Environment.GetEnvironmentVariable("sqlconn");
        string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
        dynamic data = JsonConvert.DeserializeObject(requestBody);

        string name = data?.name;

        if (string.IsNullOrEmpty(name))
        {
            return new BadRequestObjectResult("Please provide a name in the request body.");
        }

        try
        {
            using (var connection = new MySqlConnection(str))
            {
                await connection.OpenAsync();

                var query = "SELECT * FROM products WHERE name LIKE @Name";

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", "%" + name + "%");

                    var products = new List<Product>();

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var product = new Product
                            {
                                Id = Convert.ToInt32(reader["idProduct"]),
                                Name = reader["name"].ToString(),
                                Description = reader["description"].ToString(),
                                Price = Convert.ToDecimal(reader["price"]),
                                Quantity = Convert.ToInt32(reader["quantity"])
                            };

                            // Extraer los datos de la imagen como un arreglo de bytes
                            byte[] imageData = (byte[])reader["picture"]; 

                            product.Picture = imageData;

                            products.Add(product);
                        }
                    }

                    return new OkObjectResult(products);
                }
            }
        }
        catch (Exception ex)
        {
            log.LogError($"Error searching products: {ex.Message}");
            return new StatusCodeResult(StatusCodes.Status500InternalServerError);
        }
    }
}
public class Product
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
    public byte[] Picture { get; set; } 
}
