<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="ourspace.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container" style="padding:25px; margin-top:3%">
<h3>Events</h3>
<div class="row">
<asp:Repeater runat="server" ID="repevent">
    
    <ItemTemplate>
        <div class="col-sm-3" style="padding:25px">
            
              <div class="shadow rounded zoom" style="padding:10px">
                
                <center>
                 Event- <%#Eval("title")%>
                 <hr />
                    <img src=<%#Eval("eventimage")%> height="100px" />
                </center>
               
                <br />
                <p style="font-size:12px;color:gray">Added Date- <%#Eval("adate")%></p>
                <img src="plus.png" height="20px" />
              </div>

        </div>
    </ItemTemplate>

</asp:Repeater>

</div>
</div>
</asp:Content>
