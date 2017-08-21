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
    public partial class AddCustomer : UserControl
    {
        string what;
        public AddCustomer()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            label12.Visible = false;
            
            richTextBox1.Visible = false;

            if (txtName.Text == "" || txtSur.Text == "" )
            {
                label12.Visible = true;
                richTextBox1.Visible = true;
            }
            else
            {
                ///////////////////////CHECKS//////////////////
                
                bool name = Regex.IsMatch(txtName.Text, @"^[a-zA-Z ]+$");
                bool sName = Regex.IsMatch(txtSur.Text, @"^[a-zA-Z ]+$");
                bool isEmail = Regex.IsMatch(txtEmail.Text, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);



                //////////////////////CHECKS//////////////////
                if ( !name || !sName ||!isEmail)
                {

                    label12.Visible = true;
                    richTextBox1.Visible = true;

                }
                else
                {
                    Customer emp = new Customer();
                    DataClasses.Transformation trans = new DataClasses.Transformation();
                    string where = "customerName = '" + txtName.Text + "' && customerSurname ='" + txtSur.Text + "'";
                    string query = emp.Read(where);
                    List<Customer> list = trans.transformCust(((Form1)this.Parent.Parent.Parent.Parent).con.Select(query));

                    int existing = list.Count;

                    if (existing > 0)
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
                            
                            //string q = emp.insert();
                            int empID = ((Form1)this.Parent.Parent.Parent.Parent).con.InsertCustomer(emp);
                            if (empID == -1)
                            {
                                if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Customer was not Added!"))
                                {
                                    if (what == "ComicBook.Pages.AddSale")
                                    {
                                        ((AddSale)this.Parent.Parent).doneCustomer();
                                    }
                                    
                                    
                                }

                            }
                            else
                            {
                                if (DialogResult.OK == MessageBox.Show("The Customer was added successfully!" + Environment.NewLine + "Customer ID:   " + empID.ToString()))
                                {
                                    if (what == "ComicBook.Pages.AddSale")
                                    {
                                        ((AddSale)this.Parent.Parent).doneCustomer();
                                    }
                                    

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
            if (what == "ComicBook.Pages.AddSale")
            {
                ((AddSale)this.Parent.Parent).doneCustomer();
            }
            
        }

        private void AddAuthor_Load(object sender, EventArgs e)
        {
            what = this.Parent.Parent.ToString();
            
        }
    }
}
