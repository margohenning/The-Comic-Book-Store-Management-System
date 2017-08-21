using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook.DataClasses
{
    class BookInfo
    {
        public string name { get; set; }
        public int bookID { get; set; }
        public int AuthorID { get; set; }
        public int PublisherID { get; set; }
        public string isbn { get; set; }
        public decimal price { get; set; }
        public string status { get; set; }
        public string Aname { get; set; }
        public string Asurname { get; set; }
        public string Pname { get; set; }
        public int quantity { get; set; }
        
        public BookInfo() { }
    }
}
