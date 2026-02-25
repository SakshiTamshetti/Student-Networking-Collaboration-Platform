<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="student_list.aspx.cs" Inherits="ourspace.student_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container shadow" style="margin-top:5%; padding:25px">
    
    <div class="row">
            <div class="col-sm-10">
                <asp:TextBox ID="txtsearch" class="form-control-sm form-control" placeholder="Search" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                <asp:Button ID="btnsearch" class="btn btn-sm btn-warning" runat="server" Text="Search" />
            </div>
    </div>

    <div style="margin-top:20px">
        <center>
            <asp:GridView runat="server" ID="gvstudentlist" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>   
                    <asp:BoundField DataField="fullname" HeaderText="Student Name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="phone" HeaderText="Phone" />
                    <asp:BoundField DataField="dob" HeaderText="Date of Birth" />
                    <asp:BoundField DataField="statename" HeaderText="State" />
                    <asp:BoundField DataField="cityname" HeaderText="City" />
                </Columns>
                
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </center>
    </div>

</div>



</asp:Content>
