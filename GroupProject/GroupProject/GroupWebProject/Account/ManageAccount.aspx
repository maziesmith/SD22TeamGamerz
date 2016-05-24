<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageAccount.aspx.cs" Inherits="GroupWebProject.Account.ManageAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">

    </div>
    <div>
        <table>
            <tr>
                <td>
                    <asp:LinkButton ID="lbEditAccount" runat="server" OnClick="lbEditAccount_Click" >Edit Account</asp:LinkButton>

                </td>
            </tr>
        </table>
    </div>
    <div visible="false" ID="divEditUser" runat="server">
        <asp:Label ID="lblClientID" runat="server" Text="" />
        <table>
            <tr>
                <td>
                    Username
                </td>
                <td>
                    <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    First Name
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Last Name
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Email
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    City
                </td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Address
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Postal Code
                </td>
                <td>
                    <asp:TextBox ID="txtPostalCode" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Phone Number
                </td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
