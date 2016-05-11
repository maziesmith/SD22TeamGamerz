<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="GroupWebProject.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w3-row-padding">
        <div class="w3-third">
            <asp:Panel ID="Panel1" HorizontalAlign="Center" runat="server">
                <br />
                <br />
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbCategory" Text='<%# Eval("CategoryName") %>' Height="80px" Width="300px" CssClass="CategoriesButton" runat="server"></asp:LinkButton><br />
                    </ItemTemplate>
                </asp:DataList>
            </asp:Panel>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [CategoryName] FROM [tbCategory]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
