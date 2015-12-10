<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="commitChanges.aspx.cs" Inherits="Project.commitChanges" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            font-size: medium;
            text-align: center;
        }
    </style>
    
    
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWqt5R-XsQaCRNk5P98FC5Cfrhk0VXk5o&sensor=false&libraries=geometry">
</script>

<script type = "text/javascript">


         var latitudes = new Array();
         var longitudes = new Array();
         var distances = new Array();
         var times = new Array(); 
         
function initialize() 
{
        var latlong = new Array();
        var locations = new Array();
        var markers = new Array();

         var recieve;
         recieve = '<%= sendVariable() %>';
         //alert(recieve);                                                    //prints entire addresses (ie. "recieve") string
         var a = recieve.split(';');
         var n = 0;
         
         while(n < a.length)
         {
            //alert(n);
            alert(a[n]);                                                    //prints each of the addresses successively
            n++;
         }
         
         
//plots the office
        /*var currentOfficeLocation = new google.maps.LatLng(12.9833, 77.5833);
        var currentOffice = new google.maps.Marker({
            position: currentOfficeLocation,
            title: "office"
        });
        currentOffice.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png')
        currentOffice.setMap(map);*/
   
   
   
         //geocoding
         //distances, times, etc. array declarations USED to be here
         var locs = new Array();
         var loc1 = currentOfficeLocation;
         //alert(loc1);                                               //prints the coordinates of the current office location
         var loc2;
        
        var i = 0;
        var j = 0;
        var k = 0;
        var l = 0;                                                                  //NEWEST UPDATE 3
//loop start
        while (i < a.length) {
            //alert(a[i]);

            var geo = new google.maps.Geocoder;
            geo.geocode({ 'address': a[i] }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    //   var myLatLng = results[0].geometry.location;
                    var latitude = results[0].geometry.location.lat();               //NEWEST UPDATE- Strange things happen when you try to convert to a string...ToString...ToString()
                    latitudes[j] = latitude;
           //        alert(latitudes[j]); 
                    var longitude = results[0].geometry.location.lng();
                    longitudes[j] = longitude;
                    j++;
                    var loc = new google.maps.LatLng(latitude, longitude);

                    var marker = new google.maps.Marker({
                        position: loc,
                        title: a[i]
                    });
            
                                                                       //NEWEST UPDATE 2- this variable declaration, and the if-else statement below it
                     
                   //longitudes[i] = longitude;
                   locs[i] = loc;
                   //address1 = a[i];                               //I commented this out because I don't remember what it is for...
                   // longitudes[i] = longitude;
                   // locs[i] = loc;
                   // alert(latitudes);
                    //alert(latitudes[i]);                                    //(loop test #1)- prints each of the latitudes using the value stored in the array- comes AFTER the loop length test
                  
                    //determine driving distance and time and store these in their respective arrays
                    loc2 = loc;
                    directionsService = new google.maps.DirectionsService();

                    /*directionsDisplay = new google.maps.DirectionsRenderer(
                    {
                        suppressMarkers: true,
                        suppressInfoWindows: true
                    });*/
                    
                    //directionsDisplay.setMap(map);
                    var request = {
                         origin:loc2,
                         destination:loc1,
                         travelMode: google.maps.DirectionsTravelMode.DRIVING
                    };

                    directionsService.route(request, function(response, status)
                    {
                    var distance = response.routes[0].legs[0].distance.text;
                    var time = response.routes[0].legs[0].duration.text;
                    distances[l] = distance;
                    times[l] = time;
                    l++;
             //       alert(distances[i]);                                            //(loop test #2)- prints each distance using the array- ditto
                    k++;
             //       alert(times[i]);                                                    //(loop test #3)- prints each time using the time variable- ditto (ie. all of these are OUT OF ORDER)
                      
                    });
                    //END DIST and TIME
                    
                
                } else {
                    alert("Geocode was not successful for the following reason: " + status);
                }
            });

            i++;
        }
//loop end




  
//closing bracket of the initialize() function 

}
        

function sendValuesToCS()
{

    //Loops through latitudes to see if the values are still there
    var i = 0;
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
    }
    
    
    
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
//alert("The length of the distances array is " + distances.length);
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
</head>
<body bgcolor="#996633" onload="initialize()">
    <form id="form1" runat="server">
    <div>
         <asp:HiddenField ID="Hidden1" runat="server" />
         <asp:HiddenField ID="Hidden2" runat="server" />
         <asp:HiddenField ID="Hidden3" runat="server" />
         <asp:HiddenField ID="Hidden4" runat="server" />
         <asp:HiddenField ID="Hidden5" runat="server" />
    </div>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="style1">Are you sure you wish to commit these changes? Press Ok to 
        proceed, or cancel to return to the previous page.&nbsp;</span></p>
    <p>
        &nbsp;</p>
    <p style="text-align: center">
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/SquirrelInTree.jpg" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p style="text-align: center">
        <asp:Button ID="ok" runat="server" Height="26px" Text="Ok" OnClientClick="sendValuesToCS()" onclick="ok_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="cancel" runat="server" Height="26px" Text="Cancel" 
            onclick="cancel_Click" />
    </p>
    </form>
</body>
</html>
