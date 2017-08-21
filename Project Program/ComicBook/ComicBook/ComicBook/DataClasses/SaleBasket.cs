using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook
{
    public class SaleBasket
    {
        public int saleBasketID { get; set; }
        public int saleID { get; set; }
        public int bookID { get; set; }
        public int quantity { get; set; }

        public SaleBasket()
        {

        }

        public string Read(string where)
        {
            string query = "SELECT * FROM salebasket WHERE " + where + ";";
            return query;



        }
    }
}
