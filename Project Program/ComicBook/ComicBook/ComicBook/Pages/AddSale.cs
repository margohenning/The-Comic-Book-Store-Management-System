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
    public partial class AddSale : UserControl
    {
        DataClasses.BookInfo bi;
        List<Customer> lis;
        int ID;
        List<DataClasses.BookInfo> listt;
        public AddSale()
        {
            InitializeComponent();
        }

        private void Employees_Load(object sender, EventArgs e)
        {
            lblEmp.Text = ((Form1)this.Parent.Parent).user.name + "" + ((Form1)this.Parent.Parent).user.surname;
                string query = "SELECT * FROM comic.vw_available;";
                DataClasses.Transformation trans = new DataClasses.Transformation();
                listt = trans.transformBookInfo(((Form1)this.Parent.Parent).con.Select(query));

            for (int x = 0; x < listt.Count; x++)
            {

                dataGridView1.Rows.Add(listt[x].bookID, listt[x].name, listt[x].isbn, listt[x].price, listt[x].quantity, listt[x].status,  listt[x].Aname, listt[x].Asurname, listt[x].Pname);

            }
               
                dataGridView1.Refresh();
           
            dataGridView1.ClearSelection();

           
            List<string> val2 = new List<string>();
            string quer = "SELECT * FROM customer;";
            lis = trans.transformCust(((Form1)this.Parent.Parent).con.Select(quer));
            for (int i = 0; i < lis.Count; i++)
            {
                val2.Add(lis[i].name +"" + lis[i].surname);
            }
            comboBoxPub.DataSource = val2;
        }

        private void button2_Click(object sender, EventArgs e)
        {
           
            label12.Visible = false;
            richTextBox1.Visible = false;

            if (comboBoxPub.SelectedItem == null || txtQuantity.Text == ""   )
            {
                label12.Visible = true;
                richTextBox1.Visible = true;
            }
            else
            {
                ///////////////////////CHECKS//////////////////
                
                bool quantity = Regex.IsMatch(txtQuantity.Text, @"^\d+$");
               
                

                //////////////////////CHECKS//////////////////
                if (!quantity || bi.quantity<Convert.ToInt32(txtQuantity.Text) )
                {
                    
                    label12.Visible = true;
                    richTextBox1.Visible = true;

                }
                else
                {
                   
                        try
                        {

                            Sale emp = new Sale();
                            label12.Visible = false;
                            richTextBox1.Visible = false;
                            SaleBasket s = new SaleBasket();
                            s.quantity = Convert.ToInt32(txtQuantity.Text);
                            s.bookID = bi.bookID;
                            emp.employeeID = ((Form1)this.Parent.Parent).user.employeeID;
                            emp.date = DateTime.UtcNow.ToLocalTime();
                            emp.customerID = lis[comboBoxPub.SelectedIndex].customerID;
                            emp.totalPrice = ((bi.price)*(s.quantity));
                            

                        //string q = emp.insert();
                        int empID =((Form1)this.Parent.Parent).con.InsertSale(emp);
                            if (empID == -1)
                            {
                                if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Sale was not Added!"))
                                {
                                    ((Form1)this.Parent.Parent).ChangeView<Sales>();
                                }

                            }
                            else
                            {
                                s.saleID = empID;
                                int sID = ((Form1)this.Parent.Parent).con.InsertSaleBasket(s);
                            if (sID == -1)
                            {
                                if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Sale was not Added!"))
                                {
                                    ((Form1)this.Parent.Parent).ChangeView<Sales>();
                                }
                            }
                            else
                            {
                                DataClasses.Stock st = new DataClasses.Stock();
                                st.quantity = (bi.quantity) - (s.quantity);
                                st.storeID = 1;
                                st.bookID = bi.bookID;
                                List<string>[] sto = ((Form1)this.Parent.Parent).con.Select("SELECT id_stock FROM stock WHERE id_store =1 && id_book = '" + s.bookID + "' ;");
                                st.stockID = Convert.ToInt32(sto[0][0]);
                                bool su = ((Form1)this.Parent.Parent).con.UpdateStock(st);
                                if (su == false)
                                {
                                    if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Sale was not Added!"))
                                    {
                                        ((Form1)this.Parent.Parent).ChangeView<Sales>();
                                    }
                                }
                                else
                                {
                                    if (DialogResult.OK == MessageBox.Show("The Sale was added successfully!" + Environment.NewLine + "Sale ID:   " + empID.ToString()))
                                    {
                                        ((Form1)this.Parent.Parent).ChangeView<Sales>();
                                    }
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
            ((Form1)this.Parent.Parent).ChangeView<Sales>();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            button2.Enabled = false;
           
            comboBoxPub.Enabled = false;
            
            

            ChangeView<AddCustomer>();
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

        

        public void doneCustomer()
        {
            panel1.Controls.Clear();
            comboBoxPub.DataSource = null;
            lis.Clear();
            List<string> val1 = new List<string>();
            DataClasses.Transformation trans = new DataClasses.Transformation();
            string query = "SELECT * FROM customer;";
            lis = trans.transformCust(((Form1)this.Parent.Parent).con.Select(query));
            for (int i = 0; i < lis.Count; i++)
            {
                val1.Add(lis[i].name + " " + lis[i].surname);
            }
            comboBoxPub.DataSource = val1;
            button2.Enabled = true;
            comboBoxPub.Enabled = true;
            
        }

        
        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count >= 1)
            {
                using (DataGridViewRow item = this.dataGridView1.SelectedRows[0])
                {

                    int i = item.Index;
                    string emp = dataGridView1.Rows[i].Cells[0].Value.ToString();
                    
                    bi = listt[listt.FindIndex(w => w.bookID == Convert.ToInt32(emp))];
                    ID = Convert.ToInt32(emp);
                    
                    lblName.Text = bi.name;
                    lblISBN.Text = bi.isbn;
                    lblprice.Text = bi.price.ToString();
                    

                    
                                       

                }
            }
            else
            {

            }
        }
    }
}
