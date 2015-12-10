<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="candStatisticsII.aspx.cs" Inherits="Project.candStatisticsII" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
<script type="text/javascript">
    function sorry()
    {
        alert("You were briefly disconnected from the Google Maps Geocoder. Please resubmit the form");
        location.href = "newlocations.aspx?id=1";
    }
</script>
</head>
<body bgcolor="#996633">
    <form id="form1" runat="server">
    <p style="text-align: center">
        &nbsp;</p>
                        <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" 
                            GridLines="None" style="text-align: center">
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                        <p>
                            &nbsp;</p>
    <p>
                            <asp:GridView ID="GridView4" runat="server" 
                                CellPadding="4" ForeColor="#333333" GridLines="None">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/newlocations.aspx" 
        style="font-size: large">Go Back</asp:HyperLink>
</form>
</body>
</html>
