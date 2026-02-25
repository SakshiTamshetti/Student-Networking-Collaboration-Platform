<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_add_project.aspx.cs" Inherits="ourspace.student_add_project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="shadow container-lg containerdiv scon ">
    

    <h2 style="text-align:center"> Project Request</h2><br>
    <div style="margin-left:17%; margin-right:17%">
    <asp:TextBox runat="server" ID="txttitle" placeholder="Enter Project Title" CssClass="form-control form-control-sm">
    </asp:TextBox>
    <br/>
    <asp:TextBox runat="server" ID="details" TextMode="MultiLine" placeholder="Enter Project Details" CssClass="form-control form-control-sm">
    </asp:TextBox>
    <br/>
    
    <div style="text-align:right; margin-top:10px">
        <asp:Button runat="server" ID="btnadd" Text="Add" 
            class="btn btn-info btn-sm" onclick="btnadd_Click" Width="55px" />
    </div>
    </div>


    <center>
    <br />
        <asp:GridView runat="server" ID="gvproject" AutoGenerateColumns="False" 
            CellPadding="3" onrowcommand="gvproject_RowCommand" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CssClass="s-gridview">
            <Columns>
                <asp:BoundField DataField="title" HeaderText="Project Title" />
                <asp:BoundField DataField="details" HeaderText="Details" />
                <asp:BoundField DataField="dtime" HeaderText="Added Date Time" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="Button1" CommandArgument=<%#Eval("pid")%> runat="server" 
                            CausesValidation="false" Text="Delete" class="s-delete-btn btn btn-sm btn-danger" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle CssClass="s-blue-footer" Font-Bold="True" ForeColor="#000066" />
            <HeaderStyle CssClass="s-blue-header" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle CssClass="s-blue-row" ForeColor="#000066" />
            <SelectedRowStyle CssClass="s-blue-selected-row" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    
    </center>

</div>

</asp:Content>
