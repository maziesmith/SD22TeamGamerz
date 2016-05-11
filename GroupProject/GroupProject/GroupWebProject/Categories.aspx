<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="GroupWebProject.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w3-row-padding">
        <div class="w3-third">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3">
        <ItemTemplate>
            <asp:LinkButton ID="lbCategory" Text='<%# Eval("CategoryName") %>' CssClass="CategoriesButton" runat="server"></asp:LinkButton><br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [CategoryName] FROM [tbCategory]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
