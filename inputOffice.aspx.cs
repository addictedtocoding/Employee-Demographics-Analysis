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
    public partial class homepage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails;Integrated Security=True");
        String address;
        String latitude;
        String longitude;
        String lat;
        String lng;
        protected void Page_Load(object sender, EventArgs e)
        {
            //latitude = Hidden1.Value.ToString();
            //longitude = Hidden2.Value.ToString();

            //TextBox1.Text = latitude;

            //address = TextBox1.Text;

            
        }
        public String sendVariable()
        {
            return address;                //is called in order to send the first variable to the js
        }
        public string sendAddressToJS()
        {
            address = TextBox1.Text;
            return address;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            address = TextBox1.Text;
            Session["address"] = address.ToString().Trim();
            //Session["lat"] = latitude;
            //Session["lng"] = longitude;

            //TextBox2.Text = latitude;
            Response.Redirect("Locations.aspx");

        }

        protected void Ok_Click(object sender, EventArgs e)
        {
            latitude = Hidden1.Value.ToString();
            longitude = Hidden2.Value.ToString();
            //address = (TextBox1.Text).ToString().Trim();
            //TextBox1.Text = "";
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            //TextBox1.Text = "";
        }
    }
}
