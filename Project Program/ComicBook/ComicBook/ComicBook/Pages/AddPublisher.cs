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
    public partial class AddPublisher : UserControl
    {
        string what;
        public AddPublisher()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            label12.Visible = false;
            
            richTextBox1.Visible = false;

            if (txtName.Text == "" )
            {
                label12.Visible = true;
                richTextBox1.Visible = true;
            }
            else
            {
                ///////////////////////CHECKS//////////////////
                
                bool name = Regex.IsMatch(txtName.Text, @"^[a-zA-Z ]+$");
                


                

                //////////////////////CHECKS//////////////////
                if ( !name )
                {

                    label12.Visible = true;
                    richTextBox1.Visible = true;

                }
                else
                {
                    Publisher emp = new Publisher();
                    DataClasses.Transformation trans = new DataClasses.Transformation();
                    string where = "publisherName = '" + txtName.Text + "'";
                    string query = emp.Read(where);
                    List<Publisher> list = trans.transformPub(((Form1)this.Parent.Parent.Parent.Parent).con.Select(query));

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
                           
                            
                            //string q = emp.insert();
                            int empID = ((Form1)this.Parent.Parent.Parent.Parent).con.InsertPublisher(emp);
                            if (empID == -1)
                            {
                                if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Publisher was not Added!"))
                                {
                                    if (what == "ComicBook.Pages.AddBook")
                                    {
                                        ((AddBook)this.Parent.Parent).donePublisher();
                                    }
                                    else if (what == "ComicBook.Pages.Publishers")
                                    {
                                        ((Publishers)this.Parent.Parent).donePublisher();
                                    }
                                    else
                                    {
                                        ((UpdateBook)this.Parent.Parent).donePublisher();
                                    }
                                }

                            }
                            else
                            {
                                if (DialogResult.OK == MessageBox.Show("The Publisher was added successfully!" + Environment.NewLine + "Publisher ID:   " + empID.ToString()))
                                {
                                    if (what == "ComicBook.Pages.AddBook")
                                    {
                                        ((AddBook)this.Parent.Parent).donePublisher();
                                    }
                                    else if (what == "ComicBook.Pages.Publishers")
                                    {
                                        ((Publishers)this.Parent.Parent).donePublisher();
                                    }
                                    else
                                    {
                                        ((UpdateBook)this.Parent.Parent).donePublisher();
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
            if (what == "ComicBook.Pages.AddBook")
            {
                ((AddBook)this.Parent.Parent).donePublisher();
            }
            else
            {
                ((UpdateBook)this.Parent.Parent).donePublisher();
            }
        }

        private void AddPublisher_Load(object sender, EventArgs e)
        {
            what = this.Parent.Parent.ToString();
            if (what == "ComicBook.Pages.Publishers")
            {
                button1.Hide();
                label3.Hide();
            }
        }
    }
}
