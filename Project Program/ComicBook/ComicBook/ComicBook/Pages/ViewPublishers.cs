using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ComicBook.Pages
{
    public partial class ViewPublishers : UserControl
    {
        public ViewPublishers()
        {
            InitializeComponent();
        }

        private void ViewAuthors_Load(object sender, EventArgs e)
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
        }
    }
}
