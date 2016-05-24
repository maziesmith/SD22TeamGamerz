<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ads.aspx.cs" Inherits="GroupWebProject.Ads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="AdsID">
        <Columns>
            <asp:BoundField DataField="AdsID" HeaderText="AdsID" ReadOnly="True" InsertVisible="False" SortExpression="AdsID"></asp:BoundField>
            <asp:BoundField DataField="AdsTitle" HeaderText="AdsTitle" SortExpression="AdsTitle"></asp:BoundField>
            <asp:BoundField DataField="AdsDesc" HeaderText="AdsDesc" SortExpression="AdsDesc"></asp:BoundField>
            <asp:BoundField DataField="GameID" HeaderText="GameID" SortExpression="GameID"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT * FROM [tbAds]"></asp:SqlDataSource>

    
    <br />
    <br />
    <asp:Panel ID="pnlInsertAdd" runat="server">
        Title: <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox> <br />
        Description: <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox> <br />
        Game Name: <asp:DropDownList ID="ddlGames" runat="server" DataSourceID="SqlDataSource3" DataTextField="GameName" DataValueField="GameID"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [GameName], [GameID] FROM [tbGames]"></asp:SqlDataSource>
    </asp:Panel>

    <asp:Button ID="btnAdd" runat="server" Text="Add Advertisement" OnClick="btnAdd_Click" />
</asp:Content>
