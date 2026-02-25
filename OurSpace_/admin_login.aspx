<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="ourspace.admin_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




<div class="container shadow" style="margin-top:5%; padding:25px">
    
    <h4>Admin Login</h4>

    <asp:TextBox class="form-control form-control-sm" placeholder="Enter User Name" MaxLength="10" ID="txtusername" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Enter User Name" ControlToValidate="txtusername" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:TextBox class="form-control form-control-sm" ID="txtpass" TextMode="Password" MaxLength="10" placeholder="Enter Password" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Enter Password" ControlToValidate="txtpass" ForeColor="Red"></asp:RequiredFieldValidator>

    <div style="text-align:right;margin-top:10px">
        <asp:Button ID="btnlogin" runat="server" Text="Login" 
            class="btn btn-sm btn-outline-success" onclick="btnlogin_Click" />
        <asp:Button ID="btncancel" runat="server" Text="Cancel" class="btn btn-sm btn-outline-danger" CausesValidation="false" />
    </div>
</div>



</asp:Content>
 