<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="GroupWebProject.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>Contact Us</h3>
     <address>
        <br />
         101 Gaming Avenue Winnipeg, Manitoba
       <br />
        <abbr title="Phone">Phone:</abbr>
        204-555-5555
    </address>
<p>Our hours are from: </br>
8:00 a.m. to 8:00 p.m. EST, Monday to Friday.</br>
9:00 a.m. to 5:00 p.m. EST, Saturday.</p>
    <address>
        <strong>GameMaster:</strong>   <a href="mailto:Support@example.com">TeamGamerzGM@example.com</a><br />    
    </address>
</asp:Content>
