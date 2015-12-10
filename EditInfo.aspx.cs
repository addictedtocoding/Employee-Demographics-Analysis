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

using System.Data.SqlClient;
namespace Project
{
    //Data source should always be the server name. You were giving the username.
    //(SQL Server 9.0.1399 - ALISHA-GUPTA\\Alisha Gupta)
    public partial class EditInfo : System.Web.UI.Page
    {   //replace initial catalog, with database
        SqlConnection con = new SqlConnection("Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)            //integrated security- windows authentication, for the sql server- separate
        {
         //local host: local ie. on your local system host, ie. what's hosting you. in other words, your system acts as the host as well; the number after local host\\[port number]
            //loads table
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from employee_det", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "employee_det");
            GridView1.DataSource = ds;
            GridView1.DataMember = "employee_det";
            GridView1.DataBind();
            con.Close();

            GridView1.HeaderRow.Cells[0].Text = "ID";
            GridView1.HeaderRow.Cells[1].Text = "Address";

            //loads id's in combo box
            con.Open();
            SqlCommand cmd = new SqlCommand("Select employee_id from employee_det", con);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                DropDownList1.Items.Add(reader.GetString(0));
               // DropDownList1.Items.Add(reader.GetSqlString(0));
            }

            reader.Close();
            con.Close();        

        } //iis server should be enabled

        protected void delete_Click(object sender, EventArgs e)
        {
            //string confirmation = Hidden3.Value.ToString();    

            //if(confirmation.Equals("true"))
            //{
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from employee_det where employee_id='" + DropDownList1.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();

                reloadTable();
                reloadIds();
            //}
        }

        protected void update_Click(object sender, EventArgs e)
        {

            if (TextBox2.Text.Equals(""))
            {
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "CallJS", "cannotUpdate();", true);
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update employee_det set employee_address='" + TextBox2.Text + "' where employee_id='" + DropDownList1.Text + "'", con);
                //setting multiple fields goes like this: set yada_1 yada_2 where yada_3
                cmd.ExecuteNonQuery();
                con.Close();

                reloadTable();
                reloadIds();
            }
        }

        protected void insert_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Equals("") || TextBox2.Text.Equals(""))
            {
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "CallJS", "fieldsAreBlank();", true);
            }
            else
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into employee_det values ('" + TextBox1.Text + "','" + TextBox2.Text + "')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();


                    reloadTable();
                    reloadIds();
                }
                catch (SqlException anException)
                {
                    ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "CallJS", "retry();", true);
                }
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        //loads the corresponding value into the textbox
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*con.Open();
            SqlCommand cmd = new SqlCommand("Select * from employee_det where employee_id='" + DropDownList1.SelectedValue + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                TextBox2.Text = reader.GetSqlString(1).ToString();
            }

            reader.Close();
            con.Close();*/
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void reloadTable()
        {
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from employee_det", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "employee_det");
            GridView1.DataSource = ds;
            GridView1.DataMember = "employee_det";
            GridView1.DataBind();
            con.Close();
        }
        private void reloadIds()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select employee_id from employee_det", con);
            SqlDataReader reader = cmd.ExecuteReader();

            /*int i = 0;
            while ()                        //loop through each element in the list
            {
                DropDownList1.Items.Remove(reader.GetString(i));
                //DropDownList1.Items.Add(reader.GetSqlString(0));
            } */

            DropDownList1.Items.Clear();
            while (reader.Read())
            {
                DropDownList1.Items.Add(reader.GetString(0));
                //DropDownList1.Items.Add(reader.GetSqlString(0));
            }

            reader.Close();
            con.Close();
        }
    }
}

/*
 * using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
namespace Project__the_real_one
{
    public partial class EditInfo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=ALISHA-GUPTA\\Alisha Gupta;Initial Catalog=employeedetails;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //loads table
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from employee_det", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "employee_det");
            GridView1.DataSource = ds;
            GridView1.DataMember = "employee_det";
            GridView1.DataBind();
            con.Close();


            //loads id's in combo box
            con.Open();
            SqlCommand cmd = new SqlCommand("Select employee_id from employee_det", con);
            SqlDataReader reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                DropDownList1.Items.Add(reader("employee_id").ToString());
                DropDownList1.Items.Add(reader.GetSqlString(0));
            }

            reader.Close();
            con.Close();        
        }

        protected void insert_Click(object sender, EventArgs e)
        { 
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into employee_det values('" TextBox1.Text + "','" + TextBox2.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();

            reloadTable();
            reloadIds();        
        }

        protected void update_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Update employee_det set employee_address='" + TextBox2.Text + "' where employee_id='" + DropDownList1.Text + "'", con);
            //setting multiple fields goes like this: set yada_1 yada_2 where yada_3
            cmd.ExecuteNonQuery();
            con.Close();

            reloadTable();
            reloadIds();            
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete from employee_det where employee_id='" + DropDownList1.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();

            reloadTable();
            reloadIds();                        
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from employee_det where employee_id='" + DropDownList1.SelectedValue + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                TextBox2.Text = reader.GetSqlString(1).ToString();
            }

            reader.Close();
            con.Close();            
        }

        private void reloadTable()
        {
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from employee_det", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "employee_det");
            GridView1.DataSource = ds;
            GridView1.DataMember = "employee_det";
            GridView1.DataBind();
            con.Close();                                
        }

        private void reloadIds()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select employee_id from employee_det", con);
            SqlDataReader reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                DropDownList1.Items.Add(reader("employee_id").ToString());
                //DropDownList1.Items.Add(reader.GetSqlString(0));
            }

            reader.Close();
            con.Close();
        }
        }
}
 * 
*/
