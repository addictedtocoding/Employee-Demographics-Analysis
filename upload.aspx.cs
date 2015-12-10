using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.IO;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data;

namespace Project
{
    public partial class upload : System.Web.UI.Page
    {
        ArrayList ids = new ArrayList();
        ArrayList addresses = new ArrayList();
        Boolean uploaded;
        SqlConnection conn = new SqlConnection("Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;

    
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //TextBox1.Text = FileUpload1.FileName.ToString();
                string path = System.IO.Path.GetFullPath(FileUpload1.FileName).ToString();
                //TextBox1.Text = path;

                if (Path.GetExtension(FileUpload1.FileName).ToString().Equals(".xls") || Path.GetExtension(FileUpload1.FileName).ToString().Equals(".xlsx"))
               {
                string connectionString = "";
                if (FileUpload1.HasFile)
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string fileExtension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    string fileLocation = Server.MapPath("~/App_Data/" + fileName);
                    FileUpload1.SaveAs(fileLocation);

                    //Check whether file extension is xls or xslx

                    if (fileExtension == ".xls")
                    {
                        connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + fileLocation + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
                    }
                    else if (fileExtension == ".xlsx")
                    {
                        connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileLocation + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
                    }

                    //Create OleDB Connection and OleDb Command

                    OleDbConnection con = new OleDbConnection(connectionString);
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Connection = con;
                    OleDbDataAdapter dAdapter = new OleDbDataAdapter(cmd);
                    DataTable dtExcelRecords = new DataTable();
                    con.Open();
                    DataTable dtExcelSheetName = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                    string getExcelSheetName = dtExcelSheetName.Rows[0]["Table_Name"].ToString();
                    cmd.CommandText = "SELECT * FROM [" + getExcelSheetName + "]";
                    dAdapter.SelectCommand = cmd;
                    dAdapter.Fill(dtExcelRecords);
                    con.Close();
                    GridView1.DataSource = dtExcelRecords;
                    GridView1.DataBind();
                }


                int i = 0;
                while (i < GridView1.Rows.Count)
                {
                    ids.Add(GridView1.Rows[i].Cells[0].Text);
                    addresses.Add(GridView1.Rows[i].Cells[2].Text);
                    i++;
                }

                //TextBox1.Text = addresses[5].ToString();          //R
                Label1.Visible = true;


                conn.Open();
                SqlCommand cmd1 = new SqlCommand("Delete from employee_det", conn);
                cmd1.ExecuteNonQuery();
                conn.Close();


                //conn.Open();

                int l = 0;
                while (l < ids.Count)
                {
                    conn.Open();
                    string id = ids[l].ToString();
                    string address = addresses[l].ToString();
                    SqlCommand cmd = new SqlCommand("insert into employee_det values ('" + id + "','" + address + "')", conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    l++;
                }

                //conn.Close();



                /*var targetfilepath = Path.Combine(Server.MapPath(~/Documents), FileUpload1.FileName);
                FileUpload1.SaveAs(targetfilepath);

                var connstring = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + targetfilepath + ";Extended Properties=Excel 12.0";

                DataSet wb = excelReader.WorkbookData;
                // get the first worksheet of the workbook
                DataTable dt = excelReader.WorkbookData.Tables[0];
                dt.Columns.CopyTo(ids, 0);
                Console.WriteLine(ids[2]);                          */

                //  GridView1.DataSource = dt.AsDataView();
                //  GridView1.DataBind();*/
                uploaded = true;
              }
              else
              {
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "CallJS", "notXLS();", true);
              }
            
            }
            catch (ArgumentException anException)
            { 
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "CallJS", "noFile();", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           // if(uploaded == true)
           // {
                Response.Redirect("inputOffice.aspx");
           // }
           // else
           // {
            //    ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "CallJS", "noFile();", true);
           // }
            
        }
    }
}
