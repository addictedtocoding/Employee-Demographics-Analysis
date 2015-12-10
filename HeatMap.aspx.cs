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
    public partial class HeatMap : System.Web.UI.Page
    {
        String lats;
        String lngs;
        String address;
        String latitude;
        String longitude;
        SqlConnection con = new SqlConnection("Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
           // latitude = "12.9833";
           // longitude = "77.5833";
            
            con.Open();
            SqlCommand command = new SqlCommand("Select lat from storeOffice", con);
            SqlDataReader r = command.ExecuteReader();
            while (r.Read())
            {
                latitude = r.GetValue(0).ToString().Trim();
            }
            r.Close();
            con.Close();

            con.Open();
            SqlCommand command2 = new SqlCommand("Select lng from storeOffice", con);
            SqlDataReader r2 = command2.ExecuteReader();
            while (r2.Read())
            {
                longitude = r2.GetValue(0).ToString().Trim();
            }
            r2.Close();
            con.Close();
            
            con.Open();
            SqlCommand cmd = new SqlCommand("Select employee_lat from employee_latlng", con);
            SqlDataReader reader = cmd.ExecuteReader();
            lats = "";
            int i = 1;
            while (reader.Read())
            {
                if (i == 1)
                {
                    lats = lats + reader.GetValue(0).ToString();
                }
                else
                {
                    lats = lats + ";" + reader.GetValue(0).ToString();
                }


                i++;
            }

            reader.Close();
            con.Close();


            con.Open();
            SqlCommand cmd2 = new SqlCommand("Select employee_long from employee_latlng", con);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            lngs = "";
            i = 1;
            while (reader2.Read())
            {
                if (i == 1)
                {
                    lngs = lngs + reader2.GetValue(0).ToString();
                }
                else
                {
                    lngs = lngs + ";" + reader2.GetValue(0).ToString();
                }


                i++;
            }

            reader2.Close();
            con.Close();
        }

        public String latitudes()
        {
            return lats;
        }

        public String longitudes()
        {
            return lngs;
        }

        public String sendAddress()
        {
            return address;
        }

        public String sendLatToJS()
        {
            return latitude;
        }
        public String sendLngToJS()
        {
            return longitude;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}
