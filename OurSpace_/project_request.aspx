<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="project_request.aspx.cs" Inherits="ourspace.project_request" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container" style="margin-top:5%; padding:25px">


<div class="row">
<asp:Repeater runat="server" ID="repprojects">

<ItemTemplate>

    <div class="col-sm-4" style="padding:10px">
    <div class="shadow zoom" style="padding:10px">
          <p style="text-align:center; font-size:18px">
          <%#Eval("fullname")%> 
          <img src="p.png" height="80px" />
          </p>
        <hr />
        <p><b>  Project Title:<%#Eval("title")%> </b></p>
        <p><%#Eval("details")%> </p>
        <p><%#Eval("dtime")%> </p>
        <img src="plus.png" height="20px" />
    </div>
    </div>

</ItemTemplate>

</asp:Repeater>
</div>
    
</div>
</asp:Content>
