<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_view_projects.aspx.cs" Inherits="ourspace.student_view_projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container shadow scon" style="margin-top:5%; padding:25px">

<center>
    <asp:GridView runat="server" ID="gvstudentproject" AutoGenerateColumns="False" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
        CellPadding="4" CellSpacing="2" ForeColor="Black" 
        onrowcommand="gvstudentproject_RowCommand">
        
            <Columns>
                <asp:BoundField DataField="ptitle" HeaderText="Project Title" />
                <asp:BoundField DataField="pdetails" HeaderText="Project Details" />
                <asp:BoundField DataField="udate" HeaderText="Upload Date Time" />
            </Columns>

            <Columns>
                <asp:TemplateField HeaderText="Download">
                    <ItemTemplate>
                       <a href=<%#Eval("pfile")%>>Download</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            
            <Columns>
            <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton CommandArgument=<%#Eval("pid")%> runat="server" Text="Delete" CausesValidation="false" class="btn btn-sm btn-danger"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />

    </asp:GridView>
</center>
    
</div>

</asp:Content>
