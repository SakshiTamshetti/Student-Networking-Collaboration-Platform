<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_cp.aspx.cs" Inherits="ourspace.admin_cp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container containerdiv shadow">
    
        <h3>Admin Change Password</h3>

    <asp:TextBox ID="txtoldpass"  MaxLength="50" placeholder="Enter Old Password" 
            CssClass="form-control form-control-sm" runat="server" 
            TextMode="password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Enter old Password" ControlToValidate="txtoldpass" 
            ForeColor="Red"></asp:RequiredFieldValidator>

 <asp:TextBox ID="txtnpass" placeholder="Enter Password" MaxLength="10" 
            TextMode="Password" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="Enter New Password" ControlToValidate="txtnpass" ForeColor="Red"></asp:RequiredFieldValidator>

<asp:TextBox ID="txtcnpass" placeholder="Confirm Password" MaxLength="10" 
            TextMode="Password" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="Password Must Match" ControlToCompare="txtcnpass" 
            ControlToValidate="txtnpass" ForeColor="Red"></asp:CompareValidator>


    <div style="text-align:right; margin-top:10px">
        <asp:Button runat="server" ID="btnchange" Text="Change" 
            class="btn btn-sm btn-outline-primary" onclick="btnchange_Click"/>

        <asp:Button runat="server" CausesValidation="false" ID="Button1" Text="Cancel" class="btn btn-sm btn-outline-primary" />

    </div>

</div>


</asp:Content>
