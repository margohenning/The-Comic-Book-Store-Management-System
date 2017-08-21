using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook.DataClasses
{
    class SaleVW
    {
        public int saleID { get; set; }
        public DateTime SaleDate { get; set; }
        public decimal totalPrice { get; set; }
        public int amountBooks { get; set; }
        public string Cname { get; set; }
        public string Csurname { get; set; }
        public string Cemail { get; set; }
        public string Ename { get; set; }
        public string Esurname { get; set; }


        public SaleVW()
        {

        }
    }
}
