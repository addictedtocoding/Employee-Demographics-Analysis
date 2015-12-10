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
using System.Web.Services;

using System.Data.SqlClient;
namespace Project
{
    public partial class Locations : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails;Integrated Security=True");
        String stringToSend;

        ArrayList ids = new ArrayList();
        ArrayList lats = new ArrayList();
        ArrayList longs = new ArrayList();
        ArrayList dists = new ArrayList();
        ArrayList times = new ArrayList();
        //string[] lats;
        String latitudesYay;
        String longitudesYay;
        String distancesYay;
        String timesYay;
        String latOfC;
        String lngOfC;
        String officeAddress;
        String latToSend;
        String lngToSend;
        protected void Page_Load(object sender, EventArgs e)
        {
            officeAddress = (Session["address"]).ToString();






            //latOfC = (Session["lat"]).ToString();
            //lngOfC = (Session["lng"]).ToString();
                       // latOfSelection = (Session["latOfC"]).ToString(); // value of FirstNameTextBox.Text;
            //longOfSelection = (Session["lngOfC"]).ToString();
            
            //mbox("Hullo:)");
            //this is where you are actually ACCESSING the value of the hidden variable (ie. accessing the js variable)
            //ie. used for recieving javascript variables
            //TextBox1.Text = Hidden1.Value;
            //String latitudes;
            //String longitudes;
            //String driving_distances;
            //String driving_times;


            //longitudes = Hidden3.Value;
            //driving_distances = Hidden4.Value;
            //driving_times = Hidden5.Value;
             
            //Console.WriteLine(latitudes);
            //TextBox2.Text = Hidden2.Value;


       //Use AJAX method instead
            
            
            

            
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



            con.Open();
            SqlCommand cmd2 = new SqlCommand("Select employee_id from employee_det", con);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            //String ids = "";
            //Old Location: ArrayList ids = new ArrayList();
            int j = 0;
            while (reader2.Read())
            {
                ids.Add(reader2.GetValue(0).ToString());
                /*if (j == 1)
                {
                    locs = locs + reader.GetValue(0).ToString();
                }
                else
                {
                    locs = locs + ";" + reader.GetValue(0).ToString();
                }*/


                j++;
                //DropDownList1.Items.Add(reader.GetString(0));
            }

            reader2.Close();
            con.Close();

            //stringToSend2 = ids

    //The Remove-All Block of legend...
            con.Open();
            SqlCommand cmd3 = new SqlCommand("Delete from employee_latlng", con);
            cmd3.ExecuteNonQuery();
            con.Close();

            con.Open();
            SqlCommand cmd4 = new SqlCommand("Delete from employee_stats", con);
            cmd4.ExecuteNonQuery();
            con.Close();

            //reloadTable();
            //reloadIds();

    //Inserting id's and such
            con.Open();

            int k = 0;
            while (k < ids.Count)
            {
                SqlCommand cmd5 = new SqlCommand("insert into employee_latlng values ('" + ids[k] + "','','')", con);
                cmd5.ExecuteNonQuery();
                k++;
            }
              
            con.Close();

            con.Open();

            int l = 0;
            while (l < ids.Count)
            {
                SqlCommand cmd6 = new SqlCommand("insert into employee_stats values ('" + ids[l] + "','','')", con);
                cmd6.ExecuteNonQuery();
                l++;
            }

            con.Close();


            reloadIds();

            //the craziness starts here
            /*String latitudes;
            String longitudes;
            String driving_distances;
            String driving_times;

            latitudes = Hidden2.Value;
            longitudes = Hidden3.Value;
            driving_distances = Hidden4.Value;
            driving_times = Hidden5.Value; 
             
            Console.WriteLine(latitudes);
            TextBox1.Text = Hidden2.Value;
             */
 
            //           MessageDialog messageDialog = new MessageDialog("Welcome to employee demographics analysis, please click the button to the left of the map to proceed");

        }

        protected void move_Click(object sender, EventArgs e)
        {
            Response.Write("Hello!!");
        }

        protected void center_Click(object sender, EventArgs e)
        {
            //Insert lats' values into table
            con.Open();

            int i = 0;
            while(i < lats.Count)
            {
                //TextBox2.Text = (string)lats[i];
                SqlCommand cmd = new SqlCommand("insert into employee_latlng values ('a','" + (string)lats[i] + "','b')", con);
                cmd.ExecuteNonQuery();
                i++;
            }
            
            con.Close();
        }

        protected void changeOffice_Click(object sender, EventArgs e)
        {
            //TextBox2.Text = (string)lats[2];
        }
       /* private void fntest()
        {
            string strtest = hidtest.Value;
        }*/
       /* public static string MyMethod(string name)
        {
            return "Hello " + name;
        }*/
        public String GetSomeText()
        {
            String result = "this is from code behind";
            return result;
        }
        public String sendVariable()
        {
            return stringToSend;                //is called in order to send the first variable to the js
        }
        public String office()
        {
            return officeAddress;
        }
        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
        public String sendLatOfC()
        {
            return latOfC;                //is called in order to send the first variable to the js
        }
        public String sendLngOfC()
        {
            return lngOfC;                //is called in order to send the first variable to the js
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            godzilla.Enabled = false;
            latitudesYay = Hidden2.Value;
            longitudesYay = Hidden3.Value;
            distancesYay = Hidden4.Value;
            timesYay = Hidden5.Value;
            
            
            //TextBox1.Text = latitudesYay;
            //TextBox2.Text = latitudesYay;


            //NEW CODE
            //parse the latitudes string and store it into the lats array

            //string[] strs = str.Split(',');
            //ArrayList strsList = new ArrayList();
            //foreach (string s in strs)
              //  strsList.Add(s);

            string[] arrayOfLats = latitudesYay.Split(';');
            foreach (string s in arrayOfLats)
                lats.Add(s);
            
            foreach (string latitude in lats)
            {
                Console.WriteLine(latitude);
            }

            //Insert lats' values into table using UPDATE
            con.Open();

            int i = 0;
            while (i < lats.Count)
            {

                //Console.WriteLine(lats[i]);
                lats[i] = lats[i].ToString().Trim();
                //TextBox2.Text = (string)lats[i];
                //SqlCommand cmd = new SqlCommand("insert into employee_latlng values ('a','" + (string)lats[i] + "','b')", con);
                SqlCommand cmd = new SqlCommand("Update employee_latlng set employee_lat='" + lats[i] + "' where employee_id ='" + ids[i] + "'", con);
                cmd.ExecuteNonQuery();
                i++;
            }

            con.Close();


            string[] arrayOfDistances = distancesYay.Split(';');
            foreach (string s in arrayOfDistances)
                dists.Add(s);

            /*foreach (string latitude in lats)
            {
                Console.WriteLine(latitude);
            }*/

            //Insert distance values into table using UPDATE
            con.Open();

            i = 0;
            while (i < dists.Count)
            {

                //Console.WriteLine(lats[i]);
                dists[i] = dists[i].ToString().Trim();
                //TextBox2.Text = (string)lats[i];
                //SqlCommand cmd = new SqlCommand("insert into employee_latlng values ('a','" + (string)lats[i] + "','b')", con);
                //TextBox2.Text = dists.Count.ToString();
                SqlCommand cmd = new SqlCommand("Update employee_stats set employee_drivingdistance='" + dists[i] + "' where employee_id ='" + ids[i] + "'", con);
                cmd.ExecuteNonQuery();
                i++;
            }

            con.Close();

            string[] arrayOfTimes = timesYay.Split(';');
            foreach (string s in arrayOfTimes)
                times.Add(s);

            con.Open();

            i = 0;
            while (i < times.Count)
            {

                //Console.WriteLine(lats[i]);
                times[i] = times[i].ToString().Trim();
                //TextBox2.Text = (string)lats[i];
                //SqlCommand cmd = new SqlCommand("insert into employee_latlng values ('a','" + (string)lats[i] + "','b')", con);
                //TextBox2.Text = dists.Count.ToString();
                SqlCommand cmd = new SqlCommand("Update employee_stats set employee_drivingtime='" + times[i] + "' where employee_id ='" + ids[i] + "'", con);
                cmd.ExecuteNonQuery();
                i++;
            }

            con.Close();

            string[] arrayOfLongitudes = longitudesYay.Split(';');
            foreach (string s in arrayOfLongitudes)
                longs.Add(s);

            con.Open();

            i = 0;
            while (i < longs.Count)
            {

                //Console.WriteLine(lats[i]);
                longs[i] = longs[i].ToString().Trim();
                //TextBox2.Text = (string)lats[i];
                //SqlCommand cmd = new SqlCommand("insert into employee_latlng values ('a','" + (string)lats[i] + "','b')", con);
                //TextBox2.Text = dists.Count.ToString();
                SqlCommand cmd = new SqlCommand("Update employee_latlng set employee_long='" + longs[i] + "' where employee_id ='" + ids[i] + "'", con);
                cmd.ExecuteNonQuery();
                i++;
            }

            con.Close();


            //WHY IS THE FIRST LATITUDE GETTING STORED TWICE?!


            //JUNK
            //msc notes: put welcome to proceed message at the end of the final iteration of the invisible dist time loop IF # of page loads == 1. put "Geocoding Successful!" message anywhere in the howarelatsgettingstored() function. Keep "End" or replace it with the previous message. reloadIds, call reloadIds(), selected index changed, clean-up, "saved (potential) locations"
            //MessageBox.Show(latitudesYay);
            
            /*latitudes = Hidden2.Value;
            lats.Add(latitudes);
            TextBox2.Text = lats[0];*/

            //send office lat and lng to SQL table
            latToSend = Hidden6.Value;
            lngToSend = Hidden7.Value;
            
            con.Open();
            SqlCommand command = new SqlCommand("Delete from storeOffice", con);
            command.ExecuteNonQuery();
            SqlCommand command2 = new SqlCommand("Insert into storeOffice values('" + latToSend.ToString().Trim() + "','" + lngToSend.ToString().Trim() + "')", con);
            command2.ExecuteNonQuery();
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

            //DropDownList1.Items.Clear();                                  //R
            while (reader.Read())
            {
               // DropDownList1.Items.Add(reader.GetString(0));             //R
                //DropDownList1.Items.Add(reader.GetSqlString(0));          //R
            }

            reader.Close();
            con.Close();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           /* con.Open();
       //     SqlCommand cmd = new SqlCommand("Select * from employee_stats where employee_id='" + DropDownList1.SelectedItem + "'", con);              //R
            SqlDataReader reader;
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                //read the name and put it in the textbox
                //MessageBox.Show(reader[1].ToString());
               // TextBox1.Text = reader[1].ToString();                 //R
            }
            
            
            
            /*con.Open();
            SqlCommand cmd = new SqlCommand("Select * from employee_stats where employee_id='" + DropDownList1.SelectedValue + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();

            /*while (reader.Read())
            {
                TextBox2.Text = reader.GetString(0).ToString();
            }*/
            //myReader["Username"].ToString()
            /*while (reader.Read())
            {
                TextBox1.Text = reader["employee_drivingdistance"].ToString();
            }
                //TextBox2.Text = reader["employee_drivingtime"].ToString();
            reader.Close();
            con.Close();*/
        }
    }
}
