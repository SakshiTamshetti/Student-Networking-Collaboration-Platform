<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="afreelanceprojectlist.aspx.cs" Inherits="ourspace.afreelanceprojectlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container shadow" style="margin-top:5%"> 
<asp:GridView runat="server" ID="gvwork" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
        onrowcommand="gvwork_RowCommand">
            
                <AlternatingRowStyle BackColor="White" />
            
            <Columns>
                <asp:BoundField DataField="title" HeaderText="Title" />
                <asp:BoundField DataField="details" HeaderText="Details" />
                <asp:BoundField DataField="adate" HeaderText="Added Date" />
                <asp:BoundField DataField="addedby" HeaderText="Added By" />

                </Columns>
                
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btndel" runat="server" CommandArgument=<%#Eval("wid")%> Text="Delete" class="btn btn-sm btn-danger" CausesValidation="false" />
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
