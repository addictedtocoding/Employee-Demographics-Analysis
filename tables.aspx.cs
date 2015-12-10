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
    public partial class tables : System.Web.UI.Page
    {
        ArrayList distances = new ArrayList();
        ArrayList times = new ArrayList();
        ArrayList averageDists = new ArrayList();
        ArrayList averageTimes = new ArrayList();
        double average_distance;
        String av_d;
        double average_time;
        String av_t;
        String standarddeviation;
        String standarddeviationintime;
        double n;
        String number_of_employees;
        double currentaveragedistance;
        double currentaveragetime;
        SqlConnection con = new SqlConnection("Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //Load the addresses table
            loadAddTable();


            //Load the latlng table
            loadLatLngTable();


            //Load the distances and time table
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from employee_stats", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "employee_stats");
            GridView1.DataSource = ds;
            GridView1.DataMember = "employee_stats";
            GridView1.DataBind();
            con.Close();

            GridView1.HeaderRow.Cells[0].Text = "Employee ID";
            GridView1.HeaderRow.Cells[1].Text = "Driving Distance (km)";
            GridView1.HeaderRow.Cells[2].Text = "Driving Time (min)";

            //ADDITIONAL STUFF
            int i = 0;
            double sumofdistances = 0;
            double sumoftimes = 0;

            con.Open();
            SqlCommand cmd3 = new SqlCommand("Delete from scatterplot#1", con);
            cmd3.ExecuteNonQuery();
            con.Close();

            con.Open();
            SqlCommand command = new SqlCommand("Delete from scatterplot#2", con);
            command.ExecuteNonQuery();
            con.Close();

            con.Open();
            SqlCommand cmd4 = new SqlCommand("Delete from generalstats", con);
            cmd4.ExecuteNonQuery();
            con.Close();
            
            con.Open();
            //SqlCommand cmd7 = new SqlCommand();
            //SqlCommand cmd = new SqlCommand("insert into employee_det values ('" + TextBox1.Text + "','" + TextBox2.Text + "')", con);
            //cmd.ExecuteNonQuery
            SqlCommand cmd = new SqlCommand("Select employee_drivingdistance from employee_stats", con);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                i++;
                String t = reader.GetString(0);
                String[] delimiter = new String[] {" km "};
                String[] tokens = t.Split(delimiter, StringSplitOptions.None);
                    //Double.Parse(reader.GetString(0));
                //Response.Write(t);                                                //R
                distances.Add(tokens[0]);
             /*
                Response.Write(tokens[0]);
                Response.Write(tokens[1]);
                Response.Write(tokens[2]);
                Response.Write(tokens[3]);
                Response.Write(tokens[4]);
                Response.Write(tokens[5]);
                Response.Write(tokens[6]);*/

                //sumofdistances = sumofdistances + t;
                //currentaveragedistance = sumofdistances/i;
                //distances.Add(t);
                //SqlCommand cmd6 = new SqlCommand("insert into scatterplot#1 values ('" + i + "','" + currentaveragedistance + "')", con);
                //cmd6.ExecuteNonQuery();

                // DropDownList1.Items.Add(reader.GetSqlString(0));
                
            }
     //       try
     //       {
                i = 0;
                while (i < (distances.Count - 1))
                {
                    sumofdistances = sumofdistances + Double.Parse(distances[i].ToString());
                    currentaveragedistance = Math.Round(sumofdistances / (Double.Parse((i + 1).ToString())), 2);
                    averageDists.Add(currentaveragedistance);
                    i++;
                }
                //Response.Write(distances[6]);
                average_distance = currentaveragedistance;
                av_d = average_distance.ToString();
                n = Double.Parse(i.ToString());
                number_of_employees = n.ToString();
                reader.Close();
                con.Close();
                //INSERTION BLOCK 1
                i = 0;
                while (i < averageDists.Count)
                {
                    con.Open();
                    //Response.Write(averageDists[i].ToString());                   //R
                    SqlCommand cmd6 = new SqlCommand("insert into scatterplot#1 values ('" + ((i + 1).ToString()) + "','" + (averageDists[i].ToString()) + "')", con);
                    cmd6.ExecuteNonQuery();
                    con.Close();
                    i++;
                }


            con.Open();
            SqlCommand cmd2 = new SqlCommand("Select employee_drivingtime from employee_stats", con);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            i = 0;
            while (reader2.Read())
            {
                i++;
                String t = reader2.GetString(0);
                String[] delimiter = new String[] {" mins "};
                String[] tokens = t.Split(delimiter, StringSplitOptions.None);
                    //Double.Parse(reader.GetString(0));
                //Response.Write(t);                        //R
                times.Add(tokens[0]);
                
                //SqlCommand cmd6 = new SqlCommand("insert into scatterplot#1 values ('" + (Double.Parse(i)).ToString() + "','" + currentaveragedistance.ToString() + "')", con);
                //cmd6.ExecuteNonQuery();
                
                
                
               /* i++;
                sumoftimes = sumoftimes + Double.Parse(reader2.GetString(0));
                currentaveragetime = sumoftimes / i;
                times.Add(Double.Parse(reader2.GetString(0)));*/
                // DropDownList1.Items.Add(reader.GetSqlString(0));
            }

            i = 0;
            while(i < (times.Count - 1))
            {
                sumoftimes = sumoftimes + Double.Parse(times[i].ToString());
                currentaveragetime = Math.Round(sumoftimes / (Double.Parse((i+1).ToString())), 2);
                averageTimes.Add(currentaveragetime);
                i++;
            }
            average_time = currentaveragetime;
            av_t = average_time.ToString();
            reader2.Close();
            con.Close();

            i = 0;
            while (i < averageTimes.Count)
            {
                con.Open();
                //Response.Write(averageDists[i].ToString());                   //R
                SqlCommand cmd7 = new SqlCommand("insert into scatterplot#2 values ('" + ((i + 1).ToString()) + "','" + (averageTimes[i].ToString()) + "')", con);
                cmd7.ExecuteNonQuery();
                con.Close();
                i++;
            }


            //INSERTION BLOCK 2
           /* i = 0;
            while (i < averageDists.Count)
            {
                con.Open();
                SqlCommand cmd6 = new SqlCommand("insert into scatterplot#1 values ('" + i.ToString() + "','" + averageDists[i].ToString() + "')", con);
                cmd6.ExecuteNonQuery();
                con.Close();
                i++;
            }*/         //Not Needed ATM


            
            //Calculations for "General Stats":
            double tempSum = 0;
            int c = 1;
            while (c <= distances.Count)
            {
                double dist = Double.Parse(distances[c-1].ToString());                              //formerly distances[0]
                tempSum = tempSum + ((dist - average_distance) * (dist - average_distance));
                c++;
            }

            double standard_deviation;
            standard_deviation = Math.Sqrt(tempSum / n);
            standarddeviation = Math.Round(standard_deviation, 2).ToString();

            tempSum = 0;
            c = 1;
            while (c <= times.Count)
            {
                double time = Double.Parse(times[c-1].ToString());                                  //formerly times[0]
                tempSum = tempSum + ((time - average_time) * (time - average_time));
                c++;
            }

            double standard_deviation_in_time;
            standard_deviation_in_time = Math.Sqrt(tempSum / n);
            standarddeviationintime = Math.Round(standard_deviation_in_time, 2).ToString();

                //Use the data in this table to calculate the values you'll need for the general stats table
                //Remove all values from the General stats table, and insert these calculated values into the table
                //Also store the progressive sums and progressive averages in the scatterplot table (designate sum as "final sum" and average as "final average")

            //Load the general stats table
            loadGeneralStats();

            //Load the table for Scatterplot #1
            loadScatterplot1Table();  
       
            //Load the table for Scatterplot #2
            loadScatterplot2Table();

            //Calculate max and min
            displayMaxAndMin();
      //    }
     //     catch (Exception anException)
      //    {
      //        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "CallJS", "needToGeocode();", true);
      //    }

        }

        public void loadAddTable()
        {
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from employee_det", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "employee_det");
            GridView8.DataSource = ds;
            GridView8.DataMember = "employee_det";
            GridView8.DataBind();
            con.Close();

            GridView8.HeaderRow.Cells[0].Text = "Employee ID";
            GridView8.HeaderRow.Cells[1].Text = "Address";
        }

        public void loadLatLngTable()
        {
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from employee_latlng", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "employee_latlng");
            GridView2.DataSource = ds;
            GridView2.DataMember = "employee_latlng";
            GridView2.DataBind();
            con.Close();

            GridView2.HeaderRow.Cells[0].Text = "ID";
            GridView2.HeaderRow.Cells[1].Text = "Latitude";
            GridView2.HeaderRow.Cells[2].Text = "Longitude";
        }

        public void loadScatterplot1Table()
        {
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from scatterplot#1", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "scatterplot#1");
            GridView6.DataSource = ds;
            GridView6.DataMember = "scatterplot#1";
            GridView6.DataBind();
            con.Close();

            GridView6.HeaderRow.Cells[0].Text = "Number of Employees";
            GridView6.HeaderRow.Cells[1].Text = "Average Driving Distance (km)";
        }

        public void loadScatterplot2Table()
        {
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from scatterplot#2", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "scatterplot#2");
            GridView9.DataSource = ds;
            GridView9.DataMember = "scatterplot#2";
            GridView9.DataBind();
            con.Close();

            GridView9.HeaderRow.Cells[0].Text = "Number of Employees";
            GridView9.HeaderRow.Cells[1].Text = "Average Driving Time (min)";
        }

        public void loadGeneralStats()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into generalstats values ('" + av_d + "','" + av_t + "','" + standarddeviation + "','" + standarddeviationintime + "')", con);
            cmd.ExecuteNonQuery();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from generalstats", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "generalstats");
            GridView3.DataSource = ds;
            GridView3.DataMember = "generalstats";
            GridView3.DataBind();
            con.Close();

            GridView3.HeaderRow.Cells[0].Text = "Average Driving Distance (km)";
            GridView3.HeaderRow.Cells[1].Text = "Average Driving Time (min)";
            GridView3.HeaderRow.Cells[2].Text = "Standard Deviation in Driving Distance";
            GridView3.HeaderRow.Cells[3].Text = "Standard Deviation in Driving Time";
        }

        public void displayMaxAndMin()
        {
            double maxDD = 0;
            double minDD = 200;
            double maxDT = 0;
            double minDT = 200;
            String nameOfMaxDD;
            String nameOfMinDD;
            String nameOfMaxDT;
            String nameOfMinDT;
            int rowNumberOfMaxDD = 0;
            int rowNumberOfMinDD = 0;
            int rowNumberOfMaxDT = 0;
            int rowNumberOfMinDT = 0;
            int i = 0;
            while(i < GridView1.Rows.Count)
            {
                String a = GridView1.Rows[i].Cells[1].Text;
                String b = GridView1.Rows[i].Cells[2].Text;
                String[] delimiter1 = new String[] { " km " };
                String[] token1 = a.Split(delimiter1, StringSplitOptions.None);
                String tokenA = token1[0];
                String[] delimiter2 = new String[] { " mins " };
                String[] token2 = b.Split(delimiter2, StringSplitOptions.None);
                String tokenB = token2[0];

         //       Label1.Text = tokenB;                                                 //was used for debugging purposes
         //       Label2.Text = GridView1.Rows[0].Cells[2].Text.ToString();             //ditto
                if (Double.Parse(tokenA.Trim()) > maxDD)
                {
                    maxDD = Double.Parse(tokenA.Trim());
                    rowNumberOfMaxDD = i;
                }
                if (Double.Parse(tokenA.Trim()) < minDD)
                {
                    minDD = Double.Parse(tokenA.Trim());
                    rowNumberOfMinDD = i;
                }
                if (Double.Parse(tokenB.Trim()) > maxDT)
                {
                    maxDT = Double.Parse(tokenB.Trim());
                    rowNumberOfMaxDT = i;
                }
                if (Double.Parse(tokenB.Trim()) < minDT)
                {
                    minDT = Double.Parse(tokenB.Trim());
                    rowNumberOfMinDT = i;
                }

                i++;
            }

            nameOfMaxDD = GridView1.Rows[rowNumberOfMaxDD].Cells[0].Text;
            nameOfMaxDT = GridView1.Rows[rowNumberOfMaxDT].Cells[0].Text;
            nameOfMinDD = GridView1.Rows[rowNumberOfMinDD].Cells[0].Text;
            nameOfMinDT = GridView1.Rows[rowNumberOfMinDT].Cells[0].Text;

            Label1.Text = "Maximum Driving Distance: " + maxDD.ToString() + " km (" + nameOfMaxDD.Trim() + ")";
            Label2.Text = "Maximum Driving Time: " + maxDT.ToString() + " mins (" + nameOfMaxDT.Trim() + ")";
            Label3.Text = "Minimum Driving Distance: " + minDD.ToString() + " km (" + nameOfMinDD.Trim() + ")";
            Label4.Text = "Minimum Driving Time: " + minDT.ToString() + " mins (" + nameOfMinDT.Trim() + ")";           

        }
    }
}


//exactly two tables will be modified, therefore, these two tables have to be cleared first
