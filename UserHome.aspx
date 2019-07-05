<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="UsingBootstrapWebApplication.UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  background-color:white;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: darkgoldenrod;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}
body  {
  background-image: url("images/back.jpg");
  background-size:cover;
  background-attachment: fixed;
}
</style>
    <link rel="icon" href="images/favicon.png" type="image/gif" sizes="16x16">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Sajib's Computer Shop</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <!--navbar-->
    <div class="navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Home.aspx"><span><img alt="Logo" src="images/favicon.png" height="30" /></span>  Sajib's Computer Shop</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="home.aspx">Home</a></li>
                            <li><a href="AboutUs.aspx">About</a></li>
                            <li><a href="Contact.aspx">Contact</a></li>
                            <li><a href="AllProducts.aspx">All Products</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                               <ul class="dropdown-menu">
                                    <li><a href="AllProducts.aspx">All Products</a></li>
                                    <li class="dropdown-header">Laptop and Desktop items</li>
                                    <li><a href="LaptopView.aspx">Laptop</a></li>
                                    <li><a href="DesktopView.aspx">Desktop</a></li>
                                    <li><a href="MonitorView.aspx">Monitor</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li class="dropdown-header">Brands</li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="AsusBrand.aspx">Asus</a></li>
                                    <li><a href="AppleBrand.aspx">Apple</a></li>
                                    <li><a href="HpBrand.aspx">HP</a></li>
                                </ul>
                            </li>
                            <asp:Button ID="LoginButton" runat="server" Class="btn btn-default navbar-btn" Text="Sign In" OnClick="LoginButton_Click"/>
                            <asp:Button ID="LogOutButton" runat="server" Class="btn btn-default navbar-btn" Text="Logout" OnClick="LogOutButton_Click" />
                            
                        </ul>
                    </div>
                </div>
            </div>
        <!--navbar-->
        </div>
        <!--User Card-->
        <h2 style="text-align:center">User Profile Card</h2>

<div class="card">
  <img src="images/MyImage.jpg" alt="John" style="width:100%">
  <h1><asp:Label ID="LabelSuccess" runat="server"></asp:Label></h1>
  <p class="title">CEO & Founder, Example</p>
  <p>Sajib's Computer Shop</p>
  <div style="margin: 24px 0;">
    <a href="#"><i class="fa fa-dribbble"></i></a> 
    <a href="#"><i class="fa fa-twitter"></i></a>  
    <a href="#"><i class="fa fa-linkedin"></i></a>  
    <a href="#"><i class="fa fa-facebook"></i></a> 
  </div>
  <p><button>Contact</button></p>
</div>

        <!--User Card-->

<!---Footer-->
        <footer class="footer-pos">
            <div class="container center">
                <p class="pull-right"><a href="#">Back to top &uarr;</a></p>
                <p>&copy;2019 All Rights Reserved by Sajib Talukder &middot;<a href="Home.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot;<a href="#">Products</a>&middot; </p>
            </div>
        </footer>
   <!---Footer-->
    
    </form>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html> 

