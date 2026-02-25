<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="all_answers.aspx.cs" Inherits="ourspace.all_answers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Panel runat="server" ID="panelanswer">
        
        <div class="container shadow" style="background-color:White; padding:25px">

        <h3>Question</h3>
        <asp:Label style="font-size:20px" runat="server" ID="lblque">
        </asp:Label>
        <br/><br/>

        
        <asp:Repeater runat="server" ID="repanswers">
        
            <HeaderTemplate>
               <h4>Answers..</h4> 
            </HeaderTemplate>
            <ItemTemplate>

                <div class="shadow" style="padding:20px; margin-bottom:15px">
                <p>
                    <img src="arr.png" height="25px" />
                    <%#Eval("answer")%>
                </p>
                <p> Answer by: <%#Eval("fullname")%></p>
                <p style="font-size:10px; color:gray">Answered on: <%#Eval("adate")%></p>
                </div>
            </ItemTemplate>
        </asp:Repeater>



        <br/><br/>

        <asp:Button runat="server" Text="Back to Questions" 
                CssClass="btn btn-sm btn-outline-primary" onclick="Unnamed1_Click" />

       

        </div>
    </asp:Panel>



</asp:Content>
