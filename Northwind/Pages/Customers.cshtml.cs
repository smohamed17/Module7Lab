using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;
using Microsoft.Data.Sqlite;

public class CustomersModel : PageModel
{
    // setting up the customers model class
    // this will hold the list of the customer from the Northwind.db
    public List<Customer> Customers { get; set; }


    // setting up the OnGet for the special method.
    // this will be called during the web page.

    public void OnGet()
    {
        Customers = new List<Customer>();
        // connecting together the database and the populated list of customers.
        // setting up the connection string, and holds the value to establish
        // a database connection. 

        string connectionString = "DataSource=../northwind.db;Mode=ReadOnly";

        // using the string to make a new connection 
        using (SqliteConnection connection = new SqliteConnection(connectionString))
        {
            connection.Open(); // opens up the connection

            // holding the SQL command that execute against the database. 
            string sql = "SELECT CustomerID, CompanyName, ContactName, Country FROM Customers";
            // executing the SQL statement against the database here.
            using (SqliteCommand command = new SqliteCommand(sql, connection))
            {
                // needs a reader object to read the result set from the database.
                using (SqliteDataReader reader = command.ExecuteReader())
                {
                    // using the loop to result set from executing the SQL select statement.
                    while (reader.Read())
                    {
                        // adding the columns from the values of current records in the resultset
                        // to the customer list.
                        Customers.Add(new Customer
                        {
                            // will populate the new object from the data from the resultset.
                            CustomerID = reader.GetString(0),
                            CompanyName = reader.GetString(1),
                            ContactName = reader.GetString(2),
                            Country = reader.GetString(3)
                        }); // end of the statement here. 
                    }
                }
            }

        }
    }
}

// class for the blueprint creating a new customer object.

public class Customer
{
    // 4 attributes for the customer class. 
    public string CustomerID { get; set; }
    public string CompanyName { get; set; }
    public string ContactName { get; set; }
    public string Country { get; set; }
}
