using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Text.RegularExpressions;

namespace ComicBook.Pages
{
    public partial class AddEmployee : UserControl
    {
        public AddEmployee()
        {
            InitializeComponent();
        }

        private void Employees_Load(object sender, EventArgs e)
        {
            List<string> val1 = new List<string>();
            val1.Add("True");
            val1.Add("False");

            List<string> val2 = new List<string>();
            val2.Add("True");
            val2.Add("False");

            comboBoxAdmin.DataSource = val1;
            comboBoxActiv.DataSource = val2;
        }

        private void button2_Click(object sender, EventArgs e)
        {
           
            label12.Visible = false;
            label14.Visible = false;
            richTextBox1.Visible = false;
            
            if (txtName.Text == "" || txtSur.Text == "" ||  txtEmail.Text == "" || comboBoxAdmin.SelectedItem == null ||  comboBoxActiv.SelectedItem == null || txtPassword.Text == "" || txtUsername.Text == "" )
            {
                label12.Visible = true;
                richTextBox1.Visible = true;
            }
            else
            {
                ///////////////////////CHECKS//////////////////
                bool isEmail = Regex.IsMatch(txtEmail.Text, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
                bool name = Regex.IsMatch(txtName.Text, @"^[a-zA-Z ]+$");
                bool sName = Regex.IsMatch(txtSur.Text, @"^[a-zA-Z ]+$");
               

                int exist;

                

                //////////////////////CHECKS//////////////////
                if (!isEmail  || !name || !sName  )
                {
                    
                    label12.Visible = true;
                    richTextBox1.Visible = true;

                }
                else
                {
                    Employee emp = new Employee();
                    DataClasses.Transformation trans = new DataClasses.Transformation();
                    string where = "employeeUsername = '" + txtUsername.Text  + "'";
                    string query = emp.Read(where);
                    List<Employee> list = trans.transformEmp(((Form1)this.Parent.Parent).con.Select(query));

                    int existing = list.Count;
                    
                    if (existing >0)
                    {
                        label14.Visible = true;
                    }
                    else
                    {
                        try
                        {

                            label14.Visible = false;
                            label12.Visible = false;
                            richTextBox1.Visible = false;
                            
                            emp.name = txtName.Text;
                            emp.surname = txtSur.Text;
                            emp.email = txtEmail.Text;
                            emp.username = txtUsername.Text;
                            emp.password = txtPassword.Text;
                            emp.AdminPrivileges = Convert.ToBoolean(comboBoxAdmin.SelectedItem.ToString());
                            emp.activated = Convert.ToBoolean(comboBoxActiv.SelectedItem.ToString());
                            //string q = emp.insert();
                            int empID =((Form1)this.Parent.Parent).con.InsertEmployee(emp);
                            if (empID == -1)
                            {
                                if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Employee was not Added!"))
                                {
                                    ((Form1)this.Parent.Parent).ChangeView<Employees>();
                                }

                            }
                            else
                            {
                                if (DialogResult.OK == MessageBox.Show("The Employee was added successfully!" + Environment.NewLine + "Employee ID:   " + empID.ToString()))
                                {
                                    ((Form1)this.Parent.Parent).ChangeView<Employees>();
                                }
                            }

                        }
                        catch (Exception ex)
                        {
                            label12.Visible = true;
                        }
                    }
                }


            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ((Form1)this.Parent.Parent).ChangeView<Employees>();
        }
    }
}
