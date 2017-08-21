using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook
{
    public class Author
    {
        public int authorID { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        
        public Author()
        {

        }

        public string Read(string where)
        {
            string query = "SELECT * FROM author WHERE " + where + ";";
            return query;



        }
    }
}
