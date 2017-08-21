using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook.DataClasses
{
    public class Stock
    {
        public int stockID { get; set; }
        public int bookID { get; set; }
        public int storeID { get; set; }
        public int quantity { get; set; }

        public Stock()
        {

        }

        public string Read(string where)
        {
            string query = "SELECT * FROM stock WHERE " + where + ";";
            return query;



        }
    }
}
