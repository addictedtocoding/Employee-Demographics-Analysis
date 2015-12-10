<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HeatMap.aspx.cs" Inherits="Project.HeatMap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    
<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWqt5R-XsQaCRNk5P98FC5Cfrhk0VXk5o&sensor=false&libraries=geometry,visualization">
</script>

<script type="text/javascript">

var latitudes = new Array();
var longitudes = new Array();
var heatmapData = [];
function initialize()
{


         var recieve;
         var recieve2;
         recieve = '<%= latitudes() %>';
         recieve2 = '<%= longitudes() %>';
        // alert(recieve2);                                                    //prints entire addresses (ie. "recieve") string
         latitudes = recieve.split(';');
         longitudes = recieve2.split(';');

  var mapOptions =
  {
      zoom: 12,
      center: new google.maps.LatLng(12.9833, 77.5833),
      mapTypeId: google.maps.MapTypeId.SATELLITE
  }

  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
  
            var lat = '<%= sendLatToJS() %>';
            var lng = '<%= sendLngToJS() %>';
           // alert(lat);
           // alert(lng);
  
       //   var currentOfficeLocation = new google.maps.LatLng(12.9833, 77.5833);
        var currentOfficeLocation = new google.maps.LatLng(lat, lng);
        var currentOffice = new google.maps.Marker({
            position: currentOfficeLocation,
            title: "office"
        });
        currentOffice.setIcon('http://maps.google.com/mapfiles/ms/icons/purple-dot.png')
        currentOffice.setMap(map);
  
  //var heatmapData = [];
  /*var heatmapData = new Array();
  
  for (var i = 0; i < latitudes.length; i++) 
  {
    alert("Hello World");
    var lat = latitudes[i];
    var lng = longitudes[i];
    var latLng = new google.maps.LatLng(lat, lng);
    heatmapData[i] = latLng;
    alert(heatmapData[i]);
  }*/
  
     
     /*  var lat = latitudes[1];
       alert(latitudes[1]);
       alert(longitudes[1]);
       var lng = longitudes[1];*/
  
  var heatmapData = [
//  new google.maps.LatLng(lat, lng),
 // new google.maps.LatLng(12.9765926, 77.59917410000003),
 // new google.maps.LatLng(12.9715987, 77.59456269999998),
 // new google.maps.LatLng(13.0167682, 77.56613879999998),
 // new google.maps.LatLng(12.9461808, 77.51034460000005),
 // new google.maps.LatLng(12.9715987, 77.59456269999998),
 // new google.maps.LatLng(13.2007489, 77.70950319999997),
];
  
   pointArray = new google.maps.MVCArray(heatmapData);

//    var latLng = new google.maps.LatLng(lat, lng)
 // pointArray.push(new google.maps.LatLng(lat, lng));                      //This WORKS!
  
    for (var i = 0; i < latitudes.length; i++) 
  {
   // alert("Hello World");
    var lat = latitudes[i];
    var lng = longitudes[i];
    pointArray.push(new google.maps.LatLng(lat, lng));
   // var latLng = new google.maps.LatLng(lat, lng);
   // heatmapData[i] = latLng;
   // alert(heatmapData[i]);
  }
  
  // pointArray.push(new LatLng("12.9725583", "77.59491109999999"));
  // pointArray.push(new LatLng("12.9715987", "77.59456269999998"));
   
   heatmap = new google.maps.visualization.HeatmapLayer({
    data: pointArray
});
heatmap.setMap(map);
  
   /* var heatmap = new google.maps.visualization.HeatmapLayer({
    data: heatmapData
    });
    alert("Hello World");
    heatmap.setMap(map);*/


//var loc = new google.maps.LatLng(latitude, longitude);
/*var heatmapData = [
  new google.maps.LatLng(37.782, -122.447),
  new google.maps.LatLng(37.782, -122.445),
  new google.maps.LatLng(37.782, -122.443),
  new google.maps.LatLng(37.782, -122.441),
  new google.maps.LatLng(37.782, -122.439),
  new google.maps.LatLng(37.782, -122.437),
  new google.maps.LatLng(37.782, -122.435),
  new google.maps.LatLng(37.785, -122.447),
  new google.maps.LatLng(37.785, -122.445),
  new google.maps.LatLng(37.785, -122.443),
  new google.maps.LatLng(37.785, -122.441),
  new google.maps.LatLng(37.785, -122.439),
  new google.maps.LatLng(37.785, -122.437),
  new google.maps.LatLng(37.785, -122.435)
];*/

/*var sanFrancisco = new google.maps.LatLng(37.774546, -122.433523);

map = new google.maps.Map(document.getElementById('map_canvas'), {
  center: sanFrancisco,
  zoom: 13,
  mapTypeId: google.maps.MapTypeId.SATELLITE
});*/

}

function generateHeatMap()
{
    alert(latitudes[2]);
  
    var heatmap = new google.maps.visualization.HeatmapLayer({
    data: heatmapData
    });
    heatmap.setMap(map);
}
</script>

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 996px;
        }
        .style3
        {
            text-align: center;
        }
    </style>

</head>
<body bgcolor="#666633" onload="initialize()">
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td bgcolor="Black">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
    <div style="text-align: center; font-size: x-large; ">
    
        <br />
        Heat Map of Employee Locations<br />
        <br />
        <br />
        <br />
                        <div ID="map_canvas" margin-bottom:2px;"="" margin-right:500px;="" 
                            style="width:1000px; height:500px; text-align: center;">
                        </div>
        <br />
        <br />
    </div>
                </td>
                <td bgcolor="Black" class="style3">
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Locations.aspx">Return 
                    To Homepage</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/EditInfo.aspx">Edit 
                    Information</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/tables.aspx">Statistics</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/scatterplots.aspx">Scatterplots</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink5" runat="server" 
                        NavigateUrl="~/saveLocations.aspx">Candidate Locations</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/HeatMap.aspx">Heat 
                    Map</asp:HyperLink>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Default.aspx">Logout</asp:HyperLink>
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
            </tr>
        </table>
    </form>
    </body>
</html>
