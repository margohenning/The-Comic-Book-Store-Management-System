using System;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace ComicBook.Pages
{
    public partial class Authors : UserControl
    {
        public Authors()
        {
            InitializeComponent();
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
            catch(Exception ex)
            {

            }
        }
        

        private void button3_Click(object sender, EventArgs e)
        {
            ChangeView<UpdateAuthor>();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ChangeView<AddAuthor>();
        }

        public void doneAuthor()
        {
            ChangeView<ViewAuthors>();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ChangeView<ViewAuthors>();
        }

        private void Authors_Load(object sender, EventArgs e)
        {
            ChangeView<ViewAuthors>();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            ((Form1)this.Parent.Parent).ChangeView<ComicBooks>();
        }
    }
}
