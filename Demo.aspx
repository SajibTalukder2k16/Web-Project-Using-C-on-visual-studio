<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="UsingBootstrapWebApplication.Demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" rel="stylesheet" href="css/computer_shop.css"/>
<title>Asus Monitor</title>
<style>
table {
  border-collapse: collapse;
  width: 50%;
  margin: 0px auto;
  
}
body {
		  background-image: url("images/background.jpg");
		  background-position:center;
          /*background-repeat: no-repeat;*/
          background-attachment: fixed;
        background-color: #fffff;
        font-family: 'Lato', sans-serif;
      }

th, td {
  text-align: center;
  padding: 8px;
}
th {
  background-color: #4CAF50;
  color: white;
}

tr:nth-child(even) {background-color: #f2f2f2;}
tr:nth-child(odd) {background-color: grey;}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" style="text-align:center">
	<p><h1 style="text-align:center"><i>Sajib's </i>Computer shop</h1></p>
</div>
<div id="imagelogo">
<img src="computer_shop_logo.jpg" height="200px" width="200px" alt="Computer shop logo">
</div>
<div id="spaceing">
</div>
<img src="images/asus_monitor.jpg" alt="asus_monitor" class="center" style="width:400px;height:400px;">
<div>
<table style="float:center">
  <tr>
  <th>About</th>
  <th>Description</th>
  </tr>
  <tr>
  <td>Screen Size</td>
  <td>Wide Screen 27.0"(68.6cm) 16:9</td>
  </tr>
  <tr>
  <td>Display Type</td>
  <td>AH-IPS</td>
  </tr>
  <tr>
  <td>Resolution</td>
  <td>1920x1080</td>
  </tr>
  <tr>
  <td>Brightness</td>
  <td>250 cd/㎡</td>
  </tr>
</table>
</div>
    </form>
</body>
</html>
