using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ComicBook
{
    public partial class Form1 : System.Windows.Forms.Form
    {
        public string loggedIn = "";
        public Employee user;
        public DBConnect con = new DBConnect();
        public Form1()
        {
            

            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
                    

            
            if (con.OpenConnection() == true)
            {
                if (DialogResult.OK == MessageBox.Show("You are connected to the database!"))
                {

                }
                
                lbldb.Text = "Yes";
                ChangeView<LogIn>();
                buttonBooks.Hide();
                buttonCustomers.Hide();
                buttonEmp.Hide();
                buttonSales.Hide();
                btnlogout.Hide();
                lbllogout.Hide();
                con.CloseConnection();
            }
            else
            {
                if (DialogResult.OK == MessageBox.Show("You are NOT connected to the database!"))
                {

                }
                lbldb.Text = "No";
            }
        }

        public void ChangeView<T>() where T : Control, new()
        {
            try
            {

                panel3.Controls.Clear();
                T find = new T();
                find.Parent = panel3;
                find.Dock = DockStyle.Fill;
                find.BringToFront();
            }
            catch(Exception ex)
            {

            }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            con.CloseConnection();
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            con.CloseConnection();
        }

        private void buttonBooks_Click(object sender, EventArgs e)
        {
            ChangeView<Pages.ComicBooks>();
        }

        private void buttonSales_Click(object sender, EventArgs e)
        {
            ChangeView<Pages.Sales>();
        }

        private void buttonCustomers_Click(object sender, EventArgs e)
        {
            ChangeView<Pages.Customers>();
        }

        private void buttonEmp_Click(object sender, EventArgs e)
        {
            if (user.AdminPrivileges)
            {
                ChangeView<Pages.Employees>();
            }
            else
            {
                if (DialogResult.OK == MessageBox.Show("Sorry you do not have the necessary privileges to access Employee records!"))
                {
                    
                }
            }
            
        }

        private void btnlogin_Click(object sender, EventArgs e)
        {
            if (DialogResult.Yes == MessageBox.Show("Are you sure you want to log out?","",MessageBoxButtons.YesNo))
            {
                ChangeView<LogIn>();
                user = null;
                loggedIn = "";
                buttonBooks.Hide();
                buttonCustomers.Hide();
                buttonEmp.Hide();
                buttonSales.Hide();
                btnlogout.Hide();
                lbllogout.Hide();
                con.CloseConnection();
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (loggedIn != "")
            {
                ChangeView<Pages.Main>();
            }
            else { }
        }
    }
}
