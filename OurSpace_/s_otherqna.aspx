<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true"
    CodeBehind="s_otherqna.aspx.cs" Inherits="ourspace.s_otherqna" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <center>
        <h2 style="text-align: center">
            Questions</h2>
    </center>
    <br />


    <asp:Panel runat="server" ID="panelquestion">
    <div class="row">

        <asp:Repeater runat="server" ID="repoqna" onitemcommand="repoqna_ItemCommand">
            <ItemTemplate>
                <div class="col-sm-3" style="padding:20px">
                    
                    <div class="shadow rounded bg-light" style="padding:20px">
                        <p style="text-align:center"><%#Eval("question")%> </p>
                        <hr />
                        <p style="font-size:12px; color:gray">Added Date: <%#Eval("adate")%></p>
                        
                        <b>Student Name:</b> 
                        <p><%#Eval("fullname")%></p>
                        <asp:Button runat="server" Text="Add Answer" class="btn btn-sm btn-outline-primary" CommandArgument=<%#Eval("qid")%> />
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
    </asp:Panel>
    

    



</asp:Content>
