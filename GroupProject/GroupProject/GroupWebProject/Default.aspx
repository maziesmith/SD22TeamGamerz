<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GroupWebProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <div class="jumbotron">
        <h1>Mikijiji</h1>
        <p class="lead">Buy and sell games on all platforms!</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="6">
        <ItemTemplate>
            ConsoleImage:
            <asp:ImageButton ID="ConsoleImageLabel" ImageUrl='<%# Eval("ConsoleImage") %>' runat="server" /><br />
            ConsoleName:
            <asp:Label Text='<%# Eval("ConsoleName") %>' runat="server" ID="ConsoleNameLabel" /><br />
            <br />         
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [ConsoleImage], [ConsoleName] FROM [tbConsole]"></asp:SqlDataSource>
</asp:Content>
