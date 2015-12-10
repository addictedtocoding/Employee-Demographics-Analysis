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
    public partial class saveLocations : System.Web.UI.Page
    {
        double serialNoOfPreviousEntry;
        ArrayList lats = new ArrayList();
        ArrayList longs = new ArrayList();
        String addresses;
        String numbers;
        ArrayList serNumbers = new ArrayList();
        SqlConnection con = new SqlConnection("Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from savedAddLocations", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "savedAddLocations");
            GridView1.DataSource = ds;
            GridView1.DataMember = "savedAddLocations";
            GridView1.DataBind();
            con.Close();

            //loads id's in combo box
            con.Open();
            SqlCommand cmd = new SqlCommand("Select serial_number from savedAddLocations", con);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                DropDownList1.Items.Add(reader.GetString(0));
                // DropDownList1.Items.Add(reader.GetSqlString(0));
            }

            reader.Close();
            con.Close();


            //puts all the addresses into a string variable so that it can be sent over to the js and subsequently be geocoded
            /*con.Open();
            //SqlDataAdapter ada2 = new SqlDataAdapter("Select * from savedAddLocations", con);
            //DataSet ds2 = new DataSet();

            SqlCommand cmd2 = new SqlCommand("Select address from savedAddLocations", con);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            Response.Write("Hello World");

            String locs = "";
            int i = 1;
            while (reader2.Read())
            {
                if (i == 1)
                {
                    locs = locs + reader2.GetValue(0).ToString().Trim();
                }
                else
                {
                    locs = locs + ";" + reader2.GetValue(0).ToString().Trim();
                    
                }

                serNumbers.Add(i);
                i++;
            }

            reader2.Close();
            con.Close();

            addresses = locs;
            Response.Write(addresses);

            //Deleting the contents (if any) of savedLatLngLocations
            con.Open();
            SqlCommand cmd3 = new SqlCommand("Delete from savedLatLngLocations", con);
            cmd3.ExecuteNonQuery();
            con.Close();

           
            //Inserting id's and such
            con.Open();

            int k = 0;
            while (k < serNumbers.Count)
            {
                SqlCommand cmd5 = new SqlCommand("insert into savedLatLngLocations values ('" + serNumbers[k] + "','','')", con);
                cmd5.ExecuteNonQuery();
                k++;
            }

            con.Close();*/

            
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            /*String latitudesYay = Hidden2.Value;
            String longitudesYay = Hidden3.Value;
            //distancesYay = Hidden4.Value;
            //timesYay = Hidden5.Value;
            
            
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
                lats[i] = lats[i].ToString();
                //TextBox2.Text = (string)lats[i];
                //SqlCommand cmd = new SqlCommand("insert into employee_latlng values ('a','" + (string)lats[i] + "','b')", con);
                SqlCommand cmd = new SqlCommand("Update savedLatLngLocations set latitude='" + lats[i] + "' where serial_number ='" + serNumbers[i] + "'", con);
                cmd.ExecuteNonQuery();
                i++;
            }

            con.Close();


           /* string[] arrayOfDistances = distancesYay.Split(';');
            foreach (string s in arrayOfDistances)
                dists.Add(s);

    
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

            con.Close();*/

            /*string[] arrayOfTimes = timesYay.Split(';');
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

            con.Close();*/

           /* string[] arrayOfLongitudes = longitudesYay.Split(';');
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
                SqlCommand cmd = new SqlCommand("Update savedLatLngLocations set longitude='" + longs[i] + "' where serial_number ='" + serNumbers[i] + "'", con);
                cmd.ExecuteNonQuery();
                i++;
            }

            con.Close();
            Response.Redirect("newlocations.aspx");*/

            Response.Redirect("cc.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {   //ie. THE DELETE BLOCK
            con.Open();
            SqlCommand cmd = new SqlCommand("Delete from savedAddLocations where serial_number='" + DropDownList1.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();

            reloadTable();
            reloadIds();

            //NEW:
            //Response.Redirect("saveLocations.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {   //THE INSERT BLOCK
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from savedAddLocations", con);
            DataSet ds = new DataSet();

            SqlCommand cmd = new SqlCommand("Select serial_number from savedAddLocations", con);
            SqlDataReader reader = cmd.ExecuteReader();

            int i = 0;
            serialNoOfPreviousEntry = 0;
            String trimMe;
            double largestSerialNo = 0;

                while (reader.Read())
                {
                    //Response.Write(reader.GetValue(0).ToString().Trim());
                    trimMe = reader.GetValue(0).ToString().Trim();
                    serialNoOfPreviousEntry = Double.Parse(trimMe);
                    if(largestSerialNo < serialNoOfPreviousEntry)
                    {
                        largestSerialNo = serialNoOfPreviousEntry;
                    }
                    //Response.Write(serialNoOfPreviousEntry);
                    i++;
                }

            reader.Close();
            con.Close();
            
            
            if (TextBox2.Text.Equals(""))
            {
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "CallJS", "fieldIsEmpty();", true);
            }
            else
            {
                con.Open();
                SqlCommand cmd2 = new SqlCommand("insert into savedAddLocations values ('" + (largestSerialNo + 1).ToString() + "','" + TextBox2.Text + "')", con);
                cmd2.ExecuteNonQuery();
                con.Close();
                serialNoOfPreviousEntry++;


                reloadTable();
                reloadIds();

                //NEW:
                //Response.Redirect("saveLocations.aspx");
            }
        }

        private void reloadTable()
        {
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from savedAddLocations", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "savedAddLocations");
            GridView1.DataSource = ds;
            GridView1.DataMember = "savedAddLocations";
            GridView1.DataBind();
            con.Close();
        }
        private void reloadIds()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select serial_number from savedAddLocations", con);
            SqlDataReader reader = cmd.ExecuteReader();

            DropDownList1.Items.Clear();
            while (reader.Read())
            {
                DropDownList1.Items.Add(reader.GetString(0));
            }

            reader.Close();
            con.Close();
        }
        public String sendAddresses()
        {
            //Response.Write(addresses);            //wow this is the most bizzare thing ever. If I uncomment this, it writes the address values to the addresses array all over again (ie. so each address will be stored twice) OwO
            return addresses;
        }
        public String sendNumbers()
        {
            return numbers;
            //dunno if I'll actually need to use this...
        }
    }
}






/*using System.Data.SqlClient;
namespace Project
{
    public partial class saveLocations : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //Show the Addresses Table (the only one the user has any interaction with)
            con.Open();
            SqlDataAdapter ada = new SqlDataAdapter("Select * from savedAddLocations", con);
            DataSet ds = new DataSet();

            ada.Fill(ds, "savedAddLocations");
            GridView1.DataSource = ds;
            GridView1.DataMember = "savedAddLocations";
            GridView1.DataBind();
            con.Close();

            //reloadTable();
           // reloadIds();

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //CONTINUE--purpose: to insert lat and lng values into the second table (after deleting, of course) and then redirect to the next form
            
        }


    }       
}





*/
