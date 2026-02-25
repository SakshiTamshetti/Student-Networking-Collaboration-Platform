<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="student_reg.aspx.cs" Inherits="ourspace.student_reg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container containerdiv shadow">

<h3>Student Registration</h3>


<div>
    <asp:TextBox ID="txtfullname" MaxLength="50" placeholder="Enter Full Name" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Enter Full Name" ControlToValidate="txtfullname" ForeColor="Red"></asp:RequiredFieldValidator>

    <asp:TextBox ID="txtemail"  MaxLength="50" placeholder="Enter Emailid" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Enter Email id" ControlToValidate="txtemail" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Enter Valid Email id" ControlToValidate="txtemail" 
        ForeColor="Red" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>


    <asp:TextBox ID="txtphone" MaxLength="10" placeholder="Enter Mobile No." CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="Enter Mobile No." ControlToValidate="txtphone" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
        ErrorMessage="Enter 10 digit Mobile No." ControlToValidate="txtphone" 
        ForeColor="Red" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>

    <asp:TextBox type="date" placeholder="Enter Date of Birth" MaxLength="20" CssClass="form-control form-control-sm" ID="txtdob" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="Select Date" ControlToValidate="txtdob" ForeColor="Red"></asp:RequiredFieldValidator>

   

    <asp:DropDownList class="form-select form-select-sm" ID="drdstate" 
        runat="server" AutoPostBack="True" 
        onselectedindexchanged="drdstate_SelectedIndexChanged">
    </asp:DropDownList>
    <br/>

    <asp:DropDownList class="form-select form-select-sm" ID="drdcity" runat="server">
    </asp:DropDownList>
    <br/>
     <asp:TextBox ID="txtpass" placeholder="Enter Password" MaxLength="10" TextMode="Password" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="Enter Password" ControlToValidate="txtpass" ForeColor="Red"></asp:RequiredFieldValidator>


        <div style="text-align:right; margin-top:10px">
            <asp:Button ID="btnsubmit" runat="server" Text="Sign up" 
                CssClass="btn btn-sm btn-outline-success" onclick="btnsubmit_Click" />
            <asp:Button ID="btncancel" runat="server" Text="Cancel" CausesValidation="false" CssClass="btn btn-sm btn-outline-danger" />
        </div>
</div>

</div>

</asp:Content>
