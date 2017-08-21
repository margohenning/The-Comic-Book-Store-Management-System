using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook
{
    class Store
    {
        public int storeID { get; set;}
        public string name { get; set;}
        public string email { get; set;}
        public string number { get; set;}
       

        public Store()
        {

        }

        public string Read(string where)
        {
            string query = "SELECT * FROM store WHERE " + where + ";";
            return query;



        }
    }
}
