<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="s_readarticles.aspx.cs" Inherits="ourspace.s_readarticles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container shadow bg-light" style="margin-top:5%; padding:25px">

<asp:Repeater runat="server" ID="reparticles" 
        onitemcommand="reparticles_ItemCommand">
    
    <HeaderTemplate>Read Articles</HeaderTemplate>

    <ItemTemplate>
        <div class="row shadow rounded" style="padding:25px">
            
            <div>
            
            <div class="row">
               
               
                <div class="col-sm-6" style="text-align:left">
                <p style="font-size:12px;color:gray">
                <img src="itemlisticon.png" width=20px height="20px" />
                 Upload Date:<%#Eval("adate")%></p>
                </div>
                <div class="col-sm-6" style="text-align:right">
                <p style="text-align:right; font-size:12px;color:gray">Article By-<%#Eval("fullname")%></p>
                </div>
                </div>

                <br/>
                <%#Eval("article")%>
                <br/>
                

                
                Rate This: <asp:ImageButton ID="ImageButton1" style="vertical-align:bottom" Height="20px" runat="server" CommandArgument=<%#Eval("aid")%> ImageUrl="~/plus.png" />
                
                <hr />
                
            </div>

        </div>
    </ItemTemplate>

</asp:Repeater>

    
</div>




</asp:Content>
