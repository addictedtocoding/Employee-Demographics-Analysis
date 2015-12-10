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
    public partial class candStatisticsII : System.Web.UI.Page
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
        String standarddeviation2;
        double n;
        String number_of_employees;
        double currentaveragedistance;
        double currentaveragetime;
        SqlConnection con = new SqlConnection("Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //Load the addresses table
            //loadAddTable();


            //Load the latlng table
            //loadLatLngTable();


            //Load the distances and time table
            /*con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from employee_stats", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "employee_stats");
            GridView1.DataSource = ds;
            GridView1.DataMember = "employee_stats";
            GridView1.DataBind();
            con.Close();*/

            //ADDITIONAL STUFF
            int i = 0;
            double sumofdistances = 0;
            double sumoftimes = 0;

            con.Open();
            SqlCommand cmd4 = new SqlCommand("Delete from CandidateStats", con);
            cmd4.ExecuteNonQuery();
            con.Close();
            
            con.Open();
            //SqlCommand cmd7 = new SqlCommand();
            //SqlCommand cmd = new SqlCommand("insert into employee_det values ('" + TextBox1.Text + "','" + TextBox2.Text + "')", con);
            //cmd.ExecuteNonQuery
            SqlCommand cmd = new SqlCommand("Select distances from statsWRTcand", con);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                i++;
                String t = reader.GetString(0);
             //   Response.Write(t);                                                                    //R
                String[] delimiter = new String[] {" "};
                String[] tokens = t.Split(delimiter, StringSplitOptions.None);
                    //Double.Parse(reader.GetString(0));
                //Response.Write(t);
                distances.Add(tokens[0].Trim());
               // Response.Write(distances[i-1]);                               //R
                //averageDists.Add(currentaveragedistance);
                
            }

            try
            {
                i = 0;
                while (i < (distances.Count - 1))
                {
                    //               if (i < (distances.Count - 1))
                    // {    
                    if (distances[i] != null)
                    { sumofdistances = sumofdistances + Double.Parse(distances[i].ToString()); }
                    currentaveragedistance = sumofdistances / (Double.Parse((i + 1).ToString()));
                    // }
                    i++;
                }

                //TextBox1.Text = distances[5].ToString();                          //R
                //Response.Write(distances[6]);
                average_distance = currentaveragedistance;
                av_d = Math.Round(average_distance, 2).ToString();
                n = Double.Parse(i.ToString());
                number_of_employees = n.ToString();
                reader.Close();
                con.Close();
                //INSERTION BLOCK 1
                /*i = 0;
                while (i < averageDists.Count)
                {
                    con.Open();
                    Response.Write(averageDists[i].ToString());
                    SqlCommand cmd6 = new SqlCommand("insert into scatterplot#1 values ('" + ((i+1).ToString()) + "','" + (averageDists[i].ToString()) + "')", con);
                    cmd6.ExecuteNonQuery();
                    con.Close();
                    i++;
                }*/


            
            con.Open();
            SqlCommand cmd2 = new SqlCommand("Select times from statsWRTcand", con);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            i = 0;
            while (reader2.Read())
            {
                i++;
                String t = reader2.GetString(0);
                String[] delimiter = new String[] {" "};
                String[] tokens = t.Split(delimiter, StringSplitOptions.None);
                    //Double.Parse(reader.GetString(0));
                //Response.Write(t);
                times.Add(tokens[0]);
               
                //SqlCommand cmd6 = new SqlCommand("insert into scatterplot#1 values ('" + (Double.Parse(i)).ToString() + "','" + currentaveragedistance.ToString() + "')", con);
                //cmd6.ExecuteNonQuery();
                
            }

            i = 0;
            while(i < (times.Count - 1))
            {
                
                    sumoftimes = sumoftimes + Double.Parse(times[i].ToString());
                    currentaveragetime = sumoftimes / (Double.Parse((i+1).ToString()));
                    i++;
            }

            average_time = currentaveragetime;
            av_t = Math.Round(average_time, 2).ToString();
            reader2.Close();
            con.Close();
            
            //Calculations for "General Stats":
            double tempSum = 0;
            int c = 1;
            while (c <= distances.Count)
            {
                double dist = Double.Parse(distances[0].ToString());
                tempSum = tempSum + ((dist - average_distance) * (dist - average_distance));
                c++;
            }

            double standard_deviation1;
            standard_deviation1 = Math.Sqrt(tempSum / n);
            standarddeviation = Math.Round(standard_deviation1, 2).ToString();


            double tempSum2 = 0;
            c = 1;
            while (c <= times.Count)
            {
                double time = Double.Parse(times[0].ToString());
                tempSum2 = tempSum2 + ((time - average_time) * (time - average_time));
                c++;
            }

            double standard_deviation2;
            standard_deviation2 = Math.Sqrt(tempSum2 / n);
            standarddeviation2 = Math.Round(standard_deviation2, 2).ToString();
            //TextBox1.Text = tempSum2.ToString();
                //Use the data in this table to calculate the values you'll need for the general stats table
                //Remove all values from the General stats table, and insert these calculated values into the table
                //Also store the progressive sums and progressive averages in the scatterplot table (designate sum as "final sum" and average as "final average")

            //Load the general stats table
            loadGeneralStats();                        

            //Load statsWRTcand
            loadStatsWRTCand();


            //Load the table for Scatterplot #1
            //loadScatterplot1Table();         
          }
          catch (FormatException anException)
          {
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "CallJS", "sorry();", true);
                //Response.Redirect("newlocations.aspx");
          }
        }

        /*public void loadAddTable()
        {
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from employee_det", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "employee_det");
            GridView8.DataSource = ds;
            GridView8.DataMember = "employee_det";
            GridView8.DataBind();
            con.Close();
        
        }*/

        /*public void loadLatLngTable()
        {
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from employee_latlng", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "employee_latlng");
            GridView2.DataSource = ds;
            GridView2.DataMember = "employee_latlng";
            GridView2.DataBind();
            con.Close();
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
        }*/


        public void loadGeneralStats()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into CandidateStats values ('" + av_d + "','" + av_t + "','" + standarddeviation + "','" + standarddeviation2 + "')", con);
            cmd.ExecuteNonQuery();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from CandidateStats", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "CandidateStats");
            GridView3.DataSource = ds;
            GridView3.DataMember = "CandidateStats";
            GridView3.DataBind();
            con.Close();

            GridView3.HeaderRow.Cells[0].Text = "Average Driving Distance (km)";
            GridView3.HeaderRow.Cells[1].Text = "Average Driving Time (min)";
            GridView3.HeaderRow.Cells[2].Text = "Standard Deviation in Driving Distance";
            GridView3.HeaderRow.Cells[3].Text = "Standard Deviation in Driving Time";
        }

        public void loadStatsWRTCand()
        {
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from statsWRTcand", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "statsWRTcand");
            GridView4.DataSource = ds;
            GridView4.DataMember = "statsWRTcand";
            GridView4.DataBind();
            con.Close();

            GridView4.HeaderRow.Cells[0].Text = "ID";
            GridView4.HeaderRow.Cells[1].Text = "Distance (in km)";
            GridView4.HeaderRow.Cells[2].Text = "Driving Time (in mins)";
        }
    }
}


//exactly two tables will be modified, therefore, these two tables have to be cleared first
