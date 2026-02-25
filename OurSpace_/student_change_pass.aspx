<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_change_pass.aspx.cs" Inherits="ourspace.student_change_pass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container containerdiv scon shadow">
    
        <h3 style="text-align:center">Student Login</h3>
        <br />
        <div style="margin-left:26%; margin-right:17%">
    <asp:TextBox ID="txtoldpass"  MaxLength="50" placeholder="Enter Old Password" 
            CssClass="form-control form-control-sm" runat="server" TextMode="Password" 
                Width="493px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Enter old Password" ControlToValidate="txtoldpass" 
            ForeColor="Red"></asp:RequiredFieldValidator>

 <asp:TextBox ID="txtnpass" placeholder="Enter Password" MaxLength="10" 
            TextMode="Password" CssClass="form-control form-control-sm" runat="server" 
                Width="493px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="Enter New Password" ControlToValidate="txtnpass" ForeColor="Red"></asp:RequiredFieldValidator>

<asp:TextBox ID="txtcnpass" placeholder="Confirm Password" MaxLength="10" 
            TextMode="Password" CssClass="form-control form-control-sm" runat="server" 
                Width="493px"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="Password Must Match" ControlToCompare="txtcnpass" 
            ControlToValidate="txtnpass" ForeColor="Red"></asp:CompareValidator>


    <div style="text-align:right; margin-top:10px">
        <asp:Button runat="server" ID="btnchange" Text="Change" 
            class="btn btn-sm btn-info" onclick="btnchange_Click"/>

        <asp:Button runat="server" CausesValidation="false" ID="Button1" Text="Cancel" class="btn btn-sm btn-danger" />
        </div>
    </div>
    </div>




</asp:Content>
