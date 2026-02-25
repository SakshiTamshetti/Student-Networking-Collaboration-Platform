<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="uploadresume.aspx.cs" Inherits="ourspace.uploadresume" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container shadow scon containerdiv">

<div style="padding:10px">

    <h2 style="text-align:center">
        Upload Resume
    </h2>
    <br />
    <div class="stextbox">
    <asp:FileUpload runat="server" ID="fileresume"  class="form-control form-control-sm"/>
    <asp:RequiredFieldValidator runat="server" ErrorMessage="Select File" ControlToValidate="fileresume" ForeColor="Red"></asp:RequiredFieldValidator>
    
    <div style="margin-top:10px">
    <asp:Button runat="server" ID="btnupload" Text="Upload" 
            class="btn btn-sm btn-info" onclick="btnupload_Click" />    
    </div>
</div>
</div>

    
    <div style="margin-top:20px">
    <center>
        <asp:GridView ID="gvresumes" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            onrowcommand="gvresumes_RowCommand">
            
            <AlternatingRowStyle BackColor="White" />
            
            <Columns>
                <asp:TemplateField HeaderText="Download">
                    <ItemTemplate>
                        <a href=<%#Eval("resumefile")%>>Download Now</a>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

            <Columns>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:Button ID="btndelete" CommandArgument=<%#Eval("rid")%> Text="Delete" runat="server"  class="btn btn-sm btn-delete" CausesValidation="false" />
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
</div>
</asp:Content>
