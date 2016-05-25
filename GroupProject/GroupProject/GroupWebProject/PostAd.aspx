<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostAd.aspx.cs" Inherits="GroupWebProject.PostAd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">

    </div>
    <div>
        <table>
            <tr>
                <td>
                    Game Name
                </td>
                <td>
                    <asp:TextBox ID="txtGameName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Console
                </td>
                <td>
                    <asp:DropDownList ID="ddlConsole" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Category
                </td>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Rating
                </td>
                <td>
                    <asp:DropDownList ID="ddlRating" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:FileUpload ID="fuGameImage" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnList" runat="server" Text="List It" OnClick="btnList_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
