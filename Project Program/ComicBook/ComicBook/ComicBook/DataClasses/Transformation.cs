using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComicBook.DataClasses
{
    class Transformation
    {
        public Transformation()
        {

        }

        public List<Employee> transformEmp(List<string>[] things)
        {
            List<Employee> list = new List<Employee>();
            for (int x = 0; x < things[0].Count(); x++)
            {
                Employee e = new Employee();
                e.employeeID = Int32.Parse(things[0][x]);
                e.name = things[1][x];
                e.surname = things[2][x];
                e.email = things[3][x];
                e.username = things[4][x];
                e.password = things[5][x];
                e.AdminPrivileges = Convert.ToBoolean(Convert.ToInt16(things[6][x]));
                e.activated = Convert.ToBoolean(Convert.ToInt16(things[7][x]));

                list.Add(e);
            }
            return list;
        }

        public List<Customer> transformCust(List<string>[] things)
        {
            List<Customer> list = new List<Customer>();
            for (int x = 0; x < things[0].Count(); x++)
            {
                Customer c = new Customer();
                c.customerID = Int32.Parse(things[0][x]);
                c.name = things[1][x];
                c.surname = things[2][x];
                c.email = things[3][x];
               

                list.Add(c);
            }
            return list;
        }

        public List<Sale> transformSale(List<string>[] things)
        {
            List<Sale> list = new List<Sale>();
            for (int x = 0; x < things[0].Count(); x++)
            {
                Sale s = new Sale();
                s.saleID = Int32.Parse(things[0][x]);
                s.customerID = Int32.Parse(things[1][x]);
                s.employeeID= Int32.Parse(things[2][x]);
                s.date = DateTime.Parse(things[3][x]);
                s.totalPrice = Decimal.Parse(things[4][x]);
                


                list.Add(s);
            }
            return list;
        }

        public List<SaleVW> transformSaleVW(List<string>[] things)
        {
            List<SaleVW> list = new List<SaleVW>();
            for (int x = 0; x < things[0].Count(); x++)
            {
                SaleVW s = new SaleVW();
                s.saleID = Int32.Parse(things[0][x]);
                s.SaleDate = DateTime.Parse(things[1][x]);
                s.amountBooks = Int32.Parse(things[2][x]);
                s.totalPrice = Decimal.Parse(things[3][x]);
                s.Cname = things[4][x];
                s.Csurname = things[5][x];
                s.Cemail = things[6][x];
                s.Ename = things[7][x];
                s.Esurname = things[8][x];

                list.Add(s);
            }
            return list;
        }

        public List<BookInfo> transformBookInfo(List<string>[] things)
        {
            List<BookInfo> list = new List<BookInfo>();
            for (int x = 0; x < things[0].Count(); x++)
            {
                BookInfo s = new BookInfo();
                s.bookID = Int32.Parse(things[0][x]);
                s.name = things[1][x];
                s.isbn = things[2][x];
                s.price = Decimal.Parse(things[3][x]);
                s.status = things[4][x];
                s.AuthorID = Int32.Parse(things[5][x]);
                s.Aname = things[6][x];
                s.Asurname = things[7][x];
                s.PublisherID = Int32.Parse(things[8][x]);
                s.Pname = things[9][x];
                s.quantity = Int32.Parse(things[10][x]);


                list.Add(s);
            }
            return list;
        }

        public List<Book> transformBook(List<string>[] things)
        {
            List<Book> list = new List<Book>();
            for (int x = 0; x < things[0].Count(); x++)
            {
                Book s = new Book();
                s.bookID = Int32.Parse(things[0][x]);
                s.authorID = Int32.Parse(things[1][x]);
                s.publisherID = Int32.Parse(things[2][x]);
                s.name = things[3][x];
                s.isbn = things[4][x];
                s.price = Decimal.Parse(things[5][x]);
                s.status = things[6][x];
               


                list.Add(s);
            }
            return list;
        }

        public List<Author> transformAuth(List<string>[] things)
        {
            List<Author> list = new List<Author>();
            for (int x = 0; x < things[0].Count(); x++)
            {
                Author c = new Author();
                c.authorID = Int32.Parse(things[0][x]);
                c.name = things[1][x];
                c.surname = things[2][x];
               


                list.Add(c);
            }
            return list;
        }

        public List<Publisher> transformPub(List<string>[] things)
        {
            List<Publisher> list = new List<Publisher>();
            for (int x = 0; x < things[0].Count(); x++)
            {
                Publisher c = new Publisher();
                c.publisherID = Int32.Parse(things[0][x]);
                c.name = things[1][x];
                



                list.Add(c);
            }
            return list;
        }


    }
}
