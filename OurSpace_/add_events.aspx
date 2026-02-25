<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="add_events.aspx.cs" Inherits="ourspace.add_events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container shadow" style="margin-top:5%; padding:25px">
    
    <h3>Add Event</h3>


    <div style="padding:20px">
        <asp:TextBox ID="txttitle" placeholder="Enter Event Title" class="form-control form-control-sm" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Enter Title" ControlToValidate="txttitle" ForeColor="Red"></asp:RequiredFieldValidator>
        
        <asp:FileUpload class="form-control form-control-sm" ID="FileUpload1" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="Select Image File" ControlToValidate="FileUpload1" 
            ForeColor="Red"></asp:RequiredFieldValidator>


        <div style="margin-top:10px; text-align:right">
            <asp:Button ID="btnadd" runat="server" Text="Add" 
                CssClass="btn btn-sm btn-outline-success" onclick="btnadd_Click" />
        </div>
    </div>




    <div style="margin-top:20px">
    <center>
        <asp:GridView style="width:100%" runat="server" ID="gvevent" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            onrowcommand="gvevent_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="title" HeaderText="Event Title" />
                <asp:BoundField DataField="adate" HeaderText="Added Date" />
            </Columns>

            <Columns>
                <asp:TemplateField HeaderText="Event Image">
                    <ItemTemplate>
                        <img src=<%#Eval("eventimage")%> height="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <Columns>
                <asp:TemplateField HeaderText="Delete Event">
                    <ItemTemplate>
                        <asp:Button runat="server" CausesValidation="false" CommandArgument=<%#Eval("eid")%> Text="Delete Event" CssClass="btn btn-sm btn-outline-danger" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>



            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </center>
        
    </div>




</div>

</asp:Content>
