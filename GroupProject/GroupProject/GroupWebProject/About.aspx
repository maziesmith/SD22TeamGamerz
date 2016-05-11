<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="GroupWebProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
      <div id="about">
        <asp:Image ID="aboutus" ImageUrl="/Images/aboutus.jpg"  runat="server" Height="500px" Width="800px" />
    </div>
  <div class="jumbotron">
    <p></p> 
  </div>
  <div class="row">
    <div class="col-sm-4">
      <h3>Our Products</h3>
      <p>teamGamerz is a leading provider of services tailored to the needs of Consoles game who want to maximize their gaming experience. Whether you are looking for game items
          ,Action,Arcade,Adventure etc. Nearly all games can be found here. 
      </p>
        <p>&nbsp;</p>
      <p>teamGamerz strives to offer the fastest and most reliable service on the web for all your gaming needs. Feel free to contact us 24 hours a day, Our Customer service reps are standing by, waiting to help enhance your gaming experience. </p>
    </div>
  
  </div>

  
</body>
</html>
</asp:Content>
