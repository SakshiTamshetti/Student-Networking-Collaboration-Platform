<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="freelance_login.aspx.cs" Inherits="ourspace.freelance_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="fmain">
<div class="container containerdiv shadow flogin"  style="height:250px; width:600px; margin-bottom:50px;" >
    
        <center><h3>Freelancer Login</h3></center>
        <br>

    <asp:TextBox ID="txtemail"  MaxLength="50" placeholder="Enter Emailid" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Enter Email id" ControlToValidate="txtemail" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Enter Valid Email id" ControlToValidate="txtemail" 
        ForeColor="Red" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

 <asp:TextBox ID="txtpass" placeholder="Enter Password" MaxLength="10" TextMode="Password" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="Enter Password" ControlToValidate="txtpass" ForeColor="Red"></asp:RequiredFieldValidator>

    <div style="text-align:right; margin-top:10px">
        <asp:Button runat="server" ID="btnlogin" Text="Login" 
            class="btn btn-sm btn-primary" onclick="btnlogin_Click" />

        <asp:Button runat="server" CausesValidation="false" ID="Button1" Text="Cancel" class="btn btn-sm btn-danger" />
        <asp:Button runat="server" CausesValidation="false" ID="btnsignup" 
            Text="Sign Up" class="btn btn-sm btn-info" 
            onclick="btnsignup_Click" />

    </div>

</div>

</div>

</asp:Content>
