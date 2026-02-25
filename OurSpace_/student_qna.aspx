<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_qna.aspx.cs" Inherits="ourspace.student_qna" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<div class="container shadow scon" style="margin-top:5%; padding:25px">
    <div style="margin-left:17%; margin-right:17%">
    <asp:TextBox ID="txtquestion" TextMode="MultiLine" MaxLength="200" placeholder="Enter your Question" class="form-control form-control-sm" runat="server"></asp:TextBox>
    <div style="margin-top:10px;text-align:right">
        <asp:Button ID="btnadd" class="btn btn-sm btn-info" runat="server" 
            Text="Add" onclick="btnadd_Click" />
    </div>
    </div>
    <div>
        <center>
         <h2 style="text-align:center">My Questions</h2>
 <br />
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


</div>

</asp:Content>
