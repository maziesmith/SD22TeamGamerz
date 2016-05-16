<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GamePage.aspx.cs" Inherits="GroupWebProject.GamePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Image ID="imgGamePreview" runat="server" ImageUrl='<%#String.Format("~/Images/Games/{0}", Eval("GameImage")) %>' />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
