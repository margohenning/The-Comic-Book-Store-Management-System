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
    public partial class RemoveEmployee : UserControl
    {
        //Employee em = new Employee();
        int ID;
        List<Employee> list;
        Employee bi = new Employee();
        public RemoveEmployee()
        {
            InitializeComponent();
        }

        private void Employees_Load(object sender, EventArgs e)
        {
            string query = "SELECT * FROM employee;";
            DataClasses.Transformation trans = new DataClasses.Transformation();
            list = trans.transformEmp(((Form1)this.Parent.Parent).con.Select(query));

            for (int x = 0; x < list.Count; x++)
            {
                dataGridView1.Rows.Add(list[x].employeeID, list[x].name, list[x].surname, list[x].email, list[x].AdminPrivileges, list[x].activated);


            }
            dataGridView1.Refresh();

           
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedCells.Count == 0)
            {

            }
            else
            {
                if (MessageBox.Show("Are You sure you want to deactivate this employee Item?", "", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {


                    

                    try
                    {


                        bi.activated = false;
                        //string q = emp.insert();
                        bool empp = ((Form1)this.Parent.Parent).con.UpdateEmployee(bi);
                        if (empp == false)
                        {
                            if (DialogResult.OK == MessageBox.Show("Sorry something went wrong, the Employee was not deactivated!"))
                            {
                                ((Form1)this.Parent.Parent).ChangeView<Employees>();
                            }

                        }
                        else
                        {
                            if (DialogResult.OK == MessageBox.Show("The Employee was deactivated successfully!" + Environment.NewLine + "Employee ID:   " + bi.employeeID))
                            {
                                ((Form1)this.Parent.Parent).ChangeView<Employees>();
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
            ((Form1)this.Parent.Parent).ChangeView<Employees>();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count >= 1)
            {
                using (DataGridViewRow item = this.dataGridView1.SelectedRows[0])
                {

                    int i = item.Index;
                    bi.employeeID = Convert.ToInt32(dataGridView1.Rows[i].Cells[0].Value.ToString());
                    
                    bi.name = dataGridView1.Rows[i].Cells[1].Value.ToString();
                    bi.surname = dataGridView1.Rows[i].Cells[2].Value.ToString();
                    
                    bi.email = dataGridView1.Rows[i].Cells[3].Value.ToString();
                   bi.AdminPrivileges = Convert.ToBoolean(dataGridView1.Rows[i].Cells[4].Value.ToString());
                    bi.activated = Convert.ToBoolean(dataGridView1.Rows[i].Cells[5].Value.ToString());
                    bi.username = list.Find(x => x.employeeID == bi.employeeID).username;
                    bi.password = list.Find(x => x.employeeID == bi.employeeID).password;


                }
            }
            else
            {

            }
        }
    }
    
}
