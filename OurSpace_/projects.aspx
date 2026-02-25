<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="projects.aspx.cs" Inherits="ourspace.projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




<div class="container shadow" style="margin-top:5%; padding:25px">


<div class="row">
<asp:Repeater runat="server" ID="repprojects">

<ItemTemplate>

    <div class="col-sm-4" style="padding:10px">
    <div class="shadow zoom" style="padding:10px">
        <p style="text-align:center; font-size:18px"><%#Eval("fullname")%> 
        <img src="pr.png" height="80px" />
        </p>
            <hr />
        <p><b>  Project Title: <%#Eval("ptitle")%> </b> </p>
        <p><%#Eval("pdetails")%> </p>
        <p><%#Eval("udate")%> </p>
        <a href=<%#Eval("pfile")%>> <img src="dw.png"  height="20px"/>    Download</a>
        <img src="plus.png" height="20px" />
    </div>
    </div>

</ItemTemplate>

</asp:Repeater>
</div>
    
</div>



</asp:Content>
