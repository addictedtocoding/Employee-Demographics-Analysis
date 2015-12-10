<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tables.aspx.cs" Inherits="Project.tables" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
            }
        .style3
        {
            width: 100%;
            height: 965px;
        }
        .style4
        {
            width: 280px;
        }
        .style5
        {
            text-align: center;
            height: 69px;
        }
    </style>
    <script type="text/javascript">
    
    function needToGeocode()
    {
        alert("Sorry, you need to re-geocode before navigating to the statistics page, in order to generate statistics. Please click the \"Geocode/Retrieve Data\" button on the homepage before proceeding to the statistics page");
        location.href = "Locations.aspx?id=1";
        //"Sorry, yada ...in order to view statistics...yada..."
        //document.location.href("Locations.aspx");
        //Please return to the homepage and press the \"geocode/retrieve data\" button
    }
    </script>
</head>
<body bgcolor="#999966">
    <form id="form1" runat="server">
    <div style="text-align: left; font-size: large">
    
        <table class="style3">
            <tr>
                <td bgcolor="#CC3300" class="style5" colspan="2">
                    <span class="style1">Tables</span><br />
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Panel ID="Panel1" runat="server">
                        <br />
                        <asp:HyperLink ID="Hyperlink1" runat="server" NavigateUrl="~/Locations.aspx">Home</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/EditInfo.aspx">Edit 
                        Employee Info</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/tables.aspx">Statistics</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/scatterplots.aspx">Scatterplots</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink5" runat="server" 
                            NavigateUrl="~/saveLocations.aspx">Candidate Locations</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/HeatMap.aspx">Heat 
                        Map</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Default.aspx">Logout</asp:HyperLink>
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
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="Panel2" runat="server" BackColor="#999999" 
                        style="text-align: center">
                        <br />
                        <br />
                        <b>Employee Addresses</b><br />
                        <br />
                        <asp:GridView ID="GridView8" runat="server" BackColor="White" 
                            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center">
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        </asp:GridView>
                        <br />
                        <br />
                        <br />
                        <b>General Statistics</b><br />
                        <br />
                        <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" 
                            GridLines="None" HorizontalAlign="Center">
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <br />
                        <br />
                        <b>
                        <br />
                        Latitudes and Longitudes</b><br />
                        <br />
                        <asp:GridView ID="GridView2" runat="server" BackColor="LightGoldenrodYellow" 
                            BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
                            GridLines="None" HorizontalAlign="Center">
                            <FooterStyle BackColor="Tan" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        </asp:GridView>
                        <br />
                        <br />
                        <b>
                        <br />
                        Driving Distance and Time by Employee</b><br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                            GridLines="None" HorizontalAlign="Center">
                            <RowStyle BackColor="#EFF3FB" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <br />
                        <br />
                        <b>
                        <br />
                        <br />
                        Table Used to Generate Scatterplot #1</b><br />
                        <br />
                        <asp:GridView ID="GridView6" runat="server" BackColor="White" 
                            BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center">
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        </asp:GridView>
                        <br />
                        <br />
                        <br />
                        <b>Table Used to Generate Scatterplot #2</b><br />
                        <br />
                        <asp:GridView ID="GridView9" runat="server" BackColor="White" 
                            BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center">
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        </asp:GridView>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
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
                        <br />
                        <br />
                    </asp:Panel>
                </td>
            </tr>
        </table>
    
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
        <br />
    
    </div>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    </form>
</body>
</html>
