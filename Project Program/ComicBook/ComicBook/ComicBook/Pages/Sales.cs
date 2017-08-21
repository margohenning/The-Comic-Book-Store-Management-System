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
    public partial class Sales : UserControl
    {
        public Sales()
        {
            InitializeComponent();
        }

        private void Sales_Load(object sender, EventArgs e)
        {
            string query = "SELECT * FROM comic.vw_sales;";
            DataClasses.Transformation trans = new DataClasses.Transformation();
            List<DataClasses.SaleVW> list = trans.transformSaleVW(((Form1)this.Parent.Parent).con.Select(query));

            for (int x = 0; x < list.Count; x++)
            {
               
                dataGridView1.Rows.Add(list[x].saleID, list[x].SaleDate, list[x].amountBooks, list[x].totalPrice, list[x].Cname, list[x].Csurname, list[x].Cemail, list[x].Ename, list[x].Esurname);


            }
            dataGridView1.Refresh();
            dataGridView1.ClearSelection();
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
            Paragraph writing = new iTextSharp.text.Paragraph("The Comic Book Store " + Environment.NewLine + "Employees Information                " + DateTime.Now.ToString() + Environment.NewLine + Environment.NewLine);

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

        private void button1_Click(object sender, EventArgs e)
        {
            ((Form1)this.Parent.Parent).ChangeView<AddSale>();
        
    }

        private void button2_Click(object sender, EventArgs e)
        {
            ((Form1)this.Parent.Parent).ChangeView<RemoveSale>();
        }
    }
}
