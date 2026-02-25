<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="articles.aspx.cs" Inherits="ourspace.articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container shadow" style="margin-top:5%; padding:25px">


<div class="row">
<asp:Repeater runat="server" ID="repprojects" 
        onitemcommand="repprojects_ItemCommand">

<ItemTemplate>

    <div class="col-sm-4" style="padding:10px">
    <div class="shadow zoom" style="padding:10px">
        <p style="text-align:center; font-size:18px"><%#Eval("fullname")%> 
        
        <img src="article.png" height="40px" />
        
        </p>
        <hr />
        <p><%#Eval("adate")%> </p>
        <img src="plus.png" height="20px"> <%#Eval("cnt")%>
        <asp:Button runat="server" CommandArgument=<%#Eval("aid")%> Text="Read Article" CssClass="btn btn-sm btn-outline-primary" />
    </div>
    </div>

</ItemTemplate>

</asp:Repeater>
</div>
    
</div>

</asp:Content>
