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
    public partial class UpdateBook : UserControl
    {
        string whatChecked = "";
        //Employee em = new Employee();
        int ID;
        List<DataClasses.BookInfo> listt;
        List<Author> list;
        List<Publisher> lis;
        public UpdateBook()
        {
            InitializeComponent();
        }

        private void Employees_Load(object sender, EventArgs e)
        {
            radioButton1.Checked = true;
            List<string> val3 = new List<string>();
            val3.Add("Sold");
            val3.Add("Available");

            comboBoxStatus.DataSource = val3;

            List<string> val1 = new List<string>();
            DataClasses.Transformation trans = new DataClasses.Transformation();
            string query = "SELECT * FROM author;";
            list = trans.transformAuth(((Form1)this.Parent.Parent).con.Select(query));
            for (int i = 0; i < list.Count; i++)
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
            dataGridView1.ClearSelection();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            label12.Visible = false;
            label14.Visible = false;
            richTextBox1.Visible = false;

            if (txtName.Text == "" || txtISBN.Text == "" || txtPrice.Text == "" || comboBoxAuthor.SelectedItem == null || comboBoxPub.SelectedItem == null || txtQuantity.Text == "" || comboBoxStatus.SelectedItem == null)
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
                if (!name || !price)
                {

                    label12.Visible = true;
                    richTextBox1.Visible = true;

                }
                else
                {
                    Book emp = new Book();
                    

                    
                        try
                        {

                            label14.Visible = false;
                            label12.Visible = false;
                            richTextBox1.Visible = false;
                            DataClasses.Stock s = new DataClasses.Stock();
                            emp.bookID = Convert.ToInt32(emm.Text);
                            emp.name = txtName.Text;
                            emp.isbn = txtISBN.Text;
                            emp.price = Convert.ToDecimal(txtPrice.Text);
                            s.quantity = Convert.ToInt32(txtQuantity.Text);
                            s.storeID = 1;
                            s.bookID = emp.bookID;
                            emp.status = comboBoxStatus.SelectedItem.ToString();
                            emp.authorID = list[comboBoxAuthor.SelectedIndex].authorID;
                            emp.publisherID = lis[comboBoxPub.SelectedIndex].publisherID;
                            List<string>[] st =((Form1)this.Parent.Parent).con.Select("SELECT id_stock FROM stock WHERE id_store =1 && id_book = '"+ s.bookID+"' ;");
                            s.stockID = Convert.ToInt32(st[0][0]);
                        //string q = emp.insert();
                        bool empID = ((Form1)this.Parent.Parent).con.UpdateBook(emp);
                            if (empID == false)
                            {
                                if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Comic Book was not Updated!"))
                                {
                                    ((Form1)this.Parent.Parent).ChangeView<ComicBooks>();
                                }

                            }
                            else
                            {
                                
                                bool sID = ((Form1)this.Parent.Parent).con.UpdateStock(s);
                                if (sID == false)
                                {
                                    if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Comic Book was not Updated!"))
                                    {
                                        ((Form1)this.Parent.Parent).ChangeView<ComicBooks>();
                                    }
                                }
                                else
                                {
                                    if (DialogResult.OK == MessageBox.Show("The Comic Book was Updated successfully!" + Environment.NewLine + "Comic Book ID:   " + emp.bookID.ToString()))
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
            ChangeView<Pages.AddPublisher>();
            button2.Enabled = false;
            comboBoxAuthor.Enabled = false;
            comboBoxPub.Enabled = false;
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
                    DataClasses.BookInfo bi = listt[listt.FindIndex(w => w.bookID == Convert.ToInt32(emp))];
                    ID = Convert.ToInt32(emm.Text);
                    txtName.Text = bi.name;
                    txtISBN.Text = bi.isbn;
                    txtPrice.Text = bi.price.ToString();
                    txtQuantity.Text = bi.quantity.ToString();

                    comboBoxAuthor.SelectedIndex = list.FindIndex(j => j.authorID == bi.AuthorID);
                    comboBoxPub.SelectedIndex = lis.FindIndex(p => p.publisherID == bi.PublisherID);
                    comboBoxStatus.SelectedItem = bi.status;

                }
            }
            else
            {

            }
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton1.Checked)
            {
                whatChecked = "All";
                string query = "SELECT * FROM comic.vw_bookinfo;";
                DataClasses.Transformation trans = new DataClasses.Transformation();
                listt = trans.transformBookInfo(((Form1)this.Parent.Parent).con.Select(query));

                for (int x = 0; x < listt.Count; x++)
                {

                    dataGridView1.Rows.Add(listt[x].bookID, listt[x].name, listt[x].isbn, listt[x].price, listt[x].status, listt[x].quantity, listt[x].Aname, listt[x].Asurname, listt[x].Pname);


                }
                dataGridView1.Refresh();
            }
            else
            {
                dataGridView1.Rows.Clear();
            }
            dataGridView1.ClearSelection();
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton2.Checked)
            {
                whatChecked = "Available";
                string query = "SELECT * FROM comic.vw_available;";
                DataClasses.Transformation trans = new DataClasses.Transformation();
                listt = trans.transformBookInfo(((Form1)this.Parent.Parent).con.Select(query));

                for (int x = 0; x < listt.Count; x++)
                {

                    dataGridView1.Rows.Add(listt[x].bookID, listt[x].name, listt[x].isbn, listt[x].price, listt[x].status, listt[x].quantity, listt[x].Aname, listt[x].Asurname, listt[x].Pname);


                }
                dataGridView1.Refresh();
            }
            else
            {
                dataGridView1.Rows.Clear();
            }
            dataGridView1.ClearSelection();
        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton4.Checked)
            {
                whatChecked = "Sold";
                whatChecked = "Available";
                string query = "SELECT * FROM comic.vw_sold;";
                DataClasses.Transformation trans = new DataClasses.Transformation();
                listt = trans.transformBookInfo(((Form1)this.Parent.Parent).con.Select(query));

                for (int x = 0; x < listt.Count; x++)
                {

                    dataGridView1.Rows.Add(listt[x].bookID, listt[x].name, listt[x].isbn, listt[x].price, listt[x].status, listt[x].quantity, listt[x].Aname, listt[x].Asurname, listt[x].Pname);


                }
                dataGridView1.Refresh();

            }
            else
            {
                dataGridView1.Rows.Clear();
            }
            dataGridView1.ClearSelection();
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

    }
    
}
