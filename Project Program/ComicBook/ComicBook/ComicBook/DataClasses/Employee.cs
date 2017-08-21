using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook
{
    public class Employee
    {
        public int employeeID { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public string email { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public bool AdminPrivileges { get; set; }
        public bool activated { get; set; }

        public Employee()
        {

        }

        

        public string Read(string where)
        {
            string query = "SELECT * FROM employee WHERE " + where + ";";
            return query;
            


        }

        
    }
}
