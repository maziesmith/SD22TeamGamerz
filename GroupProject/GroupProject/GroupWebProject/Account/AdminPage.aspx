<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="GroupWebProject.Account.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <br />
    <br />
    <div class="adminbutton" >
    <asp:Panel ID="pnlAdmin" Visible="true" runat="server">
        <table>
            <tr>
               <td>
                   <asp:Button ID="btnConsoles" href="#" class="button green"  runat="server" OnClick="btnConsoles_Click" Text="Consoles" />
               </td>
                <td>
                    <asp:Button ID="btnGames" href="#" class="button green" runat="server" OnClick="btnGames_Click" Text="Games" />
                </td>
                <td>
                    <asp:Button ID="btnCategories" href="#" class="button green" runat="server" OnClick="btnCategories_Click" Text="Categories" />
                </td>
                <td>
                    <asp:Button ID="btnAccounts" href="#" class="button green" runat="server" OnClick="btnAccounts_Click" Text="Accounts" />
                </td>          
            </tr>
        </table>
    </asp:Panel>
        </div>
    <asp:Panel ID="pnlConsoles" Visible="false" runat="server">


    </asp:Panel>
    <asp:Panel ID="pnlGames" Visible="false" runat="server">


    </asp:Panel>
    <asp:Panel ID="pnlCategories" Visible="false" runat="server">


    </asp:Panel>
    <asp:Panel ID="pnlAccounts" Visible="false" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ClientID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                <asp:BoundField DataField="ClientID" HeaderText="ClientID" ReadOnly="True" InsertVisible="False" SortExpression="ClientID"></asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode"></asp:BoundField>
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber"></asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"></asp:BoundField>
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                <asp:CheckBoxField DataField="AccessLevel" HeaderText="AccessLevel" SortExpression="AccessLevel"></asp:CheckBoxField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT * FROM [tbClient]"></asp:SqlDataSource>
    </asp:Panel>
    <asp:Button ID="btnMain" runat="server" Visible="true" OnClick="btnMain_Click" Text="Menu" />
</asp:Content>
