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
    public partial class UpdateEmployee : UserControl
    {
        //Employee em = new Employee();
        int ID;
        List<Employee> list;
        public UpdateEmployee()
        {
            InitializeComponent();
        }

        private void Employees_Load(object sender, EventArgs e)
        {
            string query = "SELECT * FROM employee;";
            DataClasses.Transformation trans = new DataClasses.Transformation();
            list = trans.transformEmp(((Form1)this.Parent.Parent).con.Select(query));

            for (int x = 0; x < list.Count; x++)
            {
                dataGridView1.Rows.Add(list[x].employeeID, list[x].name, list[x].surname, list[x].email, list[x].AdminPrivileges, list[x].activated);


            }
            dataGridView1.Refresh();

            List<string> val1 = new List<string>();
            val1.Add("True");
            val1.Add("False");

            List<string> val2 = new List<string>();
            val2.Add("True");
            val2.Add("False");

            comboBoxAdmin.DataSource = val1;
            comboBoxActiv.DataSource = val2;
            dataGridView1.ClearSelection();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedCells.Count == 0)
            {

            }
            else
            {
                label12.Visible = false;
                label14.Visible = false;
                richTextBox1.Visible = false;

                if (txtName.Text == "" || txtSur.Text == "" || txtEmail.Text == "" || comboBoxAdmin.SelectedItem == null || comboBoxActiv.SelectedItem == null || txtPassword.Text == "" || txtUsername.Text == "")
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


                    



                    //////////////////////CHECKS//////////////////
                    if (!isEmail || !name || !sName)
                    {

                        label12.Visible = true;
                        richTextBox1.Visible = true;

                    }
                    else
                    {
                        Employee emp = new Employee();
                        
                            try
                            {

                                label14.Visible = false;
                                label12.Visible = false;
                                richTextBox1.Visible = false;
                                emp.employeeID = Convert.ToInt32(emm.Text);

                                emp.name = txtName.Text;
                                emp.surname = txtSur.Text;
                                emp.email = txtEmail.Text;
                                emp.username = txtUsername.Text;
                                emp.password = txtPassword.Text;
                                emp.AdminPrivileges = Convert.ToBoolean(comboBoxAdmin.SelectedItem.ToString());
                                emp.activated = Convert.ToBoolean(comboBoxActiv.SelectedItem.ToString());
                                //string q = emp.insert();
                                bool empp = ((Form1)this.Parent.Parent).con.UpdateEmployee(emp);
                                if (empp == false)
                                {
                                    if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Employee was not Updated!"))
                                    {
                                        ((Form1)this.Parent.Parent).ChangeView<Employees>();
                                    }

                                }
                                else
                                {
                                    if (DialogResult.OK == MessageBox.Show("The Employee was updated successfully!" + Environment.NewLine + "Employee ID:   " + emm.Text))
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

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count >= 1)
            {
                using (DataGridViewRow item = this.dataGridView1.SelectedRows[0])
                {

                    int i = item.Index;
                    string emp = dataGridView1.Rows[i].Cells[0].Value.ToString();
                    emm.Text = emp;
                    ID = Convert.ToInt32(emm.Text);
                    txtName.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
                    txtSur.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
                    
                    txtEmail.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
                   
                    if (dataGridView1.Rows[i].Cells[4].Value.ToString() == "True")
                    {
                        comboBoxAdmin.SelectedIndex = 0;
                    }
                    else
                    {
                        comboBoxAdmin.SelectedIndex = 1;
                    }
                    if (dataGridView1.Rows[i].Cells[5].Value.ToString() == "True")
                    {
                        comboBoxActiv.SelectedIndex = 0;
                    }
                    else
                    {
                        comboBoxActiv.SelectedIndex = 1;
                    }

                    txtUsername.Text = list.Find(x => x.employeeID == ID).username;
                    txtPassword.Text = list.Find(x => x.employeeID == ID).password;

                }
            }
            else
            {

            }
        }
    }
    
}
