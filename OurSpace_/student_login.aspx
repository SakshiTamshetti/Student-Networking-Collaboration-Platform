<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="student_login.aspx.cs" Inherits="ourspace.student_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .form-control-sm
        {
            
            margin-left: 19px;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="smain">
<div class="container containerdiv shadow-lg scon divs "style="width:600px; margin-bottom: 36px; outline-width:thick">
    
        <h3 style="margin-left: 198px; width: 402px;">Student Login</h3>
        <br />
    <asp:TextBox ID="txtemail"  MaxLength="50" placeholder="Enter Email-id" 
            CssClass="form-control form-control-sm" runat="server" Width="493px" 
            Height="34px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Enter Email id" ControlToValidate="txtemail" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Enter Valid Email id" ControlToValidate="txtemail" 
        ForeColor="Red" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

 <asp:TextBox ID="txtpass" placeholder="Enter Password" MaxLength="10" 
            TextMode="Password" CssClass="form-control form-control-sm" runat="server" 
            Width="492px" Height="34px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="Enter Password" ControlToValidate="txtpass" ForeColor="Red"></asp:RequiredFieldValidator>

    <div style="text-align:right; margin-top:10px;margin-right:10px">
        <asp:Button runat="server" ID="btnlogin" Text="Login" 
            class="btn btn-sm btn-info" onclick="btnlogin_Click" />

        <asp:Button runat="server" CausesValidation="false" ID="Button1" Text="Cancel" class="btn btn-sm btn-danger" />
        <asp:Button runat="server" CausesValidation="false" ID="btnsignup" 
            Text="Sign Up" class="btn btn-sm btn-primary" 
            onclick="btnsignup_Click" />

    </div>
</div>
</div>

</asp:Content>
