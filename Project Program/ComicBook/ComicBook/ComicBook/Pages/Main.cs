using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ComicBook.Pages
{
    public partial class Main : UserControl
    {
        public Main()
        {
            InitializeComponent();
        }

        private void Main_Load(object sender, EventArgs e)
        {
            Uname.Text = ((Form1)this.Parent.Parent).loggedIn;
            ((Form1)this.Parent.Parent).buttonBooks.Show();
            ((Form1)this.Parent.Parent).buttonCustomers.Show();
            ((Form1)this.Parent.Parent).buttonEmp.Show();
            ((Form1)this.Parent.Parent).buttonSales.Show();
            ((Form1)this.Parent.Parent).btnlogout.Show();
            ((Form1)this.Parent.Parent).lbllogout.Show();

        }
    }
}
