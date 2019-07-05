<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Computer_Shop.aspx.cs" Inherits="UsingBootstrapWebApplication.Computer_Shop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" rel="stylesheet" href="css/computer_shop.css"/>
<link rel="icon" href="favicon.png" type="image/gif" sizes="16x16"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" />
<title>Sajib's computer shop</title>
    <style>
      html {
        background-color: #fffff;
      }
      body {
		  background-image: url("images/background.jpg");
		  background-position:center;
          /*background-repeat: no-repeat;*/
          background-attachment: fixed;
        background-color: #fffff;
        font-family: 'Lato', sans-serif;
      }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" style="text-align:center">
	<h1 style="text-align:center"><i class="fas fa-desktop"></i><i> Sajib's </i>Computer shop <i class="fas fa-laptop"></i></h1>
</div>
<div id="imagelogo">
<img src="computer_shop_logo.jpg" alt="Computer shop logo" style="height: 159px; width: 159px"/>
</div>
<div id="spaceing">
</div>

&nbsp;<div class="card">

  <img src="images/hp_laptop.jpg" alt="asus_monitor" style="width:100%;height:200px;background-color:white;"/>
  <h1>Asus VC279H-W</h1>
  <p class="price">28,000৳</p>
  <p>Asus VC279H-W Eye Care Full HD IPS 27" Monitor </p>
   <%--<asp:Button  ID="AsusMonitorButton" type="submit" runat="server" Text="Full Specifications" OnClick="AsusMonitorButton_Click" />--%>
  <a href="asus_monitor.html"><button id="buttonId">Full Specifications</button></a>
   <%-- <asp:Button ID="Button1" href="Demo.aspx" runat="server" Text="Full Specifications" />--%>
  <p><button>Buy Now</button></p>
</div>


<div class="card">
  <img src="asus_rog.jpg" alt="asus_rog" style="width:100%;height:200px;background-color:white;"/>
    <h1>ROG GL502VS</h1>
  <p class="price">181,500৳</p>
  <p>Asus ROG GL502VS-7700HQ 7th Gen i7 Full HD Gaming Laptop</p>
  <p><button>Full Specifications</button></p>
  <p><button>Buy Now</button></p>
</div>
<div class="card">
  <img src="hp_laptop.png" alt="hp laptop" style="width:100%;height:200px;background-color:white;">
  <h1>HP Pavilion</h1>
  <p class="price">71,200৳</p>
  <p>HP Pavilion 15-cu1006TX Core i7 8th Gen 15.6" Full HD Laptop</p>
  <p><button>Full Specifications</button></p>
  <p><button>Buy Now</button></p>
</div>
<br>
<div class="card">

  <img src="images/hp_laptop.jpg" alt="asus_monitor" style="width:100%;height:200px;background-color:white;"/>
  <h1>Asus VC279H-W</h1>
  <p class="price">28,000৳</p>
  <p>Asus VC279H-W Eye Care Full HD IPS 27" Monitor </p>
   <%--<asp:Button  ID="AsusMonitorButton" type="submit" runat="server" Text="Full Specifications" OnClick="AsusMonitorButton_Click" />--%>
  <a href="asus_monitor.html"><button id="buttonId">Full Specifications</button></a>
  <p><button>Buy Now</button></p>
</div>
<div class="card">
  <img src="asus_rog.jpg" alt="asus_rog" style="width:100%;height:200px;background-color:white;">
  <h1>ROG GL502VS</h1>
  <p class="price">181,500৳</p>
  <p>Asus ROG GL502VS-7700HQ 7th Gen i7 Full HD Gaming Laptop</p>
  <p><button>Full Specifications</button></p>
  <p><button>Buy Now</button></p>
</div>
<div class="card">
  <img src="hp_laptop.png" alt="hp laptop" style="width:100%;height:200px;background-color:white;"/>
  <h1>HP Pavilion</h1>
  <p class="price">71,200৳</p>
  <p>HP Pavilion 15-cu1006TX Core i7 8th Gen 15.6" Full HD Laptop</p>
  <p><button>Full Specifications</button></p>
  <p><button>Buy Now</button></p>
</div>
<br/>
    </form>
</body>
</html>
