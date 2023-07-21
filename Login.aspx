<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div class="row">

        <br />
        <div class="col-md-12 col-lg-12 col-xs-12">
            <div class="col-md-6 col-lg-12 col-xs-12">
                <div class="col-md-12 col-lg-12 col-xs-12">
                    <asp:Label ID="Label1" runat="server" Text="Employee Id"></asp:Label>
                    <asp:TextBox ID="txteid" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-12 col-lg-12 col-xs-12">
                    <asp:Label ID="Label2" runat="server" Text="Employee Name"></asp:Label>
                    <asp:TextBox ID="txtename" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-12 col-lg-12 col-xs-12">
                    <asp:Label ID="Label3" runat="server" Text="Employee Date of birth"></asp:Label>
                    <asp:TextBox ID="txtdob" runat="server" format="dd/MM/yyyy" CssClass="form-control" TextMode="Date" AutoPostBack="True"></asp:TextBox>
                </div>
                <div class="col-md-12 col-lg-12 col-xs-12">
                    <asp:Label ID="Label4" runat="server" Text="emplopyee Password"></asp:Label>
                    <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <br />
            </div>
            <div class="col-md-6 col-lg-12 col-xs-12">
            </div>
        </div>
    </div>
    <div class="col-md-12 col-lg-12 col-xs-12">
        <div class="col-md-4 col-lg-12 col-xs-12">
            <br />
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"/>
            <br />

<%--            <input id="Button1" type="button" onclick="myfunction()" value="button" />--%>
            <br />
            <br />
        </div>
    </div>
    <div class="col-md-12 col-lg-12 col-xs-12">
        <asp:GridView ID="grdview" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="795px" AutoGenerateColumns="False"
            EmptyDataText="No record found" caption="EmployeeList" OnRowCommand="grdview_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="EmployeeId">
                    <ItemTemplate>
                        <asp:Label ID="lbleid" runat="server" Text='<%# Eval("Eid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                   <asp:TemplateField HeaderText="Employee Name">
                    <ItemTemplate>
                        <asp:Label ID="lblname" runat="server" Text='<%# Bind("Ename") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Employee date of birth">
                    <ItemTemplate>
                        <asp:Label ID="lbldob" runat="server" Text='<%# Bind("Edob") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Employee password">
                    <ItemTemplate>
                        <asp:Label ID="lblpass" runat="server" Text='<%# Bind("Epassword") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="Employee password">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="view" ImageUrl="~/image/icons8-search-50.png" Width="20px" Height="20px" CommandArgument= '<%# Bind("Eid") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <br />
&nbsp;&nbsp;&nbsp;
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>



<%--    <script>
        $(document).ready(function () {

            $(function myfunction() {
                alert('Hello samar')

            })
        })
    </script>--%>
</asp:Content>
