using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook
{
    public class Book
    {
        public int bookID { get; set; }
        public int authorID { get; set; }
        public int publisherID { get; set; }
        public string name { get; set; }
        public string isbn { get; set; }
        public decimal price { get; set; }
        public string status { get; set; }
       
        public Book()
        {

        }

        public string Read(string where)
        {
            string query = "SELECT * FROM book WHERE " + where + ";";
            return query;



        }
    }
}
