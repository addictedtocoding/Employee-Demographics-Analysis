<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="office.aspx.cs" Inherits="Project.office" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">

        .style1
        {
            text-align: center;
            font-size: xx-large;
        }
    </style>
    
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWqt5R-XsQaCRNk5P98FC5Cfrhk0VXk5o&sensor=false&libraries=geometry">
</script>

<script type="text/javascript">
var address;
var lat;
var lng;
function initialize()
{
    address = '<%= sendAddressToJS() %>';
    alert(address);
}
function geocode()
{

	//load and center map
  	var mapOptions = 
  	{
    		zoom: 8,
    		center: new google.maps.LatLng(12.9833, 77.5833),
    		mapTypeId: google.maps.MapTypeId.ROADMAP
  	}
  	var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);


	//read addresses from the textboxes
	geocoder = new google.maps.Geocoder();

	/*address1 = document.getElementById("address1").value;
	alert(address1);
	address2 = document.getElementById("address2").value;
	alert(address2);*/

	//store locations in array

	//convert to latitude and longitude and save to location1 & location2
  if (geocoder)
  {
   	geocoder.geocode( { 'address': address}, function(results, status)
   	{
      		if (status == google.maps.GeocoderStatus.OK)
      		{
         		//location of second address (latitude + longitude)
         		location2 = results[0].geometry.location;
         		lat = results[0].geometry.location.lat();
         		//lng = results[0].geometry.location.lng();
			alert(location2);
         		// calling the showMap() function to create and show the map
         		showMap();
      		} 
		else
      		{
        		alert("Geocode was not successful for the following reason: " + status);
      		}
   	});
  }
	
}

</script>
</head>
<body onload="initialize()">
    <form id="form2" runat="server">
    <div class="style1">

        <br />
        <br />
        <br />
        <img src="SquirrelInTree.jpg" 
            style="width: 455px; height: 301px; float: right" /></div>
    <div style="text-align: center; font-weight: 700; ">
        <p>
            &nbsp;</p>
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    &nbsp;&nbsp;&nbsp; Enter the address of your current office:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" Width="253px"></asp:TextBox>
    <br />
    &nbsp;&nbsp;&nbsp;
    <br />
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Ok" runat="server" OnClientClick="getLatLong()" onclick="Ok_Click" Text="Ok" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Clear" runat="server" Text="Clear" OnClientClick="submit()" onclick="Clear_Click" />
    <br />
    <br />
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div style="margin-left: 40px">
        <asp:Button ID="submit" runat="server" BackColor="#CCCCCC" Height="44px" 
            onclick="submit_Click" Text="Continue" Width="163px" />
            
         <asp:HiddenField ID="Hidden1" runat="server" />
         <asp:HiddenField ID="Hidden2" runat="server" />
    </div>
&nbsp;&nbsp;
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     <br />
    <br />
    <br />
    <br />
    <br />
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    </form>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
