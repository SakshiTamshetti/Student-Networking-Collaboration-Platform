<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="view_project_requests.aspx.cs" Inherits="ourspace.view_project_requests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container  scon" style="margin-top:5%; padding:25px; ">

<div style="text-align:center;" >

<asp:Button class="btn btn-warning" ID="btnaddprojreq" runat="server" 
        Text="Add Project Request" onclick="btnaddprojreq_Click1" />

    <asp:Button class="btn btn-warning" ID="btnproject" runat="server" Text="Requested Projects" 
        onclick="btnproject_Click" />
    <asp:Button class="btn btn-warning" ID="btninterest" runat="server" Text="Show Interest" 
        onclick="btninterest_Click" />
    
     

    <br />
    <br />
    
     

</div>


<asp:Panel runat="server" ID="panelproject">

<div class="row ">
<asp:Repeater runat="server" ID="repprojects" 
        onitemcommand="repprojects_ItemCommand">

<ItemTemplate>

    <div class="col-sm-4 " style="padding:10px">
    <div class="shadow scon " style="padding:10px; background-color:White">
        <p class="s-carttitle"><%#Eval("fullname")%>  - <%#Eval("email")%>(<%#Eval("phone")%>)  </p>
        <p><b><%#Eval("title")%> </b></p>
        <hr />
        <p><%#Eval("details")%> </p>
        <hr />
        <p ><%#Eval("dtime")%> </p>
        <asp:Button runat="server" ID="btnaccept" Text="Interested" class="btn btn-sm btn-warning" CausesValidation="false" CommandArgument=<%#Eval("pid")%> />
    </div>
    </div>

</ItemTemplate>

</asp:Repeater>
</div>
    
    </asp:Panel>


<asp:Panel runat="server" ID="panelinterest" Visible="false">



    <div style="margin-top:50px">

        <h3>You have Shown Interest in Following Projects</h3>
        <center>
            <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" 
                CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="title" HeaderText="Title" />
                <asp:BoundField DataField="details" HeaderText="Details" />
                <asp:BoundField DataField="idate" HeaderText="Interest Date" />
            </Columns>
            
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button CommandArgument=<%#Eval("rid")%> ID="btn" runat="server" Text="Delete" />
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
    </asp:Panel>


</div>


</asp:Content>
