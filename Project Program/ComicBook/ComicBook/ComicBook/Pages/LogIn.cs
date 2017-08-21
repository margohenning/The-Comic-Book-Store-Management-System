using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ComicBook
{
    public partial class LogIn : UserControl
    {
        public LogIn()
        {
            InitializeComponent();
        }

        

        private void btnlogin_Click_1(object sender, EventArgs e)
        {
            if (textBox1.Text == "" || textBox2.Text == "")
            {
                label4.Visible = true;
            }
            else
            {
                label4.Visible = false;
                string username = textBox1.Text;
                string pass = textBox2.Text;

                Employee emp = new Employee();
                DataClasses.Transformation trans = new DataClasses.Transformation();
                emp.username = textBox1.Text;
                emp.password = textBox2.Text;
                string where = "employeeUsername = '" + emp.username + "' && employeePassword ='" + emp.password+ "' && activated ='1'";
                string query = emp.Read(where);
                List<Employee> list = trans.transformEmp(((Form1)this.Parent.Parent).con.Select(query));
                
                int exist = list.Count;
                if (exist == 0)
                {
                    label4.Visible = true;
                }
                else
                {
                   
                   ((Form1)this.Parent.Parent).loggedIn = list[0].username;
                    ((Form1)this.Parent.Parent).user = new Employee();
                    ((Form1)this.Parent.Parent).user = list[0];
                    ((Form1)this.Parent.Parent).ChangeView<Pages.Main>();
                    

                }

            }
        }

        private void LogIn_Load(object sender, EventArgs e)
        {
            textBox2.UseSystemPasswordChar = true;
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked == true)
            {
                textBox2.UseSystemPasswordChar = false;
            }
            else
            {
                textBox2.UseSystemPasswordChar = true;
            }
        }
    }
}
