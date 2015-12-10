<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="scatterplots.aspx.cs" Inherits="Project.scatterplots" %>

<%@ Register assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 222px;
        }
        .style5
        {
            text-align: center;
        }
    </style>
</head>
<body bgcolor="#999966">
    <form id="form1" runat="server">
    <div style="text-align: left; font-size: x-large">
    
        <table class="style3">
            <tr>
                <td style="text-align: center" bgcolor="#999966">
                    &nbsp;</td>
                <td bgcolor="#666666" class="style5">
                    Scatterplots</td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Panel ID="Panel1" runat="server" Height="727px" Width="251px">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <span style="text-align: center">
                        <asp:HyperLink ID="Hyperlink1" runat="server" NavigateUrl="~/Locations.aspx">Home</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/EditInfo.aspx"><span 
                            style="text-align: center">Edit Employee Info</span></asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/tables.aspx">Statistics</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/scatterplots.aspx">Scatterplots</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink5" runat="server" 
                            NavigateUrl="~/saveLocations.aspx">Candidate 
                        Locations</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/HeatMap.aspx">Heat Map</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Default.aspx"><span 
                            style="text-align: center">Logout</span></asp:HyperLink>
                        <br />
                        </span>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="Panel2" runat="server" Height="726px" style="font-size: medium" 
                        BackColor="#666699">
                        <br />
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            

            
            
            
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" 
                            Height="366px" Width="487px" style="text-align: center; margin-left: 0px">
                            <Series>
                                <asp:Series ChartType = "Point"  Name="Series1" XValueMember = "scatterplot_numberofemployees" YValueMembers = "scatterplot_averagedrivingdistance" MarkerColor="Red">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <b>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        x-axis:</b> number of employees<br />
                        <b>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        y-axis:</b> average driving distance<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:employeedetailsConnectionString2 %>" 
                            SelectCommand="SELECT [scatterplot_averagedrivingdistance], [scatterplot_numberofemployees] FROM [scatterplot#1]">
                        </asp:SqlDataSource>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    
        <br />
        <br />
    
    </div>
    <p class="style1">
        &nbsp;</p>
    <p class="style1">
        &nbsp;</p>
    <p class="style1">
        &nbsp;</p>
    <p class="style1">
        &nbsp;</p>
    </form>
</body>
</html>
