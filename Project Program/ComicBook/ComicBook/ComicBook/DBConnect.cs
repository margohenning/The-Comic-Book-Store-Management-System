using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.IO;
using System.Windows.Forms;

namespace ComicBook
{
    public class DBConnect
    {
        private MySqlConnection connection;
        private string server;
        private string database;
        private string uid;
        private string password;

        //Constructor
        public DBConnect()
        {
            Initialize();
        }



        //Initialize values
        private void Initialize()
        {
            server = "localhost";
            database = "comic";
            uid = "root";
            password = "Mty011gp";
            string connectionString;
            connectionString = "SERVER=" + server + ";" + "DATABASE=" +
            database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";";

            connection = new MySqlConnection(connectionString);
        }

        //open connection to database
        public bool OpenConnection()
        {
            
            try
            {
                connection.Close();
                connection.Open();
                return true;
            }
            catch (MySqlException ex)
            {
                //When handling errors, you can your application's response based 
                //on the error number.
                //The two most common error numbers when connecting are as follows:
                //0: Cannot connect to server.
                //1045: Invalid user name and/or password.
                switch (ex.Number)
                {
                    case 0:
                        
                        MessageBox.Show("Cannot connect to server.  Contact administrator");
                        break;

                    case 1045:
                        MessageBox.Show("Invalid username/password, please try again");
                        break;
                }
                return false;
            }
        }

        //Close connection
        public bool CloseConnection()
        {
            try
            {
                connection.Close();
                return true;
            }
            catch (MySqlException ex)
            {
               //MessageBox.Show(ex.Message);
                return false;
            }
        }

       


        //Insert statements
        public int InsertEmployee(Employee e)
        {
            

            //open connection
            if (this.OpenConnection() == true)
            {
                
                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "InsertEmployee";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_employeeName", e.name);
                cmd.Parameters["@_employeeName"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeSurname", e.surname);
                cmd.Parameters["@_employeeSurname"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeEmail", e.email);
                cmd.Parameters["@_employeeEmail"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeUsername", e.username);
                cmd.Parameters["@_employeeUsername"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeePassword", e.password);
                cmd.Parameters["@_employeePassword"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_AdminPrivileges", e.AdminPrivileges);
                cmd.Parameters["@_AdminPrivileges"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_activated", e.activated);
                cmd.Parameters["@_activated"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeID", MySqlDbType.Int32);
                cmd.Parameters["@_employeeID"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                int ID = (int)cmd.Parameters["@_employeeID"].Value;

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return -1;
            }
        }

        public int InsertAuthor(Author e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "InsertAuthor";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_authorName", e.name);
                cmd.Parameters["@_authorName"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_authorSurname", e.surname);
                cmd.Parameters["@_authorSurname"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_authorID", MySqlDbType.Int32);
                cmd.Parameters["@_authorID"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                int ID = (int)cmd.Parameters["@_authorID"].Value;

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return -1;
            }
        }

        public int InsertPublisher(Publisher e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "InsertPublisher";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_publisherName", e.name);
                cmd.Parameters["@_publisherName"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_publisherID", MySqlDbType.Int32);
                cmd.Parameters["@_publisherID"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                int ID = (int)cmd.Parameters["@_publisherID"].Value;

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return -1;
            }
        }

        public int InsertCustomer(Customer e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "InsertCustomer";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_customerName", e.name);
                cmd.Parameters["@_customerName"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_customerSurname", e.surname);
                cmd.Parameters["@_customerSurname"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_customerEmail", e.email);
                cmd.Parameters["@_customerEmail"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_customerID", MySqlDbType.Int32);
                cmd.Parameters["@_customerID"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                int ID = (int)cmd.Parameters["@_customerID"].Value;

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return -1;
            }
        }

        public int InsertStock(DataClasses.Stock e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "InsertStock";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_bookID", e.bookID);
                cmd.Parameters["@_bookID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_storeID", e.storeID);
                cmd.Parameters["@_storeID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_quantity", e.quantity);
                cmd.Parameters["@_quantity"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_stockID", MySqlDbType.Int32);
                cmd.Parameters["@_stockID"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                int ID = (int)cmd.Parameters["@_stockID"].Value;

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return -1;
            }
        }

        public int InsertBook(Book e)
        {


            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "InsertBook";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_authorID", e.authorID);
                cmd.Parameters["@_authorID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_publisherID", e.publisherID);
                cmd.Parameters["@_publisherID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_name", e.name);
                cmd.Parameters["@_name"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_isbn", e.isbn);
                cmd.Parameters["@_isbn"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_status", e.status);
                cmd.Parameters["@_status"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_price", e.price);
                cmd.Parameters["@_price"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_bookID", MySqlDbType.Int32);
                cmd.Parameters["@_bookID"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                int ID = (int)cmd.Parameters["@_bookID"].Value;

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return -1;
            }
        }

        public int InsertSale(Sale e)
        {


            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "InsertSale";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_customerID", e.customerID);
                cmd.Parameters["@_customerID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeID", e.employeeID);
                cmd.Parameters["@_employeeID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_date", e.date);
                cmd.Parameters["@_date"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_totalPrice", e.totalPrice);
                cmd.Parameters["@_totalPrice"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_saleID", MySqlDbType.Int32);
                cmd.Parameters["@_saleID"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                int ID = (int)cmd.Parameters["@_saleID"].Value;

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return -1;
            }
        }

        public int InsertSaleBasket(SaleBasket e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "InsertSaleBasket";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_bookID", e.bookID);
                cmd.Parameters["@_bookID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_saleID", e.saleID);
                cmd.Parameters["@_saleID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_quantity", e.quantity);
                cmd.Parameters["@_quantity"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_saleBasketID", MySqlDbType.Int32);
                cmd.Parameters["@_saleBasketID"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                int ID = (int)cmd.Parameters["@_saleBasketID"].Value;

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return -1;
            }
        }





        //Update statement
        public bool UpdateEmployee(Employee e)
        {


            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "UpdateEmployee";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_employeeID", e.employeeID);
                cmd.Parameters["@_employeeID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeName", e.name);
                cmd.Parameters["@_employeeName"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeSurname", e.surname);
                cmd.Parameters["@_employeeSurname"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeEmail", e.email);
                cmd.Parameters["@_employeeEmail"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeUsername", e.username);
                cmd.Parameters["@_employeeUsername"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeePassword", e.password);
                cmd.Parameters["@_employeePassword"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_AdminPrivileges", e.AdminPrivileges);
                cmd.Parameters["@_AdminPrivileges"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_activated", e.activated);
                cmd.Parameters["@_activated"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeUpdated", MySqlDbType.Int16);
                cmd.Parameters["@_employeeUpdated"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_employeeUpdated"].Value); 

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool UpdateAuthor(Author e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "UpdateAuthor";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_authorID", e.authorID);
                cmd.Parameters["@_authorID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_authorName", e.name);
                cmd.Parameters["@_authorName"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_authorSurname", e.surname);
                cmd.Parameters["@_authorSurname"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_authorUpdated", MySqlDbType.Int16);
                cmd.Parameters["@_authorUpdated"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_authorUpdated"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool UpdatePublisher(Publisher e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "UpdatePublisher";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_publisherID", e.publisherID);
                cmd.Parameters["@_publisherID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_publisherName", e.name);
                cmd.Parameters["@_publisherName"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_publisherUpdated", MySqlDbType.Int32);
                cmd.Parameters["@_publisherUpdated"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_publisherUpdated"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool UpdateCustomer(Customer e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "UpdateCustomer";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_customerID", e.customerID);
                cmd.Parameters["@_customerID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_customerName", e.name);
                cmd.Parameters["@_customerName"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_customerSurname", e.surname);
                cmd.Parameters["@_customerSurname"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_customerEmail", e.email);
                cmd.Parameters["@_customerEmail"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_customerUpdated", MySqlDbType.Int32);
                cmd.Parameters["@_customerUpdated"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_customerUpdated"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool UpdateStock(DataClasses.Stock e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "UpdateStock";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_stockID", e.stockID);
                cmd.Parameters["@_stockID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_bookID", e.bookID);
                cmd.Parameters["@_bookID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_storeID", e.storeID);
                cmd.Parameters["@_storeID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_quantity", e.quantity);
                cmd.Parameters["@_quantity"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_stockUpdated", MySqlDbType.Int16);
                cmd.Parameters["@_stockUpdated"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_stockUpdated"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool UpdateBook(Book e)
        {


            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "UpdateBook";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_bookID", e.bookID);
                cmd.Parameters["@_bookID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_authorID", e.authorID);
                cmd.Parameters["@_authorID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_publisherID", e.publisherID);
                cmd.Parameters["@_publisherID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_name", e.name);
                cmd.Parameters["@_name"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_isbn", e.isbn);
                cmd.Parameters["@_isbn"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_status", e.status);
                cmd.Parameters["@_status"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_price", e.price);
                cmd.Parameters["@_price"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_bookUpdated", MySqlDbType.Int16);
                cmd.Parameters["@_bookUpdated"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_bookUpdated"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool UpdateSale(Sale e)
        {


            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "UpdateSale";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_saleID", e.saleID);
                cmd.Parameters["@_saleID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_customerID", e.customerID);
                cmd.Parameters["@_customerID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeID", e.employeeID);
                cmd.Parameters["@_employeeID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_date", e.date);
                cmd.Parameters["@_date"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_totalPrice", e.totalPrice);
                cmd.Parameters["@_totalPrice"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_saleUpdated", MySqlDbType.Int16);
                cmd.Parameters["@_saleUpdated"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_saleUpdated"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool UpdateSaleBasket(SaleBasket e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "UpdateSaleBasket";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_saleBasketID", e.saleBasketID);
                cmd.Parameters["@_saleBasketID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_bookID", e.bookID);
                cmd.Parameters["@_bookID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_saleID", e.saleID);
                cmd.Parameters["@_saleID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_quantity", e.quantity);
                cmd.Parameters["@_quantity"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_saleBasketID", MySqlDbType.Int16);
                cmd.Parameters["@_saleBasketID"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_saleBasketUpdated"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }





        //Delete statement
        public bool DeleteEmployee(int e)
        {


            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "DeleteEmployee";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_employeeID", e);
                cmd.Parameters["@_employeeID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_employeeDeleted", MySqlDbType.Int16);
                cmd.Parameters["@_employeeDeleted"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_employeeDeleted"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool DeleteAuthor(int e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "DeleteAuthor";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_authorID", e);
                cmd.Parameters["@_authorID"].Direction = System.Data.ParameterDirection.Input;

                cmd.Parameters.AddWithValue("@_authorDeleted", MySqlDbType.Int16);
                cmd.Parameters["@_authorDeleted"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_authorDeleted"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool DeletePublisher(int e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "DeletePublisher";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_publisherID", e);
                cmd.Parameters["@_publisherID"].Direction = System.Data.ParameterDirection.Input;

                
                cmd.Parameters.AddWithValue("@_publisherDeleted", MySqlDbType.Int32);
                cmd.Parameters["@_publisherDeleted"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_publisherDeleted"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool DeleteCustomer(int e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "UDeleteCustomer";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_customerID", e);
                cmd.Parameters["@_customerID"].Direction = System.Data.ParameterDirection.Input;

                
                cmd.Parameters.AddWithValue("@_customerDeleted", MySqlDbType.Int32);
                cmd.Parameters["@_customerDeleted"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_customerDeleted"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool DeleteStock(int e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "DeleteStock";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_stockID", e);
                cmd.Parameters["@_stockID"].Direction = System.Data.ParameterDirection.Input;

                
                cmd.Parameters.AddWithValue("@_stockDeleted", MySqlDbType.Int16);
                cmd.Parameters["@_stockDeleted"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_stockDeleted"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool DeleteBook(int e)
        {


            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "DeleteBook";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_bookID", e);
                cmd.Parameters["@_bookID"].Direction = System.Data.ParameterDirection.Input;

                
                cmd.Parameters.AddWithValue("@_bookDeleted", MySqlDbType.Int16);
                cmd.Parameters["@_bookDeleted"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_bookDeleted"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool DeleteSale(int e)
        {


            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "DeleteSale";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_saleID", e);
                cmd.Parameters["@_saleID"].Direction = System.Data.ParameterDirection.Input;

                
                cmd.Parameters.AddWithValue("@_saleDeleted", MySqlDbType.Int16);
                cmd.Parameters["@_saleDeleted"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_saleDeleted"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        public bool DeleteSaleBasket(int e)
        {
            //open connection
            if (this.OpenConnection() == true)
            {

                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = connection;
                cmd.CommandText = "DeleteSaleBasket";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@_salebasketID", e);
                cmd.Parameters["@_saleBasketID"].Direction = System.Data.ParameterDirection.Input;

                
                cmd.Parameters.AddWithValue("@_salebasketDeleted", MySqlDbType.Int16);
                cmd.Parameters["@_salebasketDeleted"].Direction = System.Data.ParameterDirection.Output;

                //Execute command
                cmd.ExecuteNonQuery();


                bool ID = Convert.ToBoolean((int)cmd.Parameters["@_salebasketDeleted"].Value);

                //close connection
                this.CloseConnection();
                return ID;
            }
            else
            {
                return false;
            }
        }

        //Select statement
        public List<string>[] Select(string Q)
        {
            string query = Q;

            ////Create a list to store the result
            List<string>[] list = new List<string>[1];
            

            //Open connection
            if (this.OpenConnection() == true)
            {
                //Create Command
                MySqlCommand cmd = new MySqlCommand(query, connection);
                //Create a data reader and Execute the command
                MySqlDataReader dataReader = cmd.ExecuteReader();
                int amount = dataReader.FieldCount;
                list = new List<string>[amount];
                for(int x =0; x<amount; x++)
                {
                    list[x] = new List<string>();
                }

                //Read the data and store them in the list
                while (dataReader.Read())
                {
                    for (int x = 0; x < amount; x++)
                    {
                        list[x].Add(dataReader[x].ToString() + "");
                    }
                    
                }
                
                //close Data Reader
                dataReader.Close();

                //close Connection
                this.CloseConnection();

                //return list to be displayed
                return list;
            }
            else
            {
                return list;
            }
        }

        //Count statement
        public int Count(string Q)
        {
            string query = Q;
            int Count = -1;

            //Open Connection
            if (this.OpenConnection() == true)
            {
                //Create Mysql Command
                MySqlCommand cmd = new MySqlCommand(query, connection);

                //ExecuteScalar will return one value
                Count = int.Parse(cmd.ExecuteScalar() + "");

                //close Connection
                this.CloseConnection();

                return Count;
            }
            else
            {
                return Count;
            }
        }

        
    }
}
