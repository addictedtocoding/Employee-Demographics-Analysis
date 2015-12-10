<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newlocations.aspx.cs" Inherits="Project.newlocations" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">




<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWqt5R-XsQaCRNk5P98FC5Cfrhk0VXk5o&sensor=false&libraries=geometry">
</script>

<script type = "text/javascript">

var map;
         var latitudes = new Array();
         var longitudes = new Array();
         var distances = new Array();
         var times = new Array();
         var recieve3;
         var tF = 0;
        // var reloaded = 0;
        // var loadVOffice = 0;

function initialize()
{


        //load and center map
        var mapOptions =
        {
            zoom: 12,
            center: new google.maps.LatLng(12.9833, 77.5833),
            mapTypeId: google.maps.MapTypeId.SATELLITE
        }
        var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

         tF = '<%= trueOrFalse() %>'; 
         
         var recieve;
         recieve = '<%= sendVariable() %>';
         //alert(recieve);                                                    //prints entire addresses (ie. "recieve") string
         var a = recieve.split(';');
         
        var counter = 0;
        while(counter<a.length)
        {
         //   alert (a[counter]);                   //R
            counter++;
        }
        
         var n = 0;
         var currentOfficeLocation;
         
         //reloaded = '<%= reloaded() %>'
         
       /* if(tF == 1)
        {
            
            var lat = '<%= sendLat() %>'
            var lng = '<%= sendLng() %>'
            //plots the office
            //var currentOfficeLocation = new google.maps.LatLng(12.9833, 77.5833);
            var currentOfficeLocation = new google.maps.LatLng(lat, lng);
            var currentOffice = new google.maps.Marker({
                position: currentOfficeLocation,
                title: "office"
            });
            currentOffice.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png')
            currentOffice.setMap(map);
        }*/

//PLOTTING EMPLOYEES BLOCK STARTS HERE
         var locs = new Array();      
        var i = 0;
        var j = 0;
        var k = 0;
        var l = 0;                                                                  //NEWEST UPDATE 3
        //loop start
        while (i < a.length)
        {    //alert(a[i]);

            var geo = new google.maps.Geocoder;

            geo.geocode({ 'address': a[i] }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) 
                {
                    //   var myLatLng = results[0].geometry.location;
                    var latitude = results[0].geometry.location.lat();               //NEWEST UPDATE- Strange things happen when you try to convert to a string...ToString...ToString()
                    latitudes[j] = latitude;
             //       alert(latitudes[j]);                                              //R 
                    var longitude = results[0].geometry.location.lng();
                    longitudes[j] = longitude;
                    j++;
                    var loc = new google.maps.LatLng(latitude, longitude);
                    loc2 = loc;
                    //alert(loc2);
                    var marker = new google.maps.Marker({
                        position: loc,
                        title: a[i]
                    });
                         
                   //locs[i] = loc;
                    marker.setMap(map);
                    
                    
                                 
                        if(tF == 1)
        {
            
            var lat = '<%= sendLat() %>'
            var lng = '<%= sendLng() %>'
            //plots the office
            //var currentOfficeLocation = new google.maps.LatLng(12.9833, 77.5833);
            var currentOfficeLocation = new google.maps.LatLng(lat, lng);
            var currentOffice = new google.maps.Marker({
                position: currentOfficeLocation,
                title: "office"
            });
            currentOffice.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png')
            currentOffice.setMap(map);
        }
                    
                 } 
                 else
                 {
                    alert("Geocode was not successful for the following reason: " + status);
                 } 
                   
              }); 
              i++;
           }
           //END OF PLOTTING EMPLOYEES
 }
 //closing bracket of initialize()
 
 
 function Calculate()
 {  
    /*alert("Hello World");
    //average driving distance
    var x = distances.length;
    var sumOfDists = 0;
    var i = 0;
    alert(distances[2]);
    while(i<distances.length)
    {
        sumOfDists = sumOfDists + distances[i];
        i++;
    }
    var avDDistance = sumOfDists/x;
    alert("average d distance = " + avDDistance);
    
    //average driving time
    var y = times.length;
    var sumOfTimes = 0;
    i = 0;
    while(i<times.length)
    {
        sumOfTimes = sumOfTimes + times[i];
        i++;
    }
    var avDTime = sumOfTimes/y;
    
    //standard deviation
    var standard_deviation_for_drivingdistance;
    var standard_deviation_for_drivingtime;
    var a = 0;
    var b = 0;
    
    i = 0;
    while(i < distances.length)
    {
        a = a + ((distances[i] - avDDistance)^2);
    }
    standard_deviation_for_drivingdistance = (a/(x - 1))^(0.5);

    i = 0;
    while(i < times.length)
    {
        b = b + ((times[i] - avDTime)^2);
    }    
    standard_deviation_for_drivingtime = (b/(y - 1))^(0.5);
    
    //sends these
    document.getElementById('<%= Hidden1.ClientID %>').value = avDDistance;
    document.getElementById('<%= Hidden2.ClientID %>').value = avDTime; 
    document.getElementById('<%= Hidden3.ClientID %>').value = standard_deviation_for_drivingdistance;
    document.getElementById('<%= Hidden4.ClientID %>').value = standard_deviation_for_drivingtime;*/
    
//loc code starts here
    //Loops through latitudes to see if the values are still there
    /*var i = 0;
    alert(latitudes.length);
    while(i < latitudes.length)
    {
        alert(i);
        alert("The latitude is " + latitudes[i]);
        i++;
    }
 
        i=0;
        alert(distances.length);
    while(i < distances.length)
    {
        alert(i);
        alert("The distance is " + distances[i]);
        i++;
    }
    
        i=0;
        alert(times.length);
    while(i < times.length)
    {
        alert(i);
        alert("The driving time is " + times[i]);
        i++;
    }*/
    
    
    
    var latString = "";
    var n = 0;
  //  alert("hello world");                   
    while (n < latitudes.length)
    {
        if (n == 0)
        {
            latString = latString + latitudes[n];
  //          alert(latString);                
        }
        else
        {
            latString = latString + ";" + latitudes[n];
  //          alert(latString);               
        }
    
  //      alert(latString);           
        n++;
    }
    
    var distString = "";
var l = 0;
alert("The length of the distances array is " + distances.length);
while (l < distances.length)
{
    if (l == 0)
    {
       distString = distString + distances[l];
    }
    else
    {
        distString = distString + ";" + distances[l];
    }
    
    l++;
}

var timeString = "";
var m = 0;
while (m < times.length)
{
    if (m == 0)
    {
       timeString = timeString + times[m];
    }
    else
    {
        timeString = timeString + ";" + times[m];
    }
    
    m++;
}

var lngString = "";
var k = 0;
while (k < longitudes.length)
{
    if (k == 0)
    {
       lngString = lngString + longitudes[k];
    }
    else
    {
        lngString = lngString + ";" + longitudes[k];
    }
    
    k++;
}


    document.getElementById('<%= Hidden2.ClientID %>').value = latString;
    document.getElementById('<%= Hidden4.ClientID %>').value = distString;
    document.getElementById('<%= Hidden5.ClientID %>').value = timeString; 
    document.getElementById('<%= Hidden3.ClientID %>').value = lngString;
    alert("Geocoding Successful!");
}
 
        

           
           
 
 </script>            
    <style type="text/css">
        .style1
        {
            font-size: medium;
        }
        .style2
        {
            font-size: small;
        }
        .style3
        {
            font-size: x-large;
            font-weight: bold;
            color: #CC3300;
            background-color: #000000;
        }
    </style>
</head>
<body bgcolor="#999966" onload = "initialize()">
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3" style="text-align: center" bgcolor="#0000CC">
                Candidate Locations</td>
        </tr>
        <tr>
            <td class="style2">
    <span style="text-align: center">
                <br />
                <br />
                <br />
                    <asp:HyperLink ID="Hyperlink1" runat="server" 
                    NavigateUrl="~/Locations.aspx">Home</asp:HyperLink>
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/EditInfo.aspx"><span 
                        style="text-align: center">Edit Employee Info</span></asp:HyperLink>
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/tables.aspx">Statistics</asp:HyperLink>
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink3" runat="server" 
                    NavigateUrl="~/scatterplots.aspx">Scatterplots</asp:HyperLink>
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink5" runat="server" 
                    NavigateUrl="~/saveLocations.aspx">Candidate Locations</asp:HyperLink>
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/HeatMap.aspx">Heat Map</asp:HyperLink>
                    <br />
                <br />
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Default.aspx"><span style="text-align: center">Logout</span></asp:HyperLink>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
            <td>
                <asp:Panel ID="Panel1" runat="server" BackColor="#666699" Height="1053px">
                    <br />
                    <b>Select a Location:</b><br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<br />
                    &nbsp;All locations outside a&nbsp;___&nbsp; km radius, and greater than 59 minutes in driving 
                    time from the virtual office/candidate office location will be excluded during 
                    calculations&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                    &nbsp;<br />
                    <asp:CheckBox ID="avoidTollRoads" runat="server" Text="Avoid Toll Roads" />
                    <br />
                    <asp:CheckBox ID="avoidHighways" runat="server" Text="Avoid Highways" />
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        style="height: 26px" Text="Plot on map" />
                    <br />
                    <br />
                    <asp:HyperLink ID="toStats" runat="server" Enabled="False" 
                        NavigateUrl="~/candStatisticsI.aspx">Click here to see statistics for this 
                    location</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    <div ID="map_canvas" margin-bottom:2px;"="" margin-right:500px;="" 
                        style="width:800px; height:500px;">
                        <asp:HiddenField ID="Hidden1" runat="server" />
                        <asp:HiddenField ID="Hidden2" runat="server" />
                        <asp:HiddenField ID="Hidden3" runat="server" />
                        <asp:HiddenField ID="Hidden4" runat="server" />
                        <asp:HiddenField ID="Hidden5" runat="server" />
                    </div>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
