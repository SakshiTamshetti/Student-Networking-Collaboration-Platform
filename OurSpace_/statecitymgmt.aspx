<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="statecitymgmt.aspx.cs" Inherits="ourspace.statecitymgmt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<div class="container containerdiv">


<div class="shadow" style="padding:25px">
    
        <h4>Add State</h4>
   
    <div style="padding:10px">
    
        <asp:TextBox class="form-control form-control-sm" ID="txtstate" placeholder="Enter State" ValidationGroup="state" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ValidationGroup="state" 
            ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter State Name" 
            ControlToValidate="txtstate" ForeColor="Red"></asp:RequiredFieldValidator>

        <div style="margin-top:10px; text-align:right">

            <asp:Button ID="btnadd" ValidationGroup="state" runat="server" Text="Add" 
                style="background-color:#8F00FF; color:White" onclick="btnadd_Click"/>
            <asp:Button ID="btnclear" CausesValidation="false" ValidationGroup="state" runat="server" Text="Cacnel" style="background-color:#8F00FF; color:White" />

        </div>
    </div>

    <center>
        <asp:GridView runat="server" ID="gvstate" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            onrowcommand="gvstate_RowCommand" 
            >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="statename" HeaderText="State Name" />
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" ID="btndel" CommandArgument=<%#Eval("sid")%> Text="Delete" CausesValidation="false"  class="btn btn-sm btn-outline-danger"/>
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
   





<div class="shadow" style="margin-top:25px; padding:25px">
    
        <h4>Add City</h4>
   
    <div style="padding:10px">
    
        <asp:DropDownList runat="server" ID="drdstate" class="form-select form-select-sm">
        </asp:DropDownList>
        <br/>
        <asp:TextBox class="form-control form-control-sm" ID="txtcity" placeholder="Enter State" ValidationGroup="state" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ValidationGroup="city" 
            ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter City" 
            ControlToValidate="txtcity" ForeColor="Red"></asp:RequiredFieldValidator>

        <div style="margin-top:10px; text-align:right">

            <asp:Button ID="btnaddcity" ValidationGroup="city" runat="server" Text="Add" 
                style="background-color:#8F00FF; color:White" onclick="btnaddcity_Click"/>
            <asp:Button ID="btncitycancel" CausesValidation="false" ValidationGroup="city" runat="server" Text="Cacnel" style="background-color:#8F00FF; color:White" />

        </div>
    </div>

    <center>
        <asp:GridView runat="server" ID="gvcity" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" 
            onrowcommand="gvcity_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="cityname" HeaderText="City Name" />
                <asp:BoundField DataField="statename" HeaderText="State Name" />
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" ID="btndel" CommandArgument=<%#Eval("cid")%> Text="Delete" CausesValidation="false"  class="btn btn-sm btn-outline-danger"/>
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
