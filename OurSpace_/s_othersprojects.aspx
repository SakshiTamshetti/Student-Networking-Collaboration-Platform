<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="s_othersprojects.aspx.cs" Inherits="ourspace.s_othersprojects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container shadow bg-light" style="margin-top:5%; padding:25px">

<h3>Others Uploaded Projects</h3>
<div class="row">
<asp:Repeater runat="server" ID="repuproject" 
        onitemcommand="repuproject_ItemCommand">
    
   

    <ItemTemplate>
            <div class="col-sm-3" style="padding:20px">
                <div class="shadow rounded" style="padding:25px">
                <p><%#Eval("ptitle")%></p>
                    <hr/>
                <p><%#Eval("pdetails")%></p>
                <p>Uploaded on: <%#Eval("udate")%></p>
                <a href=<%#Eval("pfile")%> target=_blank>Download</a>
                <br />
                Rate this : <asp:ImageButton style="vertical-align:bottom" runat="server" CommandArgument=<%#Eval("pid")%> ImageUrl="~/plus.png" Height="20px"/>
                
                </div>
            </div>
    </ItemTemplate>

</asp:Repeater>
    </div>
</div>

</asp:Content>
