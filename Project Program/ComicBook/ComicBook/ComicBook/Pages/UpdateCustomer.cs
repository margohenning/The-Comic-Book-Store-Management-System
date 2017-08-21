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
    public partial class UpdateCustomer : UserControl
    {
        //Employee em = new Employee();
        int ID;
        List<Customer> list;
        public UpdateCustomer()
        {
            InitializeComponent();
        }

        private void Employees_Load(object sender, EventArgs e)
        {
            string query = "SELECT * FROM customer;";
            DataClasses.Transformation trans = new DataClasses.Transformation();
            List<Customer> list = trans.transformCust(((Form1)this.Parent.Parent).con.Select(query));

            for (int x = 0; x < list.Count; x++)
            {
                dataGridView1.Rows.Add(list[x].customerID, list[x].name, list[x].surname, list[x].email);


            }
            dataGridView1.Refresh();

            List<string> val1 = new List<string>();
            val1.Add("True");
            val1.Add("False");

            List<string> val2 = new List<string>();
            val2.Add("True");
            val2.Add("False");

            dataGridView1.ClearSelection();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedCells.Count == 0)
            {

            }
            else { 
            label12.Visible = false;
            label14.Visible = false;
            richTextBox1.Visible = false;

                if (txtName.Text == "" || txtSur.Text == "" || txtEmail.Text == "")
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
                    if (!isEmail || !name || !sName)
                    {

                        label12.Visible = true;
                        richTextBox1.Visible = true;

                    }
                    else
                    {
                        Customer emp = new Customer();
                        
                            try
                            {

                                label14.Visible = false;
                                label12.Visible = false;
                                richTextBox1.Visible = false;
                                emp.customerID = Convert.ToInt32(emm.Text);

                                emp.name = txtName.Text;
                                emp.surname = txtSur.Text;
                                emp.email = txtEmail.Text;

                                //string q = emp.insert();
                                bool empp = ((Form1)this.Parent.Parent).con.UpdateCustomer(emp);
                                if (empp == false)
                                {
                                    if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Customer was not Updated!"))
                                    {
                                        ((Form1)this.Parent.Parent).ChangeView<Customers>();
                                    }

                                }
                                else
                                {
                                    if (DialogResult.OK == MessageBox.Show("The Customer was updated successfully!" + Environment.NewLine + "Customer ID:   " + emm.Text))
                                    {
                                        ((Form1)this.Parent.Parent).ChangeView<Customers>();
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
            ((Form1)this.Parent.Parent).ChangeView<Customers>();
        }

       

        private void dataGridView1_SelectionChanged_1(object sender, EventArgs e)
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



                }
            }
            else
            {

            }
        }
    }
    
}
