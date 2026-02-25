<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="answers.aspx.cs" Inherits="ourspace.answers" %>
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

                <div class="shadow" style="padding:20px">
                <p>
                    <%#Eval("answer")%>
                </p>
                <p>Answer by: <%#Eval("fullname")%></p>
                <p style="font-size:10px; color:gray">Answered on: <%#Eval("adate")%></p>
                </div>
            </ItemTemplate>
        </asp:Repeater>





        <div style="margin-top:20px">
        <asp:TextBox runat="server" ID="txtanswer" TextMode="MultiLine" MaxLength="500" CssClass="form-control form-control" placeholder="Add Your Answer"></asp:TextBox>
        <br />
        <asp:Button runat="server" ID="Button1" Text="Add Answer" 
                CssClass="btn btn-sm btn-outline-success" onclick="Button1_Click" />
        <asp:Button runat="server" ID="btnback" Text="Back to Questons" 
                CssClass="btn btn-sm btn-outline-warning" onclick="btnback_Click" />
    
        </div>

        </div>
    </asp:Panel>


</asp:Content>
