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
        <asp:GridView ID="gvConsoles" runat="server" AutoGenerateColumns="false" DataKeyNames="ConsoleID" DataSourceID="SqlDataSource4" AllowPaging="true" AllowSorting="true">
            <Columns>
                <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" />
                <asp:BoundField DataField="ConsoleID" HeaderText="ConsoleID" ReadOnly="true" InsertVisible="false" SortExpression="ConsoleID" />
                <asp:BoundField DataField="ConsoleName" HeaderText="ConsoleName" SortExpression="ConsoleName" />
                <asp:BoundField DataField="ConsoleImage" HeaderText="ConsoleImage" SortExpression="ConsoleImage" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' DeleteCommand="DELETE FROM [tbConsole] WHERE [ConsoleID] = @ConsoleID" InsertCommand="INSERT INTO [tbConsole] ([ConsoleName], [ConsoleImage]) VALUES (@ConsoleName, @ConsoleImage)" SelectCommand="SELECT * FROM [tbConsole]" UpdateCommand="UPDATE [tbConsole] SET [ConsoleName] = @ConsoleName, [ConsoleImage] = @ConsoleImage WHERE [ConsoleID] = @ConsoleID">
            <DeleteParameters>
                <asp:Parameter Name="ConsoleID" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ConsoleName" Type="String"></asp:Parameter>
                <asp:Parameter Name="ConsoleImage" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ConsoleName" Type="String"></asp:Parameter>
                <asp:Parameter Name="ConsoleImage" Type="String" />
                <asp:Parameter Name="ConsoleID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="pnlGames" Visible="false" runat="server">
        <asp:GridView ID="gvGames" runat="server" AutoGenerateColumns="false" DataKeyNames="GameID" DataSourceID="SqlDataSource2" AllowPaging="true" AllowSorting="true">
            <Columns>
                <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" />
                <asp:BoundField DataField="GameID" HeaderText="ClientID" ReadOnly="true" InsertVisible="false" SortExpression="GameID" />
                <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
                <asp:BoundField DataField="GameImage" HeaderText="GameImage" SortExpression="GameImage" />
                <asp:BoundField DataField="GameRating" HeaderText="GameRating" SortExpression="GameRating" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                <asp:BoundField DataField="ConsoleID" HeaderText="ConsoleID" SortExpression="ConsoleID" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' DeleteCommand="DELETE FROM [tbGames] WHERE [GameID] = @GameID" InsertCommand="INSERT INTO [tbGames] ([GameName], [GameImage], [GameRating], [CategoryID], [ConsoleID]) VALUES (@GameName, @GameImage, @GameRating, @CategoryID, @ConsoleID)" SelectCommand="SELECT * FROM [tbGames]" UpdateCommand="UPDATE [tbGames] SET [GameName] = @GameName, [GameImage] = @GameImage, [GameRating] = @GameRating, [CategoryID] = @CategoryID, [ConsoleID] = @ConsoleID WHERE [GameID] = @GameID">
            <DeleteParameters>
                <asp:Parameter Name="ClientID" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="GameName" Type="String"></asp:Parameter>
                <asp:Parameter Name="GameImage" Type="String"></asp:Parameter>
                <asp:Parameter Name="GameRating" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="ConsoleID" Type="Int32"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="GameName" Type="String"></asp:Parameter>
                <asp:Parameter Name="GameImage" Type="String"></asp:Parameter>
                <asp:Parameter Name="GameRating" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="ConsoleID" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="GameID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="pnlCategories" Visible="false" runat="server">
        <asp:GridView ID="gvCategories" runat="server" AutoGenerateColumns="false" DataKeyNames="CategoryID" DataSourceID="SqlDataSource3" AllowPaging="true" AllowSorting="true">
            <Columns>
                <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" ReadOnly="true" InsertVisible="false" SortExpression="CategoryID" />
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' DeleteCommand="DELETE FROM [tbCategory] WHERE [CategoryID] = @CategoryID" InsertCommand="INSERT INTO [tbCategory] ([CategoryName]) VALUES (@CategoryName)" SelectCommand="SELECT * FROM [tbCategory]" UpdateCommand="UPDATE [tbCategory] SET [CategoryName] = @CategoryName WHERE [CategoryID] = @CategoryID">
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String"></asp:Parameter>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
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
