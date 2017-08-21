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
    public partial class AddBook : UserControl
    {
        List<Author> list;
        List<Publisher> lis;
        public AddBook()
        {
            InitializeComponent();
        }

        private void Employees_Load(object sender, EventArgs e)
        {
            List<string> val3 = new List<string>();
            val3.Add("Sold");
            val3.Add("Available");

            comboBoxStatus.DataSource = val3;

            List<string> val1 = new List<string>();
            DataClasses.Transformation trans = new DataClasses.Transformation();
            string query = "SELECT * FROM author;";            
            list = trans.transformAuth(((Form1)this.Parent.Parent).con.Select(query));
            for(int i =0; i < list.Count; i++)
            {
                val1.Add(list[i].name + " " + list[i].surname);
            }
            comboBoxAuthor.DataSource = val1;

           
            List<string> val2 = new List<string>();
            string quer = "SELECT * FROM publisher;";
            lis = trans.transformPub(((Form1)this.Parent.Parent).con.Select(quer));
            for (int i = 0; i < lis.Count; i++)
            {
                val2.Add(lis[i].name);
            }
            comboBoxPub.DataSource = val2;
        }

        private void button2_Click(object sender, EventArgs e)
        {
           
            label12.Visible = false;
            label14.Visible = false;
            richTextBox1.Visible = false;

            if (txtName.Text == "" || txtISBN.Text == "" || txtPrice.Text == "" || comboBoxAuthor.SelectedItem == null || comboBoxPub.SelectedItem == null || txtQuantity.Text == "" || comboBoxStatus.SelectedItem ==null )
            {
                label12.Visible = true;
                richTextBox1.Visible = true;
            }
            else
            {
                ///////////////////////CHECKS//////////////////
                
                bool name = Regex.IsMatch(txtName.Text, @"^[a-zA-Z ]+$");
               bool price = Regex.IsMatch(txtPrice.Text, @"^\d*\,?\d+$");




                //////////////////////CHECKS//////////////////
                if (!name || !price )
                {
                    
                    label12.Visible = true;
                    richTextBox1.Visible = true;

                }
                else
                {
                    Book emp = new Book();
                    DataClasses.Transformation trans = new DataClasses.Transformation();
                    string where = "isbn = '" + txtISBN.Text  + "' && name ='" + txtName + "'";
                    string query = emp.Read(where);
                    List<Book> li = trans.transformBook(((Form1)this.Parent.Parent).con.Select(query));

                    int existing = li.Count;
                    
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
                            DataClasses.Stock s = new DataClasses.Stock();
                            emp.name = txtName.Text;
                            emp.isbn = txtISBN.Text;
                            emp.price = Convert.ToDecimal(txtPrice.Text);
                            s.quantity = Convert.ToInt32(txtQuantity.Text);
                            s.storeID = 1;
                            emp.status = comboBoxStatus.SelectedItem.ToString();
                            emp.authorID = list[comboBoxAuthor.SelectedIndex].authorID;
                            emp.publisherID = lis[comboBoxPub.SelectedIndex].publisherID;

                            //string q = emp.insert();
                            int empID =((Form1)this.Parent.Parent).con.InsertBook(emp);
                            if (empID == -1)
                            {
                                if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Comic Book was not Added!"))
                                {
                                    ((Form1)this.Parent.Parent).ChangeView<ComicBooks>();
                                }

                            }
                            else
                            {
                                s.bookID = empID;
                                int sID = ((Form1)this.Parent.Parent).con.InsertStock(s);
                                if (sID == -1)
                                {
                                    if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Comic Book was not Added!"))
                                    {
                                        ((Form1)this.Parent.Parent).ChangeView<ComicBooks>();
                                    }
                                }
                                else
                                {
                                    if (DialogResult.OK == MessageBox.Show("The Comic Book was added successfully!" + Environment.NewLine + "Comic Book ID:   " + empID.ToString()))
                                    {
                                        ((Form1)this.Parent.Parent).ChangeView<ComicBooks>();
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
            ((Form1)this.Parent.Parent).ChangeView<ComicBooks>();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            button2.Enabled = false;
            comboBoxAuthor.Enabled = false;
            comboBoxPub.Enabled = false;
            
            

            ChangeView<AddAuthor>();
        }

        public void ChangeView<T>() where T : Control, new()
        {
            try
            {

                panel1.Controls.Clear();
                T find = new T();
                find.Parent = panel1;
                find.Dock = DockStyle.Fill;
                find.BringToFront();
            }
            catch
            {

            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            button2.Enabled = false;
            comboBoxAuthor.Enabled = false;
            comboBoxPub.Enabled = false;
            ChangeView<Pages.AddPublisher>();
        }

        public void doneAuthor()
        {
            panel1.Controls.Clear();
            comboBoxAuthor.DataSource = null;
            list.Clear();
            List<string> val1 = new List<string>();
            DataClasses.Transformation trans = new DataClasses.Transformation();
            string query = "SELECT * FROM author;";
            list = trans.transformAuth(((Form1)this.Parent.Parent).con.Select(query));
            for (int i = 0; i < list.Count; i++)
            {
                val1.Add(list[i].name + " " + list[i].surname);
            }
            comboBoxAuthor.DataSource = val1;
            button2.Enabled = true;
            comboBoxAuthor.Enabled = true;
            comboBoxPub.Enabled = true;
        }

        public void donePublisher()
        {
            panel1.Controls.Clear();
            comboBoxPub.DataSource = null;
            lis.Clear();
            DataClasses.Transformation trans = new DataClasses.Transformation();
            List<string> val2 = new List<string>();
            string quer = "SELECT * FROM publisher;";
            lis = trans.transformPub(((Form1)this.Parent.Parent).con.Select(quer));
            for (int i = 0; i < lis.Count; i++)
            {
                val2.Add(lis[i].name);
            }
            comboBoxPub.DataSource = val2;

            button2.Enabled = true;
            comboBoxAuthor.Enabled = true;
            comboBoxPub.Enabled = true;
        }
    }
}
