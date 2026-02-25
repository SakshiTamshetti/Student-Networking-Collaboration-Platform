<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="sqna.aspx.cs" Inherits="ourspace.sqna" %>
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
        <p style="text-align:center; font-weight:bold"><%#Eval("fullname")%> </p>
        <hr/>
        <p><%#Eval("question")%> </p>
        <p><%#Eval("adate")%> </p>
        <asp:Button runat="server" CommandArgument=<%#Eval("qid")%> Text="View Answers" CssClass="btn btn-sm btn-outline-primary" />
    </div>
    </div>

</ItemTemplate>

</asp:Repeater>
</div>
    
</div>


</asp:Content>
