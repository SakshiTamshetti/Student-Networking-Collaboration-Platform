<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="others_events.aspx.cs" Inherits="ourspace.others_events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<div class="container bg-light" style="padding:25px; margin-top:3%">
<h3>Events</h3>
<div class="row">
<asp:Repeater runat="server" ID="repevent" onitemcommand="repevent_ItemCommand">
    
    <ItemTemplate>
        <div class="col-sm-3" style="padding:25px">
            
              <div class="shadow rounded" style="padding:10px">
                
                <center>
                 Event- <%#Eval("title")%>
                 <hr />
                    <img src=<%#Eval("eventimage")%> height="100px" />
                </center>
               
                <br />
                <p style="font-size:12px;color:gray">Added Date- <%#Eval("adate")%></p>
                Rate This: <asp:ImageButton style="height:20px; vertical-align:bottom" runat="server" CommandArgument=<%#Eval("eid")%> ImageUrl="~/plus.png" />
              </div>

        </div>
    </ItemTemplate>

</asp:Repeater>

</div>
</div>




</asp:Content>
