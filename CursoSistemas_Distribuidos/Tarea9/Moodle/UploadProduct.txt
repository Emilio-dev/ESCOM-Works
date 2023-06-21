using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using MySql.Data.MySqlClient;

public static class UploadProductFunction
{
    [FunctionName("UploadProduct")]
    public static async Task<IActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
        ILogger log)
    {
        var str = Environment.GetEnvironmentVariable("sqlconn");
        string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
        dynamic data = JsonConvert.DeserializeObject(requestBody);

        string name = data?.name;
        string description = data?.description;
        decimal price = Convert.ToDecimal(data?.price);
        int quantity = Convert.ToInt32(data?.quantity);
        byte[] picture = data?.picture.ToObject<byte[]>();

        if (quantity == 0)
        {
            quantity = 1;
        }

        if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(description) || price == 0 || picture == null)
        {
            return new BadRequestObjectResult("Please provide all required fields in the request body.");
        }

        try
        {
            using (MySqlConnection connection = new MySqlConnection(str))
            {
                await connection.OpenAsync();

                var query = "INSERT INTO products (name, description, price, quantity, picture) VALUES (@Name, @Description, @Price, @Quantity, @Picture)";

                using (var command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Description", description);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@Quantity", quantity);
                    command.Parameters.AddWithValue("@Picture", picture);

                    await command.ExecuteNonQueryAsync();
                }
            }
        }
        catch (Exception ex)
        {
            log.LogError($"Error uploading product to database: {ex.Message}");
            return new StatusCodeResult(StatusCodes.Status500InternalServerError);
        }

        return new OkObjectResult("Product uploaded successfully.");
    }
}
