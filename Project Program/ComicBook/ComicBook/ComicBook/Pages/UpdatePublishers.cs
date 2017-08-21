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
    public partial class UpdatePublishers : UserControl
    {
        string what;
        int ID;
        public UpdatePublishers()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            label12.Visible = false;
            
            richTextBox1.Visible = false;

            if (txtName.Text == ""  )
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
                   
                        try
                        {

                            label14.Visible = false;
                            label12.Visible = false;
                            richTextBox1.Visible = false;
                            emp.publisherID = ID;
                            emp.name = txtName.Text;
                            
                            
                            //string q = emp.insert();
                            bool empID = ((Form1)this.Parent.Parent.Parent.Parent).con.UpdatePublisher(emp);
                            if (empID == false)
                            {
                                if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Publisher was not Updated!"))
                                {
                                    ((Form1)this.Parent.Parent).ChangeView<Publishers>();
                                }

                            }
                            else
                            {
                                if (DialogResult.OK == MessageBox.Show("The Publisher was updated successfully!" + Environment.NewLine + "Publisher ID:   " + emp.publisherID.ToString()))
                                {
                                    if(what == "ComicBook.Pages.AddBook")
                                    {
                                        ((AddBook)this.Parent.Parent).donePublisher();
                                    }
                                    else if(what== "ComicBook.Pages.Publishers")
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
            string query = "SELECT * FROM publisher;";
            DataClasses.Transformation trans = new DataClasses.Transformation();
            List<Publisher> list = trans.transformPub(((Form1)this.Parent.Parent.Parent.Parent).con.Select(query));

            for (int x = 0; x < list.Count; x++)
            {
                dataGridView1.Rows.Add(list[x].publisherID, list[x].name);


            }
            dataGridView1.Refresh();
            dataGridView1.ClearSelection();

            what = this.Parent.Parent.ToString();
            
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
                    

                    



                }
            }
            else
            {

            }
        }
    }
}
