<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inputOffice.aspx.cs" Inherits="Project.homepage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
alert ("hello world");
	//load and center map
  	/*var mapOptions = 
  	{
    		zoom: 8,
    		center: new google.maps.LatLng(12.9833, 77.5833),
    		mapTypeId: google.maps.MapTypeId.ROADMAP
  	}
  	var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);*/

alert("hello world");
	//read addresses from the textboxes
	//geocoder = new google.maps.Geocoder();

	/*address1 = document.getElementById("address1").value;
	alert(address1);
	address2 = document.getElementById("address2").value;
	alert(address2);*/

	//store locations in array

	//convert to latitude and longitude and save to location1 & location2
 alert("hello world");
var geo = new google.maps.Geocoder;
geo.geocode({'address':address},function(results, status){
    if (status == google.maps.GeocoderStatus.OK) {              
        var myLatLng = results[0].geometry.location;
    } else {
        alert("Geocode was not successful for the following reason: " + status);
    }
});

alert(myLatLng);
   	/*geocoder.geocode( { 'address': address}, function(results, status)
   	{
      		if (status == google.maps.GeocoderStatus.OK)
      		{
 
         		var latitude = results[0].geometry.location.lat();
         		//lng = results[0].geometry.location.lng();
			alert(latitude);
			lat = latitude;
         		// calling the showMap() function to create and show the map
         		//showMap();
      		} 
		else
      		{
        		alert("Geocode was not successful for the following reason: " + status);
      		}
   	});*/
}
	


function getLatLong()
   {
         alert("submitted!");
         var address;
         //document.getElementById.
         //address = '<%= sendVariable() %>';
         address = document.getElementById('TextBox1').value;
         var a = address.trim();
         //var a = new Array();
        // a[0] = address.trim();
        // alert(a);

            var geo = new google.maps.Geocoder;
            var latitude;
            var longitude;

            var i = 0;
            //while (i < a.length) {
            alert(a);

            var geo = new google.maps.Geocoder;
            geo.geocode({ 'address': a }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    //   var myLatLng = results[0].geometry.location;
                  //var latLng = results[0].geometry.location;
                     latitude = results[0].geometry.location.lat();
                     longitude = results[0].geometry.location.lng();
                    var loc = new google.maps.LatLng(latitude, longitude);
                    
                    
                    //latitudes[i] = latitude;
                    //longitudes[i] = longitude
                    //locs[i] = loc;
                    
                    //alert(latitude);
                    //alert(latLng);

                } else {
                    alert("Geocode was not successful for the following reason: " + status);
                }
            });

         //   i++;
        //}
            alert(longitude);
            
   }
   
   function submit()
   {
       document.getElementById('<%= Hidden1.ClientID %>').value = latitude;
       document.getElementById('<%= Hidden2.ClientID %>').value = longitude;
   }
   
    function geocodeThisStuff()
    {
         alert("hello world");
         //var latitudes;
         //var longitudes;
         //var locs;
         
         //var i = 0;
         //alert("pre loop");
         /*
        while (i < a.length) {
            //alert(a[i]);

            var geo = new google.maps.Geocoder;
            geo.geocode({ 'address': a[i] }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    //   var myLatLng = results[0].geometry.location;
                  
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    var loc = new google.maps.LatLng(latitude, longitude);
                    
                    latitudes[i] = latitude;
                    longitudes[i] = longitude
                    locs[i] = loc;
                    
                    alert(latitudes[i]);

                } else {
                    alert("Geocode was not successful for the following reason: " + status);
                }
            });

            i++;
        }
         */
    }
    </script>
</head>
<body bgcolor="#996633">
    <form id="form1" runat="server">
    <div class="style1">

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
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
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
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
    </form>
</body>
</html>

