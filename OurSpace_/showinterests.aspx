<%@ Page Title="" Language="C#" MasterPageFile="~/freelance.Master" AutoEventWireup="true" CodeBehind="showinterests.aspx.cs" Inherits="ourspace.showinterests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container shadow" style="margin-top: 5%; padding: 25px">
        <h3>
           You Shown Interest in..
        </h3>

           <asp:GridView Width="100%" runat="server" id="gvshowninterest" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
            GridLines="None" onrowcommand="gvshowninterest_RowCommand">
               <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="title" HeaderText="Work Title" />
                <asp:BoundField DataField="details" HeaderText="Details" />
                <asp:BoundField DataField="adate" HeaderText="Interest Added Date" />
            </Columns>

            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Delete" CssClass="btn btn-sm btn-danger" CommandArgument=<%#Eval("sid")%> />
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
    
</div>


</asp:Content>
