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
    public partial class ViewAuthors : UserControl
    {
        public ViewAuthors()
        {
            InitializeComponent();
        }

        private void ViewAuthors_Load(object sender, EventArgs e)
        {
            string query = "SELECT * FROM author;";
            DataClasses.Transformation trans = new DataClasses.Transformation();
            List<Author> list = trans.transformAuth(((Form1)this.Parent.Parent.Parent.Parent).con.Select(query));

            for (int x = 0; x < list.Count; x++)
            {
                dataGridView1.Rows.Add(list[x].authorID, list[x].name, list[x].surname);


            }
            dataGridView1.Refresh();
            dataGridView1.ClearSelection();
        }
    }
}
