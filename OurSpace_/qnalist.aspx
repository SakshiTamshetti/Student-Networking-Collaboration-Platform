<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="qnalist.aspx.cs" Inherits="ourspace.qnalist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<div class="container">
        <center>
        <asp:GridView ID="gvownqna" AutoGenerateColumns="False" runat="server" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
                onrowcommand="gvownqna_RowCommand">
        
            <AlternatingRowStyle BackColor="White" />
        
            <Columns>
                <asp:BoundField DataField="question" HeaderText="Question" />
                <asp:BoundField DataField="adate" HeaderText="Added Date" />

            </Columns>
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button Text="Delete" runat="server" CommandArgument=<%#Eval("qid")%> ID="btndel" class="btn btn-sm btn-danger" CausesValidation="false" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />

        </asp:GridView>
    </center>
    </div>


</asp:Content>
