<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="qna.aspx.cs" Inherits="ourspace.qna" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container" style="margin-top:5%; padding:25px">
    

    <asp:Repeater runat="server" ID="repqna">
        <ItemTemplate>
            <div class="shadow rounded" style="padding:25px">
                
              <p style="color:Gray; font-size:12px">  Added on: <%#Eval("adate")%><br/></p>
                <%#Eval("question")%>
                <br/>
                <div style="text-align:right; margin-right:20px">
                        <p>-Added by: <%#Eval("fullname")%></p>
                </div>

            </div>
        </ItemTemplate>
    </asp:Repeater>

</div>



</asp:Content>
