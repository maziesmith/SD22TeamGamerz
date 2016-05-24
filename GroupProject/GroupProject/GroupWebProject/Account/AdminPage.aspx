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
        <asp:GridView ID="gvAccount" runat="server" AutoGenerateColumns="False" DataKeyNames="ClientID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField  ShowDeleteButton="True" ShowEditButton="True" ></asp:CommandField>
                <asp:BoundField DataField="ClientID" HeaderText="ClientID" ReadOnly="True"  InsertVisible="False" SortExpression="ClientID"></asp:BoundField>
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
          <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' DeleteCommand="DELETE FROM [tbClient] WHERE [ClientID] = @ClientID" InsertCommand="INSERT INTO [tbClient] ([FirstName], [LastName], [Address], [City], [PhoneNumber], [UserName], [Password], [AccessLevel]) VALUES (@FirstName, @LastName, @Address, @City, @PostalCode, @PhoneNumber, @UserName, @Password, @Email, @AccessLevel)" SelectCommand="SELECT * FROM [tbClient]" UpdateCommand="UPDATE [tbClient] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [PostalCode] = @PostalCode, [PhoneNumber] = @PhoneNumber, [UserName] = @UserName, [Password] = @Password, [Email] = @Email, [AccessLevel] = @AccessLevel WHERE [ClientID] = @ClientID">
            <DeleteParameters>
                <asp:Parameter Name="ClientID" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                <asp:Parameter Name="City" Type="String"></asp:Parameter>
                <asp:Parameter Name="PostalCode" Type="String"></asp:Parameter>
                <asp:Parameter Name="PhoneNumber" Type="String"></asp:Parameter>
                <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="AccessLevel" Type="Boolean"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                <asp:Parameter Name="City" Type="String"></asp:Parameter>
                <asp:Parameter Name="PostalCode" Type="String"></asp:Parameter>
                <asp:Parameter Name="PhoneNumber" Type="String"></asp:Parameter>
                <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                 <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="AccessLevel" Type="Boolean"></asp:Parameter>              
                <asp:Parameter Name="ClientID" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Button ID="btnMain" runat="server" Visible="false" OnClick="btnMain_Click" Text="Menu" />
</asp:Content>
