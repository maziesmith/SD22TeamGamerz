﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="GroupWebProject.Games" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="display: block">
        <div class="jumbotron">

        </div>

        <div class="col-sm-8">
            <table class="game-list">
                <asp:DataList ID="dlGames" RepeatColumns="1" runat="server" DataKeyField="GameID" OnItemCommand="dlGames_ItemCommand" >
                    <ItemTemplate>
                        <tr class="game-item">
                            <td class="game-item-image">
                                <asp:Image ID="imgGame" CssClass="game-image-size" runat="server" ImageUrl='<%#String.Format("~/Images/Games/{0}", Eval("GameImage")) %>' CommandArgument='<%# Eval("GameID") %>' CausesValidation="false"  />
                            </td>
                            <td class="game-item-text">
                                <asp:LinkButton ID="lbGameName" runat="server" CommandArgument='<%# Eval("GameID") %>'><%# Eval("GameName") %></asp:LinkButton>
                                <br />
                                Rating: <%# Eval("GameRating") %>/5
                            </td>
                            <td>
                                <%# Eval("CategoryName") %>
                                <br />
                                <%# Eval("ConsoleName") %>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:DataList>
            </table>
        </div>
    </div>

</asp:Content>
