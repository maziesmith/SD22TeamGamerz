<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="GroupWebProject.Games" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="jumbotron">

        </div>
        <div class="col-sm-4">
            <h3>a</h3>
        </div>
        <div class="col-sm-8">
                <asp:DataList ID="dlGames" RepeatColumns="3" runat="server">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Image ID="imgGame" runat="server" ImageUrl='<%# Eval("GameImage", "~/Images/Action/{0}"); %>' /> <%# //FIX THIS SHIT %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%# Eval("GameName") %>
                                </td>
                                <td>
                                    <%# Eval("GameRating") %>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
        </div>
    </div>
</asp:Content>
