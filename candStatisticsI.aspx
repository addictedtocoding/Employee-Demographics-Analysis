<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="candStatisticsI.aspx.cs" Inherits="Project.candStatisticsI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>



    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWqt5R-XsQaCRNk5P98FC5Cfrhk0VXk5o&sensor=false&libraries=geometry">
</script>

<script type = "text/javascript">

var map;
         var latitudes = new Array();
         var longitudes = new Array();
         var distances = new Array();
         var times = new Array();

         
    function initialize() {


/*var object = new ActiveXObject("Scripting.FileSystemObject");
var file = object.CreateTextFile("C:\Latitudes.txt", false);
file.WriteLine('Hello World');
file.Close();*/        

//step 1: Please enter the location (path) of project.exe
//login, step 1, step 2, step 3, step 4, homepage:D {locations.aspx}

/*var xmlhttp;		//creates a new variable to be used for ajax purposes
     
    
    //checks to see what type of browser you're using and initializes the variable as an object of the appropriate type.
     if (window.XMLHttpRequest){
        xmlhttp=new XMLHttpRequest();
    }else{
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }*/
        
        //load and center map
        var mapOptions =
  {
      zoom: 12,
      center: new google.maps.LatLng(12.9833, 77.5833),
      mapTypeId: google.maps.MapTypeId.SATELLITE
  }

        var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

 
       // var a = new Array();
        var latlong = new Array();
        var locations = new Array();
        var markers = new Array();
        /*a[0] = "iisc, bangalore";
        a[1] = "ub city, bangalore";
        a[2] = "cubbon park, bangalore";
        a[3] = "bandipur national park, bangalore";*/
    
         var recieve;
         recieve = '<%= sendVariable() %>';
         //alert(recieve);                                                    //prints entire addresses (ie. "recieve") string
         var a = recieve.split(';');
         var n = 0;
         
         while(n < a.length)
         {
            //alert(n);
            //alert(a[n]);                                                    //prints each of the addresses successively
            n++;
         }
         
         
//plots the office
        /*var currentOfficeLocation = new google.maps.LatLng(12.9833, 77.5833);
        var currentOffice = new google.maps.Marker({
            position: currentOfficeLocation,
            title: "office"
        });
        currentOffice.setIcon('http://maps.google.com/mapfiles/ms/icons/blue-dot.png')
        currentOffice.setMap(map);*/
            var lat = '<%= sendLatOfSelectedOffice() %>'
            var lng = '<%= sendLngOfSelectedOffice() %>'
            var avoidTollRoads = '<%= sendAvoidTollRoads() %>'                                     //R
            var avoidHighways = '<%= sendAvoidHighways() %>'                                      //R
      //      alert(avoidTollRoads);                                                                  //R
      //      alert(avoidHighways);                                                                   //R
            
            //plots the office
            //var currentOfficeLocation = new google.maps.LatLng(12.9833, 77.5833);
            var currentOfficeLocation = new google.maps.LatLng(lat, lng);
            var currentOffice = new google.maps.Marker({
                position: currentOfficeLocation,
                title: "office"
            });
            currentOffice.setIcon('http://maps.google.com/mapfiles/ms/icons/blue-dot.png')
            currentOffice.setMap(map);
   
   
   
         //geocoding
         //distances, times, etc. array declarations USED to be here
         /*var latitudes = new Array();
         var longitudes = new Array();
         var distances = new Array();
         var times = new Array();*/
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
           //         alert(latitudes[j]); 
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
                    marker.setMap(map);
                    
                    //determine driving distance and time and store these in their respective arrays
                    loc2 = loc;
                    directionsService = new google.maps.DirectionsService();

                    directionsDisplay = new google.maps.DirectionsRenderer(
                    {
                        suppressMarkers: true,
                        suppressInfoWindows: true
                    });
                    
                    directionsDisplay.setMap(map);
      
                                
                    if((avoidTollRoads.toLowerCase() == "true") && (avoidHighways.toLowerCase() == "true"))               //R
                    {
                       var request = {
                         origin:loc2,
                         destination:loc1,
                         travelMode: google.maps.DirectionsTravelMode.DRIVING,
                         avoidHighways: true,                                            //R
                         avoidTolls: true                                               //R
                       };
                    }
                    else if((avoidTollRoads.toLowerCase() == "true") && (avoidHighways.toLowerCase == "false"))
                    {
                       var request = {
                         origin:loc2,
                         destination:loc1,
                         travelMode: google.maps.DirectionsTravelMode.DRIVING,
                         avoidHighways: false,                                            //R
                         avoidTolls: true                                               //R
                       };
                    }
                    else if((avoidTollRoads.toLowerCase() == "false") && (avoidHighways.toLowerCase() == "true"))
                    {
                       var request = {
                         origin:loc2,
                         destination:loc1,
                         travelMode: google.maps.DirectionsTravelMode.DRIVING,
                         avoidHighways: true,                                            //R
                         avoidTolls: false                                               //R
                       };                    
                    }
                    else
                    {
             //           alert("Hello World");                                             //R
                       var request = {
                         origin:loc2,
                         destination:loc1,
                         travelMode: google.maps.DirectionsTravelMode.DRIVING,
                         avoidHighways: false,                                            //R
                         avoidTolls: false                                               //R
                       };                    
                    }
                    


                    directionsService.route(request, function(response, status)
                    {
                    var distance = response.routes[0].legs[0].distance.text;
                    var time = response.routes[0].legs[0].duration.text;
                    distances[l] = parseInt(distance);
     //               alert(distances[l]);                                              //R
                    times[l] = parseInt(time);
                    l++;
             //       alert(distances[i]);                                            //(loop test #2)- prints each distance using the array- ditto
                    k++;
             //       alert(times[i]);                                                    //(loop test #3)- prints each time using the time variable- ditto (ie. all of these are OUT OF ORDER)
                      
                      //NEWEST CODE
                     /* if((k == a.length))               // && (pageReloaded == "false"))     
                      {
                           if (confirm('Welcome to Employee Demographics Analysis! Click ok to continue, or cancel to return to the login')) 
                            {
                                howAreLatsGettingStored();
                            } 
                            else 
                            {
                                alert("BLAH");
                            }
                       }*/
                      //NEWEST CODE END 
                            
                            
                      /*if (status == google.maps.DirectionsStatus.OK)
                        {
                             directionsDisplay.setDirections(response);
                             var distance_and_time = "The distance between the two points on the chosen route is: "+response.routes[0].legs[0].distance.text;
                             distance_and_time += ". The aproximative driving time is: "+response.routes[0].legs[0].duration.text;
     
                             document.getElementById("distance_road").innerHTML = distance_and_time;

                             alert(distance_and_time);
                        }*/
                    });
                    //END DIST and TIME
                    
                
                } else {
                    alert("Geocode was not successful for the following reason: " + status);
                }
            });

            i++;
        }
//loop end

//alert("Hello World");
                     // This code will be executed each time the readyState changes
  /*  xmlhttp.onreadystatechange = function()
    {                                   					//this is a nested function which keeps checking the ready state.
        if(ajaxRequest.readyState == 4)
        {                               					//this if statement executes your code when the desired ready state is 										reached ...4 means everything has completed
            var i = 0;
            alert("The length of latitudes is " + latitudes.length);
            while(i < latitudes.length)
            {
                alert(i);
                alert("The latitude is " + latitudes[i]);
                i++;
            }
            //document.getElementById("myData").innerHTML=xmlhttp.responseText;	//in this case, the text from the sample php function (a fuction in the 										aspx.cs file, in your case) will be displayed in the division in the body 										(ie. xmlhttp.responseText (the text from executing the c# side function in 										your case) is assigned to innerHTML, where the division name is myData).
        }
    }      */      



//Func1Delay();

//function Func1Delay()
//{
//setTimeout("nestedFunction()", 10000);
//}



    //Loops through latitudes to see if the values are still there
//function nestedFunction()
//{
    //jumboWhileLoop();

//}



//New strategy 1: send variable to array with each iteration of the loop            //least viable of all these options
//New strategy 2: does typecasting solve the problem?
//New strategy 3: connect to sql database from javascript and send data with each iteration
//New strategy 4: inbetween transfer variable (unlikely to make any difference)


 //JUNK goes here
   //     var row = event.row                             //gets the current row # of the js code
   //  document.getElementById('hidtest').value=row;      //sets the value of hidtest (in C#), to row
   // alert("hello world");
    
    
    
    //alert("hello world");
    //	var conn = new ActiveXObject("ADODB.Connection");
	//alert("line 1");

	//var connectionstring = "Provider=sqloledb; Data Source=ALISHA-GUPTA; Initial Catalog=employeedetails; User ID=ALISHA-GUPTA/Alisha Gupta"
	//conn.Open(connectionstring)
	//var rs = new ActiveXObject("ADODB.Recordset")
	//rs.Open("employee_latlng", conn)
// Be aware that I am selecting from this table, but you need to pick your own table
//	while(!rs.eof)
//	{
//		alert(rs(0));
//		rs.movenext
//	}
	 
//	 rs.close
//	conn.close 
//	 alert("End");
	//-->
    //var alpha = "string1";
  //var beta = "string2";
//alert(alpha);
//alert(beta);
 //var rs = new ActiveXObject("ADODB.Recordset");
 //alert("line 1");
//var conn = new ActiveXObject("ADODB.Connection")
//alert("line 1);
//var connectionstring = "Data Source=MDB12;Initial Catalog=MARKET;Provider=SQLOLEDB;Trusted_Connection=yes";  
//set connection1 = Server.CreateObject("ADODB.Connection");
//alert('line1');
//	connection1.Open("C:\Documents and Settings\Alisha Gupta\My Documents\employeedetails.mwb");
//alert('line2');	
//sqlString="INSERT INTO employee_latlng ";
//alert('line3');	
//sqlString=sqlString & "(employee_id, employee_latlng) VALUES ('" & alpha & "','" & beta & "')";
//alert('line4');
//connection1.Execute sqlString;
//alert('line5');
//connection1.close;
//alert('line6');
        //END NEW CODE II
        
        
        //NEW CODE
      /* var connection = new ActiveXObject("ADODB.Connection") ;
        var alpha = "blah";
        var beta = "blah2";
        var connectionstring="Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails;Integrated Security=True";

        connection.Open(connectionstring);
        var rs = new ActiveXObject("ADODB.Recordset");

        rs.Open("Insert into employee_latlng values('" alpha + "','" + beta + "')", connection);
        rs.MoveFirst
    while(!rs.eof)
    {
        document.write(rs.fields(1));
        rs.movenext;
    }

    rs.close;
    connection.close;*/

/*   
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.Jet.OLEDB.4.0"
conn.Open "c:/webdata/northwind.mdb"

sql="INSERT INTO employee_latlng (employee_id, employee_latlng,"
sql=sql & " VALUES "
sql=sql & "('" & alpha & "',"
sql=sql & "'" & beta & "'," & "')"

on error resume next
conn.Execute sql, recaffected
if err<>0 then
  Response.Write("No update permissions!")
else
  Response.Write("<h3>" & recaffected & " record added</h3>")
end if
conn.close*/

   /* Getting access to the database */
        //   var alpha = "blah";
      //  var beta = "blah2";
    //var connection = new ActiveXObject("ADODB.Connection");
    //var connectionstring = "Data Source=ALISHA-GUPTA;Initial Catalog=employeedetails";      //;User ID=Alisha Gupta;Password=hermes;Provider=SQLOLEDB
    //connection.Open(connectionstring);

    /* JavaScript obect to access a SQL query's results */
    //var rs = new ActiveXObject("ADODB.Recordset");

    /* Getting the current MAX(id) from the database */
    /*rs.Open("SELECT MAX(id) FROM Screen_Template", connection);
    rs.MoveFirst;
    var maxID = rs.Fields.Item(0);
    maxID = maxID + 1;
    rs.close; */

    /* TODO: Get the last UID */
    //var sql = "INSERT INTO employee_latlng VALUES ('" + alpha + "','" + beta + "')";
    //alert(sql);
    //rs.Open(sql, connection);

    /* Closing the connections */
    //rs.close;
  //  connection.close;
        //NEW CODE END
        
        
        //note: ' ' for strings (ie. alphanumeric), no quotes for numbers
        
        
        /*highlightMarker(currentOffice, highlight);



        function highlightMarker(marker, highlight) {
        var color = "#FE7569";
        if (highlight) {
        color = "#0000FF";
        }
        marker.setImage(getIcon(color).image);
        } */






        /*var address2 = "ub city, bangalore";
        var geo = new google.maps.Geocoder;
        geo.geocode({'address':address2},function(results, status){
        if (status == google.maps.GeocoderStatus.OK) {              
        //   var myLatLng = results[0].geometry.location;
        var latitude = results[0].geometry.location.lat();
        var longitude = results[0].geometry.location.lng(); 
        var loc = new google.maps.LatLng(latitude,longitude);

        var marker5 = new google.maps.Marker({
        position: loc,
        title: address2
        });

        marker5.setMap(map);

        // Add some code to work with myLatLng              

        } else {
        alert("Geocode was not successful for the following reason: " + status);
        }
        });
        */
//google search: javascript + using hidden fields to send data to the code behind
//[WebMethod]
   // function test()
    //{
  //      alert(PageMethods.MyMethod("blah"));
//    }


  
//closing bracket of the initialize() function 

}
        

function howAreLatsGettingStored()
{

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
//alert("The length of the distances array is " + distances.length);
while (l < distances.length)
{
    if (l == 0)
    {
       distString = distString + distances[l];
    }
    else
    {
        distString = distString + " ;" + distances[l];
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
 //   alert("Geocoding Successful!");                                                   //R
}
 
 
function sendStrings()
{
//conversion of arrays to be sent into strings
//latitudes,longitudes,distances,times

var latString = "blah";
var j = 0;

alert("hello world");                   //this prints successfully
alert(latString);                       //this prints successfully
alert(latitudes[0]);                    //prints "undefined"...so clearly the problem is with how the latitudes are getting stored...try converting/typecasting to a string...
while (j < latitudes.length)
{
    if (j == 0)
    {
       latString = latString + latitudes[j];
       alert(latString);                //does not print even once
    }
    else
    {
        latString = latString + ";" + latitudes[j];
        alert(latString);               //does not print even once
    }
    
    alert(latString);           //this does not print even once
    j++;
}
/*
String lngString = "";
int k = 0;
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

String distString = "";
int l = 0;
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

String timeString = "";
int m = 0;
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
*/

//code used to send
document.getElementById('<%= Hidden2.ClientID %>').value = "alpha";
document.getElementById('<%= Hidden3.ClientID %>').value = "beta";
document.getElementById('<%= Hidden4.ClientID %>').value = "gamma";
document.getElementById('<%= Hidden5.ClientID %>').value = "delta";    

/*document.getElementById('<%= Hidden2.ClientID %>').value = latString;
document.getElementById('<%= Hidden3.ClientID %>').value = lngString;
document.getElementById('<%= Hidden4.ClientID %>').value = distString;
document.getElementById('<%= Hidden5.ClientID %>').value = timeString;  */
  
 
}  
  
  

function moveTo()
{

}
         
</script>
    <style type="text/css">

        .style3
        {
            text-align: left;
        }
        </style>
</head>
<body bgcolor = "#996633" onload = "initialize()" style="font-weight: 700">
    <form id="form1" runat="server" __designer:mapid="0">
<h2>
    <p style="margin-left: 40px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="godzilla" runat="server" 
        OnClientClick="howAreLatsGettingStored()" onclick="Button1_Click" 
             Text="Display Statistics" BackColor="#CCCCCC" Height="96px" 
            Width="860px" Enabled="False" />
    &nbsp;&nbsp;&nbsp; </p>
    </h2>
<br>
 <asp:Panel ID="Panel1" runat="server">   
     <%--Place holder to fill with javascript by server side code--%>
     <asp:Literal ID="js" runat="server"></asp:Literal>
     <%--Place for google to show your MAP--%>
     <div ID="map_canvas" margin-bottom:2px;"="" margin-right:500px; style="width:0px; height:0px;">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     </div>
     <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
     <div class="style3">
         <br />
         <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:HiddenField ID="Hidden1" runat="server" />
         <asp:HiddenField ID="Hidden2" runat="server" />
         <asp:HiddenField ID="Hidden3" runat="server" />
         <asp:HiddenField ID="Hidden4" runat="server" />
         <asp:HiddenField ID="Hidden5" runat="server" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <br />
         <br />
     </div>
     <p>
         &nbsp;<p>
             &nbsp;<p>
                 &nbsp;</p>
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
             <p>
                 &nbsp;</p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
             <p>
             </p>
         </p>
     </p>
 </asp:Panel>
    <p>
        &nbsp;</p>
    </p>

<asp:ScriptManager ID="ScriptManager1" 
    EnablePageMethods="true" 
    EnablePartialRendering="true" runat="server"/>



    </form>
 
</body>
</html>


