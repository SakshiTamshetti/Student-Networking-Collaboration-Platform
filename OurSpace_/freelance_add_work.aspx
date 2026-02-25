<%@ Page Title="" Language="C#" MasterPageFile="~/freelance.Master" AutoEventWireup="true" CodeBehind="freelance_add_work.aspx.cs" Inherits="ourspace.freelance_add_work" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container shadow fid" style="height:auto; width:600px; margin-top:5%; padding-top:5px; ">
     <br>
    <center><h4>Add Work</h4></center>

    <br>
    <div>
        <asp:TextBox ID="txttitle" MaxLength="200" class="form-control form-control-sm" placeholder="Enter Work Title" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Enter Work Title" ControlToValidate="txttitle" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtdetails" runat="server" MaxLength="500" class="form-control form-control-sm" placeholder="Enter Work Details like Language,Database etc"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="Enter Work Details" ControlToValidate="txtdetails" 
            ForeColor="Red"></asp:RequiredFieldValidator>

        <div style="margin-top:10px;text-align:right">
            <asp:Button ID="btnadd" runat="server" Text="Add"  
                class="btn btn-sm btn-outline-success" onclick="btnadd_Click"/>
            <asp:Button ID="btncancel" class="btn btn-sm btn-outline-danger" CausesValidation="false" runat="server" Text="Cancel" />
        </div>
    </div>


    <div style="margin-top:20px">
        <center>
            <asp:GridView runat="server" ID="gvwork" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                onrowcommand="gvwork_RowCommand">
            
                <AlternatingRowStyle BackColor="White" />
            
            <Columns>
                <asp:BoundField DataField="title" HeaderText="Title" />
                <asp:BoundField DataField="details" HeaderText="Details" />
                <asp:BoundField DataField="adate" HeaderText="Added Date" />

            </Columns>
                
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" CommandArgument=<%#Eval("wid")%> Text="Delete" class="btn btn-sm btn-danger" CausesValidation="false" />
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
