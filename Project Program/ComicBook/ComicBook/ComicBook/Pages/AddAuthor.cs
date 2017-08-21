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
    public partial class AddAuthor : UserControl
    {
        string what;
        public AddAuthor()
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


                

                //////////////////////CHECKS//////////////////
                if ( !name || !sName)
                {

                    label12.Visible = true;
                    richTextBox1.Visible = true;

                }
                else
                {
                    Author emp = new Author();
                    DataClasses.Transformation trans = new DataClasses.Transformation();
                    string where = "authorName = '" + txtName.Text + "' && authorSurname ='" + txtSur.Text + "'";
                    string query = emp.Read(where);
                    List<Author> list = trans.transformAuth(((Form1)this.Parent.Parent.Parent.Parent).con.Select(query));

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
                            
                            //string q = emp.insert();
                            int empID = ((Form1)this.Parent.Parent.Parent.Parent).con.InsertAuthor(emp);
                            if (empID == -1)
                            {
                                if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Author was not Added!"))
                                {
                                    if (what == "ComicBook.Pages.AddBook")
                                    {
                                        ((AddBook)this.Parent.Parent).doneAuthor();
                                    }
                                    else if (what == "ComicBook.Pages.Authors")
                                    {
                                        ((Authors)this.Parent.Parent).doneAuthor();
                                    }
                                    else
                                    {
                                        ((UpdateBook)this.Parent.Parent).doneAuthor();
                                    }
                                }

                            }
                            else
                            {
                                if (DialogResult.OK == MessageBox.Show("The Author was added successfully!" + Environment.NewLine + "Author ID:   " + empID.ToString()))
                                {
                                    if(what == "ComicBook.Pages.AddBook")
                                    {
                                        ((AddBook)this.Parent.Parent).doneAuthor();
                                    }
                                    else if(what== "ComicBook.Pages.Authors")
                                    {
                                        ((Authors)this.Parent.Parent).doneAuthor();
                                    }
                                    else
                                    {
                                        ((UpdateBook)this.Parent.Parent).doneAuthor();
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

        private void AddAuthor_Load(object sender, EventArgs e)
        {
            what = this.Parent.Parent.ToString();
            if (what == "ComicBook.Pages.Authors")
            {
                button1.Hide();
                label3.Hide();
            }
        }
    }
}
