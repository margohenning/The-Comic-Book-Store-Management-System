using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook
{
    public class Publisher
    {
        public int publisherID { get; set; }
        public string name { get; set; }
        


        public Publisher()
        {

        }

        public string Read(string where)
        {
            string query = "SELECT * FROM publisher WHERE " + where + ";";
            return query;



        }
    }
}
