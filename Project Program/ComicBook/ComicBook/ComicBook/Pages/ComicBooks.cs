using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

namespace ComicBook.Pages
{
    public partial class ComicBooks : UserControl
    {
        string whatChecked = "";
        public ComicBooks()
        {
            InitializeComponent();
        }

        private void ComicBooks_Load(object sender, EventArgs e)
        {
            radioButton1.Checked = true;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            saveFileDialog1.ShowDialog();
        }

        private void saveFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            iTextSharp.text.Font font = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.TIMES_ROMAN, 8);
            string folderPath = saveFileDialog1.FileName + ".pdf";


            //Creating iTextSharp Table from the DataTable data
            Document pdfDoc = new Document(PageSize.A4);

            PdfPTable pdfTable = new PdfPTable(dataGridView1.ColumnCount);
            pdfTable.DefaultCell.Padding = dataGridView1.DefaultCellStyle.Padding.All;

            pdfTable.WidthPercentage = 100;
            pdfTable.HorizontalAlignment = Element.ALIGN_LEFT;
            pdfTable.DefaultCell.BorderWidth = 0;



            //Adding Header row
            foreach (DataGridViewColumn column in dataGridView1.Columns)
            {
                PdfPCell cell = new PdfPCell(new Phrase(column.HeaderText));
                cell.BackgroundColor = new iTextSharp.text.BaseColor(255, 255, 255);
                cell.HorizontalAlignment = Element.ALIGN_CENTER;
                pdfTable.AddCell(cell);
            }

            //Adding DataRow
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                foreach (DataGridViewCell cell in row.Cells)
                {
                    // pdfTable.AddCell(cell.Value.ToString());
                    PdfPCell cellRows = new PdfPCell(new Phrase(cell.Value.ToString(), font));
                    int R = cell.Style.BackColor.R;
                    int G = cell.Style.BackColor.G;
                    int B = cell.Style.BackColor.B;
                    if (R == 0 && G == 0 && B == 0)
                    {
                        R = 255;
                        G = 255;
                        B = 255;
                    }
                    cellRows.BackgroundColor = new iTextSharp.text.BaseColor(R, G, B);
                    cellRows.HorizontalAlignment = Element.ALIGN_CENTER;
                    pdfTable.AddCell(cellRows);

                }
            }
            Paragraph writing = new iTextSharp.text.Paragraph("The Comic Book Store " + Environment.NewLine + "Comic Books Information                " + DateTime.Now.ToString() + Environment.NewLine + Environment.NewLine);

            using (FileStream stream = new FileStream(folderPath, FileMode.Create))
            {

                PdfWriter.GetInstance(pdfDoc, stream);
                pdfDoc.Open();
                pdfDoc.Add(writing);
                pdfDoc.Add(pdfTable);
                pdfDoc.Close();
                stream.Close();
            }
        
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton1.Checked)
            {
                whatChecked = "All";
                string query = "SELECT * FROM comic.vw_bookinfo;";
                DataClasses.Transformation trans = new DataClasses.Transformation();
                List<DataClasses.BookInfo> list = trans.transformBookInfo(((Form1)this.Parent.Parent).con.Select(query));

                for (int x = 0; x < list.Count; x++)
                {

                    dataGridView1.Rows.Add(list[x].bookID, list[x].name, list[x].isbn, list[x].price, list[x].status, list[x].quantity , list[x].Aname, list[x].Asurname, list[x].Pname);


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
                List<DataClasses.BookInfo> list = trans.transformBookInfo(((Form1)this.Parent.Parent).con.Select(query));

                for (int x = 0; x < list.Count; x++)
                {

                    dataGridView1.Rows.Add(list[x].bookID, list[x].name, list[x].isbn, list[x].price, list[x].status, list[x].quantity, list[x].Aname, list[x].Asurname, list[x].Pname);


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
                List<DataClasses.BookInfo> list = trans.transformBookInfo(((Form1)this.Parent.Parent).con.Select(query));

                for (int x = 0; x < list.Count; x++)
                {

                    dataGridView1.Rows.Add(list[x].bookID, list[x].name, list[x].isbn, list[x].price, list[x].status, list[x].quantity, list[x].Aname, list[x].Asurname, list[x].Pname);


                }
                dataGridView1.Refresh();

            }
            else
            {
                dataGridView1.Rows.Clear();
            }
            dataGridView1.ClearSelection();
        }

        private void btnlogin_Click(object sender, EventArgs e)
        {
            if((bName.Text =="") && Aname.Text =="" && ASname.Text =="" && PName.Text == "")
            {

            }
            else
            {
                foreach (DataGridViewRow row in dataGridView1.Rows)
                {
                    // 0 is the column index
                    if (row.Cells[1].Value.ToString().Equals(bName.Text) && row.Cells[6].Value.ToString().Equals(Aname.Text) && row.Cells[7].Value.ToString().Equals(ASname.Text) && row.Cells[8].Value.ToString().Equals(PName.Text))
                    {
                        row.Selected = true;
                        break;
                    }
                }
            }
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ((Form1)this.Parent.Parent).ChangeView<AddBook>();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            ((Form1)this.Parent.Parent).ChangeView<UpdateBook>();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ((Form1)this.Parent.Parent).ChangeView<Authors>();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            ((Form1)this.Parent.Parent).ChangeView<Publishers>();
        }
    }
}
