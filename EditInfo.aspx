<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditInfo.aspx.cs" Inherits="Project.EditInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 543px;
        }
        .style2
        {
            height: 814px;
        }
        .style3
        {
            height: 91px;
        }
        .style5
        {
            font-size: x-large;
        }
        .style6
        {
            text-align: center;
        }
    </style>
    <script type ="text/javascript">
    
        function confirmInsert() {
            if (confirm('are you sure you want to insert ?')) {
            return true;
            }else{
            return false;
            }
        }  
        function confirmUpdate() {
            if (confirm('are you sure you want to update ?')) {
            return true;
            }else{
            return false;
            }    
        }   
        function confirmDelete() {
            if (confirm('are you sure you want to delete ?')) {
            return true;
            }else{
            return false;
            }
        }  
        
        function retry()
        {
           alert("The ID you entered is not unique. Please try again");
        }
        
        function fieldsAreBlank()
        {
            alert("Cannot Insert- The ID and/or address fields are blank. Please try again.");
        }
        
        function cannotUpdate()
        {
            alert("Cannot Update- The address field is empty");
        }
    
    </script> 
</head>
<body bgcolor="#999966">
    <span style="text-align: center">
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td bgcolor="#CC0000" class="style3">
                </span><span class="style5" style="text-align: center">Edit Employee Information</span></td>
        </tr>
        <tr>
            <td class="style2">
    <span style="text-align: center">
                <asp:Panel ID="Panel2" runat="server" BackColor="#666699" Height="1092px" 
                    style="text-align: center; margin-left: 0px">
                    <br />
                    <br />
                    <span style="text-align: center">
                    <asp:HyperLink ID="back" runat="server" NavigateUrl="~/Locations.aspx">Go back 
                    to homepage</asp:HyperLink>
                    </span>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Height="133px" Width="486px" HorizontalAlign="Center">
                        <RowStyle BackColor="#EFF3FB" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <div class="style6">
                        <br />
                        <br />
                        <br />
                        :</div>
                    <p class="style6">
                        <strong>&nbsp;<span style="text-align: center"><b>Insert:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b></span></strong>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" 
                            ontextchanged="TextBox1_TextChanged"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    <p class="style6">
                        &nbsp;<b>Update/Delete:&nbsp;&nbsp; </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="text-align: center">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="27px" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="161px">
                        </asp:DropDownList>
                        </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </p>
                    <span style="text-align: center">
                    <p class="style6">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>
                    </span>
                    <p class="style6">
                        <span style="text-align: center">Address-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox2" runat="server" ontextchanged="TextBox2_TextChanged" 
                            Width="297px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
                    <p class="style6">
                        &nbsp;</p>
                    <p class="style6">
                        Return to homepage and re-geocode after making any changes
                    </p>
                    <br />
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="insert" runat="server" OnClientClick="return confirmInsert();" onclick="insert_Click" Text="Insert" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="update" runat="server" OnClientClick="return confirmUpdate();" onclick="update_Click" Text="Update" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
                        ID="delete" runat="server" OnClientClick="return confirmDelete();" 
                        onclick="delete_Click" Text="Delete" style="width: 55px" />
                    <br />
                    <br />
                    <div>
                            <asp:HiddenField ID="Hidden1" runat="server" />
                            <asp:HiddenField ID="Hidden2" runat="server" />
                            <asp:HiddenField ID="Hidden3" runat="server" />
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p style="text-align: center; margin-left: 320px">
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        &nbsp;</p>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
