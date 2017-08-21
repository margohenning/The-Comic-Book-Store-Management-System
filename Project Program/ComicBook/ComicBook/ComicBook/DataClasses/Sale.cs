using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook
{
    public class Sale
    {
        public int saleID { get; set; }
        public int customerID { get; set; }
        public int employeeID { get; set; }
        public DateTime date { get; set; }
        public decimal totalPrice { get; set; }

        public Sale()
        {

        }

        public string Read(string where)
        {
            string query = "SELECT * FROM sale WHERE " + where + ";";
            return query;



        }
    }
}
