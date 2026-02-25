<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="detail_article.aspx.cs" Inherits="ourspace.detail_article" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container shadow rounded" style="margin-top:5%; padding:25px">

    <asp:Button runat="server" ID="btnback" Text="Back To Articles" 
        CssClass="btn btn-sm btn-outline-success" onclick="btnback_Click" />
    <br/><br/>

<asp:Repeater runat="server" ID="repdetailarticle">
    <ItemTemplate>
        <p>
            <%#Eval("article")%>
        </p>
    </ItemTemplate>
</asp:Repeater>
    


</div>


</asp:Content>
