<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GamePage.aspx.cs" Inherits="GroupWebProject.GamePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="w3-row-padding">

            <br />
            <br />
        <asp:DataList ID="dlGame" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <h2><%# Eval("GameName") %></h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="imgGamePreview" runat="server" ImageUrl='<%#String.Format("~/Images/Games/{0}", Eval("GameImage")) %>' CssClass="game-page-image" />
                        </td>       
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <br />
    <br />
        <asp:Button ID="btnBack" CssClass="green" runat="server" Visible="false" Text="Back" OnClick="btnBack_Click" />
</asp:Content>
