<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="GroupWebProject.Account.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Button ID="btnMain" runat="server" Visible="false" OnClick="btnMain_Click" Text="Menu" />
    <br />
    <br />

    <asp:Panel ID="pnlAdmin" Visible="true" runat="server">
        <table>
            <tr>
               <td>
                   <asp:Button ID="btnConsoles" runat="server" OnClick="btnConsoles_Click" Text="Consoles" />
               </td>
                <td>
                    <asp:Button ID="btnGames" runat="server" OnClick="btnGames_Click" Text="Games" />
                </td>
                <td>
                    <asp:Button ID="btnCategories" runat="server" OnClick="btnCategories_Click" Text="Categories" />
                </td>
                <td>
                    <asp:Button ID="btnAccounts" runat="server" OnClick="btnAccounts_Click" Text="Accounts" />
                </td>          
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlConsoles" Visible="false" runat="server">


    </asp:Panel>
    <asp:Panel ID="pnlGames" Visible="false" runat="server">


    </asp:Panel>
    <asp:Panel ID="pnlCategories" Visible="false" runat="server">


    </asp:Panel>
    <asp:Panel ID="pnlAccounts" Visible="false" runat="server">


    </asp:Panel>
</asp:Content>
