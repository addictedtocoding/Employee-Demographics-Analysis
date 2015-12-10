
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
    public partial class newlocations : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails;Integrated Security=True");
        String stringToSend;
        String addressOfVirtualOffice;
        String latOfVO;
        String lngOfVO;
        int truefalse;
        int reloadedOrNot;
        String latOfC;
        String lngOfC;
        protected void Page_Load(object sender, EventArgs e)
        {

            //used for sending data to javascript            
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from employee_det", con);
            DataSet ds = new DataSet();

            SqlCommand cmd = new SqlCommand("Select employee_address from employee_det", con);
            SqlDataReader reader = cmd.ExecuteReader();

            /* ArrayList list = new ArrayList();
             list.Add("One");
             list.Add("Two");
             list.Add("Three");*/

            String locs = "";
            int i = 1;
            while (reader.Read())
            {
                if (i == 1)
                {
                    locs = locs + reader.GetValue(0).ToString();
                }
                else
                {
                    locs = locs + ";" + reader.GetValue(0).ToString();
                }


                i++;
                //DropDownList1.Items.Add(reader.GetString(0));
            }

            //Response.Write(locs);
            reader.Close();
            con.Close();

            stringToSend = locs;

            //load the numbers in the dropdownlist
            con.Open();
         //   SqlCommand cmd2 = new SqlCommand("Select serial_number from savedLocationsData", con);
            SqlCommand cmd2 = new SqlCommand("Select address from savedAddLocations", con);                 //WIP
            SqlDataReader reader2 = cmd2.ExecuteReader();

            while (reader2.Read())
            {
                DropDownList1.Items.Add(reader2.GetString(0));
                // DropDownList1.Items.Add(reader.GetSqlString(0));
            }

            reader2.Close();
            con.Close();
        }

        public String sendVariable()
        {
            return stringToSend;                //is called in order to send the first variable to the js
        }

        public int trueOrFalse()
        {
            return truefalse;
        }

        public String sendLatLngOfVirtualOffice()
        {
            return addressOfVirtualOffice;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            toStats.Enabled = true;
            truefalse = 1;
            string lat;
            string lng;

            //block of code for getting a single value 

            con.Open();
            SqlCommand cmd = new SqlCommand("Select latitude from savedLocationsData", con);
            SqlDataReader reader = cmd.ExecuteReader();
            ArrayList arrayLats = new ArrayList();

            while (reader.Read())
            {
                arrayLats.Add(reader.GetString(0));
            }

            reader.Close();
            con.Close();

            con.Open();
            SqlCommand cmd2 = new SqlCommand("Select longitude from savedLocationsData", con);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            ArrayList arrayLngs = new ArrayList();

            while (reader2.Read())
            {
                arrayLngs.Add(reader2.GetString(0));
            }

            reader2.Close();
            con.Close();
            int index = int.Parse(DropDownList1.SelectedIndex.ToString());
            lat = (string)arrayLats[index];         //used to be index - 1
            lng = (string)arrayLngs[index];         //used to be index - 1

            //Console.WriteLine(latlng);
            // string[] latandlng = lat.Split(';');


            latOfVO = lat;
            lngOfVO = lng;


            Session["latOfC"] = latOfVO;
            Session["lngOfC"] = lngOfVO;


            String noTollTF = avoidTollRoads.Checked.ToString();                        //R
            String noHighwaysTF = avoidHighways.Checked.ToString();                     //R
            Session["noTollTF"] = noTollTF.ToString();                                                 //R
            Session["noHighwaysTF"] = noHighwaysTF.ToString();                                                 //R

            DropDownList1.Items.Clear();                                                                        //WIP
            //load the numbers in the dropdownlist
            con.Open();
            //   SqlCommand cmd2 = new SqlCommand("Select serial_number from savedLocationsData", con);
            SqlCommand command2 = new SqlCommand("Select address from savedAddLocations", con);                 //WIP
            SqlDataReader readerII = command2.ExecuteReader();

            while (readerII.Read())
            {
                DropDownList1.Items.Add(readerII.GetString(0));
                // DropDownList1.Items.Add(reader.GetSqlString(0));
            }

            readerII.Close();
            con.Close();

            DropDownList1.SelectedIndex = index;
        }

        public String sendLat()
        {
            return latOfVO;
        }

        public String sendLng()
        {
            return lngOfVO;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {   //enable this button only after the plot button has been clicked
            truefalse = 1;
            //reloadedOrNot = 1;
            string lat;
            string lng;

            //block of code for getting a single value (ie. page load/plot the same loc you already plotted block)

            con.Open();
            SqlCommand cmd = new SqlCommand("Select latitude from savedLocationsData", con);
            SqlDataReader reader = cmd.ExecuteReader();
            ArrayList arrayLats = new ArrayList();

            while (reader.Read())
            {
                arrayLats.Add(reader.GetString(0));
            }

            reader.Close();
            con.Close();

            con.Open();
            SqlCommand cmd2 = new SqlCommand("Select longitude from savedLocationsData", con);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            ArrayList arrayLngs = new ArrayList();

            while (reader2.Read())
            {
                arrayLngs.Add(reader2.GetString(0));
            }

            reader2.Close();
            con.Close();
            int index = int.Parse(DropDownList1.SelectedValue.ToString());
            lat = (string)arrayLats[index];
            lng = (string)arrayLngs[index];

            //Console.WriteLine(latlng);
            // string[] latandlng = lat.Split(';');


            latOfVO = lat;
            lngOfVO = lng;



            //gets the js variables
            var av_driving_dist = Hidden1.Value;
            var av_driving_time = Hidden2.Value;
            var sd_for_dist = Hidden3.Value;
            var sd_for_time = Hidden4.Value;




 //           TextBox1.Text = av_driving_dist;                              //R

            //Calculations Block
           /* ArrayList distances = new ArrayList();
            ArrayList times = new ArrayList();
            double av_driving_dist;
            double av_driving_time;
            double sd_for_dist;
            double sd_for_time;
            
            con.Open();
            SqlCommand cmd3 = new SqlCommand("Select distance from savedLocationsData2", con);
            SqlDataReader reader3 = cmd3.ExecuteReader();

            while (reader3.Read())
            {
                String[] delimiter = new String[] { " km "};
                String[] tokens = (reader3.GetString(0)).Split(delimiter, StringSplitOptions.None);
                //Double.Parse(reader.GetString(0));
                distances.Add(tokens[0]);
                //distances.Add(reader3.GetString(0));
            }

            reader3.Close();
            con.Close();

            con.Open();
            SqlCommand cmd4 = new SqlCommand("Select time from savedLocationsData2", con);
            SqlDataReader reader4 = cmd4.ExecuteReader();

            while (reader4.Read())
            {
                String[] delimiter = new String[] { " mins " };
                String[] tokens = (reader4.GetString(0)).Split(delimiter, StringSplitOptions.None);
                distances.Add(tokens[0]);
            }

            reader4.Close();
            con.Close();

            //average driving distance
            int x = distances.Count;
            double sumOfDists = 0;
            int i = 0;
            while (i < distances.Count)
            {
                string distString = distances[i].ToString().Trim();
                double dist = Double.Parse(distString);             
                sumOfDists = sumOfDists + dist;
                i++;
            }
            av_driving_dist = sumOfDists / x;

            //average driving time
            int y = times.Count;
            double sumOfTimes = 0;
            i = 0;
            while (i < times.Count)
            {
                string timeString = times[i].ToString().Trim();
                double time = Double.Parse(timeString);
                sumOfTimes = sumOfTimes + time;
                i++;
            }
            av_driving_time = sumOfTimes / y;

            //standard deviation
            double a = 0;
            double b = 0;

            i = 0;
            while (i < distances.Count)
            {
                a = a + Math.Pow(((Double.Parse(distances[i].ToString())) - av_driving_dist), 2);
            }
            sd_for_dist = Math.Pow((a / (x - 1)), 0.5);

            i = 0;
            while (i < times.Count)
            {
                b = b + Math.Pow(((Double.Parse(times[i].ToString())) - av_driving_time), 2);
            }
            sd_for_time = Math.Pow((b / (y - 1)), 0.5);*/
    

  


            //removes all entries (if any) from the table
           /* con.Open();
            SqlCommand cmd8 = new SqlCommand("Delete from CandidateStats", con);
            cmd8.ExecuteNonQuery();
            con.Close();

            //inserts values into table
            con.Open();
            SqlCommand cmd9 = new SqlCommand("Insert into CandidateStats values ('" + av_driving_dist + "','" + av_driving_time + "','" + sd_for_dist + "','" + sd_for_time + "')", con);
            cmd9.ExecuteNonQuery();
            con.Close();

            //displays the table
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from CandidateStats", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "CandidateStats");
            GridView1.DataSource = ds;
            GridView1.DataMember = "CandidateStats";
            GridView1.DataBind();
            con.Close();*/

            
        }

        public int reloaded()
        {
            return reloadedOrNot;
        }
    }
}
