<%@ Page Title="" Language="C#" MasterPageFile="~/freelance.Master" AutoEventWireup="true"
    CodeBehind="view_work.aspx.cs" Inherits="ourspace.view_work" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow" style="margin-top: 5%; padding: 25px">
        <h3>
            Freelance Work
        </h3>
        <div class="row">
            <asp:Repeater runat="server" ID="repfreelance" 
                onitemcommand="repfreelance_ItemCommand">
            
                <ItemTemplate>
                <div class="col-sm-3" style="padding:20px">
                
                    <div class="shadow rounded zoom" style="padding:20px">
                        <p style="font-size:18px;text-align:center">
                            <%#Eval("title")%>
                        </p>
                        <hr/>
                        <p>details-: <%#Eval("details")%> </p>

                        <p style="text-align:right;font-size:12px">-<%#Eval("fullname")%></p>

                        <p style="font-size:10px;color:gray">Date: <%#Eval("adate")%> </p>
                        <asp:Button runat="server" Text="Show Interest" CommandArgument=<%#Eval("wid")%> CssClass="btn btn-sm btn-outline-danger" />
                    </div>
                    
                </div>
                </ItemTemplate>
            
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
