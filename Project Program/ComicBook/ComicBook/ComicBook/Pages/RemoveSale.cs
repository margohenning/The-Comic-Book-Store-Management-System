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
    public partial class RemoveSale : UserControl
    {
        //Employee em = new Employee();
        int ID;
        List<DataClasses.SaleVW> list;
        DataClasses.SaleVW bi = new DataClasses.SaleVW();
        public RemoveSale()
        {
            InitializeComponent();
        }

        private void Employees_Load(object sender, EventArgs e)
        {
            string query = "SELECT * FROM comic.vw_sales;";
            DataClasses.Transformation trans = new DataClasses.Transformation();
            list = trans.transformSaleVW(((Form1)this.Parent.Parent).con.Select(query));

            for (int x = 0; x < list.Count; x++)
            {

                dataGridView1.Rows.Add(list[x].saleID, list[x].SaleDate, list[x].amountBooks, list[x].totalPrice, list[x].Cname, list[x].Csurname, list[x].Cemail, list[x].Ename, list[x].Esurname);


            }
            dataGridView1.Refresh();
            dataGridView1.ClearSelection();


        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedCells.Count == 0)
            {

            }
            else
            {
                if (MessageBox.Show("Are You sure you want to remove this Sale Item?", "", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    

                    try
                    {
                        //saleBasket
                        List<string>[] bt = ((Form1)this.Parent.Parent).con.Select("SELECT * FROM salebasket WHERE id_sale = '" + bi.saleID + "' ;");
                        SaleBasket sb = new SaleBasket();
                        sb.saleBasketID = Convert.ToInt32(bt[0][0]);
                        sb.saleID = Convert.ToInt32(bt[1][0]);
                        sb.bookID = Convert.ToInt32(bt[2][0]);
                        sb.quantity = Convert.ToInt32(bt[3][0]);

                        //Stock
                        DataClasses.Stock s = new DataClasses.Stock();
                        List<string>[] st = ((Form1)this.Parent.Parent).con.Select("SELECT * FROM stock WHERE id_store =1 && id_book = '" + sb.bookID + "' ;");
                        s.stockID = Convert.ToInt32(st[0][0]);
                        s.quantity = Convert.ToInt32(st[3][0]) + bi.amountBooks;
                        s.storeID = 1;
                        s.bookID = sb.bookID;
                        
                       
                        bool empp = ((Form1)this.Parent.Parent).con.UpdateStock(s);
                        if (empp == false)
                        {
                            if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Sale was not removed!"))
                            {
                                ((Form1)this.Parent.Parent).ChangeView<Sales>();
                            }

                        }
                        else
                        {
                            bool saleb = ((Form1)this.Parent.Parent).con.DeleteSaleBasket(sb.saleBasketID);
                            bool sale = ((Form1)this.Parent.Parent).con.DeleteSale(bi.saleID);
                                                     
                            if (saleb == false || sale == false)
                            {
                                if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Sale was not removed!"))
                                {
                                    ((Form1)this.Parent.Parent).ChangeView<Sales>();
                                }
                                
                            }
                            else
                            {
                                if (DialogResult.OK == MessageBox.Show("The Sale was removed successfully!" + Environment.NewLine + "Sale ID:   " + bi.saleID))
                                {
                                    ((Form1)this.Parent.Parent).ChangeView<Sales>();
                                }
                            }
                        }

                    }
                    catch (Exception ex)
                    {

                    }

                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ((Form1)this.Parent.Parent).ChangeView<Sales>();
        }

        

        private void dataGridView1_SelectionChanged_1(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count >= 1)
            {
                using (DataGridViewRow item = this.dataGridView1.SelectedRows[0])
                {

                    int i = item.Index;
                    bi.saleID = Convert.ToInt32(dataGridView1.Rows[i].Cells[0].Value.ToString());

                    bi.SaleDate = Convert.ToDateTime(dataGridView1.Rows[i].Cells[1].Value.ToString());
                    bi.amountBooks = Convert.ToInt32(dataGridView1.Rows[i].Cells[2].Value.ToString());

                    bi.totalPrice = Convert.ToDecimal( dataGridView1.Rows[i].Cells[3].Value.ToString());
                    bi.Cname = dataGridView1.Rows[i].Cells[4].Value.ToString();
                    bi.Csurname = dataGridView1.Rows[i].Cells[5].Value.ToString();
                    bi.Cemail = dataGridView1.Rows[i].Cells[6].Value.ToString();
                    bi.Ename = dataGridView1.Rows[i].Cells[7].Value.ToString();
                    bi.Esurname = dataGridView1.Rows[i].Cells[8].Value.ToString();


                }
            }
            else
            {

            }
        }
    }
    
}
