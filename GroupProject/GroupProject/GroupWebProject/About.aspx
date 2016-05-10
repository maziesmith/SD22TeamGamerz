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

<div class="container">
  <div class="jumbotron">
    <h1>ABOUT US</h1>
    <p></p> 
  </div>
  <div class="row">
    <div class="col-sm-4">
      <h3>Column 1</h3>
      <p>paragraph</p>
      <p>paragraph</p>
    </div>
    <div class="col-sm-4">
      <h3>Column 2</h3>
      <p>paragraph</p>
      <p>paragraph</p>
    </div>
    <div class="col-sm-4">
      <h3>Column 3</h3>        
      <p>paragraph</p>
      <p>paragraph</p>
    </div>
  </div>
</div>

</body>
</html>
</asp:Content>
