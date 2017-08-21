using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook
{
    public class Customer
    {
        public int customerID { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public string email { get; set; }
       

        public Customer()
        {

        }

        public string Read(string where)
        {
            string query = "SELECT * FROM customer WHERE " + where + ";";
            return query;



        }
    }
}
