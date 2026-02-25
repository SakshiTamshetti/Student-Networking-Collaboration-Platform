<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="uploadproject.aspx.cs" Inherits="ourspace.uploadproject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="shadow container containerdiv scon">

 <h2 style="text-align:center"> Upload Project</h2>
 <br />
 <div style="margin-left:17%; margin-right:17%">
    <asp:TextBox runat="server" ID="txttitle" placeholder="Enter Project Title" CssClass="form-control form-control-sm">
    </asp:TextBox>
    <br/>
    <asp:TextBox runat="server" ID="details" TextMode="MultiLine" placeholder="Enter Project Details" CssClass="form-control form-control-sm">
    </asp:TextBox>
    <br/>
    <asp:FileUpload CssClass="form-control form-control-sm" ID="pfileu" runat="server" />
    <br />
    
    <div style="text-align:right; margin-top:10px">
        <asp:Button runat="server" ID="btnupload" Text="Upload" 
            class="btn btn-info btn-sm" onclick="btnupload_Click"  />
            <asp:Button runat="server" ID="btncancel" Text="Cancel" 
            class="btn btn-danger btn-sm"  />
    </div>
    </div>
</div>
</asp:Content>
