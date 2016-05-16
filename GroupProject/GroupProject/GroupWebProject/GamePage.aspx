<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GamePage.aspx.cs" Inherits="GroupWebProject.GamePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:DataList ID="dlGame" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Image ID="imgGamePreview" runat="server" ImageUrl='<%#String.Format("~/Images/Games/{0}", Eval("GameImage")) %>' />
                        </td>
                        <td>
                            <h2><%# Eval("GameName") %></h2>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        
    </div>
</asp:Content>
