<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_add_articles.aspx.cs" Inherits="ourspace.student_add_articles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="shadow container scon containerdiv">
 <h2 style="text-align:center"> Upload Article</h2>
 <br />
 <div style="margin-left:17%; margin-right:17%">
<asp:TextBox runat="server" ID="details" TextMode="MultiLine" 
        placeholder="Create Article..." CssClass="form-control form-control-lg" 
        Height="200px"></asp:TextBox>

    <asp:RequiredFieldValidator ID="rfvarticle" runat="server" 
        ErrorMessage="Add Article..." ControlToValidate="details" ForeColor="#FF3300"></asp:RequiredFieldValidator>
          
        <div style="text-align:right; margin-top:10px">
            <br />
        <asp:Button runat="server" ID="btnupload" Text="Upload" 
            class="btn btn-info btn-sm" onclick="btnupload_Click"  />
            <asp:Button runat="server" ID="btncancel" Text="Cancel" 
            class="btn btn-danger btn-sm"  />
</div>
    </div>

    <div style="margin-top:20px">
        <center>
        <h2>You Added Articles</h2>
            <asp:GridView ID="gvarticle" AutoGenerateColumns="False" runat="server" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                onrowcommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="article" HeaderText="Article" />
                    <asp:BoundField DataField="adate" HeaderText="Added Date" />

                </Columns>

                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btndel" CommandArgument=<%#Eval("aid")%> runat="server" Text="Delete" class="btn btn-sm btn-danger" CausesValidation="false" /> 
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <AlternatingRowStyle BackColor="White" />
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
