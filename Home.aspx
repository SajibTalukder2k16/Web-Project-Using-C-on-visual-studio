<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="UsingBootstrapWebApplication.TemplateWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="images/favicon.png" type="image/gif" sizes="16x16">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Sajib's Computer Shop</title>

    <script
  src="http://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        $(document).ready(function myfunction() {
            $("#btncart").click(function myfunction(){
                window.location.href = "/Cart.aspx";
            });
        });
    </script>
</head>
<body >
    <form id="form1" runat="server">
        <div>
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
                            <li>
                                <button id="btncart" type="button" class="btn btn-primary navbar-btn" >
                                     Cart<span class="badge badge-light" id="pCount" runat="server"></span>
                                </button>
                            </li>
                            <li><a href="SignUp.aspx">Register</a></li>
                            <li><a href="SignIn.aspx">Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!---Carousel--->
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
      <div class="item active">
      <img src="images/apple.gif" alt="...">
      <div class="carousel-caption">
        <h3 style="color:#845027;">Apple MacBook Pro</h3>
        <p style="color:#454c20;">Mid-2010 Core i5 520M 2.4GHz 4GB 320GB 15.4" | B-Grade</p>
          <p><a class="btn btn-lg btn-primary" href="NewProductView.aspx?PID=23" role="button">Full Specifications</a></p>
      </div>
    </div>
      <div class="item">
          <img src="images/desktop_re.jpg" alt="..."/>
      <div class="carousel-caption">
        <h3 style="color:#845027;">CYBERPOWERPC Gamer Xtreme VR</h3>
        <p style="color:#454c20;">Intel Core i5-9400F 2.9GHz,8GB DDR4,AMD Radeon RX 580 4GB</p>
        <p><a class="btn btn-lg btn-primary" href="NewProductView.aspx?PID=26" role="button">Full Specifications</a></p>
      </div>
    </div>
      <div class="item">
      <img src="images/asus_monitor.jpg" alt="...">
      <div class="carousel-caption">
        <h3 style="color:#845027;">ASUS ProArt PA27AC</h3>
        <p style="color:#454c20;">HDR Professional Monitor - 27-inch, WQHD, HDR-10, 100% of sRGB</p>
          <p><a class="btn btn-lg btn-primary" href="NewProductView.aspx?PID=27" role="button">Full Specifications</a></p>
      </div>
    </div>

    ...
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
            <!---Carousel--->
        </div>
        <br />
        <br />

        <!---Carousel--->
        <!---Middle contents-->
        <div class="container center" style="background-color:lightblue;border-radius:15px;border-left-color:green;border-right-color:red;padding:20px;" >
        <div class="row">
            <div class="col-lg-4">
                
                <image class="img-circle" src="images/toshiba_laptop.jpg" alt="laptop" width="160" height="160"></image>
                <h2>Laptops</h2>
                <p>A laptop computer is a small, portable personal computer.has a wide variety of Laptop & Notebook Brands with the latest collection that is available in Bangladesh. Our category of stock includes all the word recognized brands such as HP, Asus, Acer, Lenovo, Dell, Microsoft Surface Pro, Mi & MSI. Among these laptop & Notebooks we have variety in color & shape with a competitive laptop price in BD.</p>
                <p><a class="btn btn-default" href="LaptopView.aspx" role="button">View all Laptops &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                
                <image class="img-circle" src="images/asus_monitor.png" alt="monitor" width="160" height="160"></image>
                <h2>Monitor</h2>
                <p>The monitor is an output display device in desktop PC typically comes with a thin film transistor liquid crystal display (TFT-LCD) but presently its display technology advanced to LED backlighting.Get the latest monitor price in Bangladesh at Sajib's Computer Shop. Buy your desired Asus, Samsung, HP, LG, Acer and Philips from our showroom or website at the best price.</p>
                <p><a class="btn btn-default" href="MonitorView.aspx" role="button">View all Monitor &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                
                <image class="img-circle" src="images/desktop_re.jpg" alt="Desktop" width="160" height="160"></image>
                <h2>Desktop</h2>
                <p>A desktop computer is a personal computer designed for regular use at a single location on or near a desk or table due to its size and power requirements. Buy latest desktop price in Bangladesh at Sajib's Computer Shop. We provide all brand hp desktop, dell desktop, asus, acer, lenovo and all kind of portable gaming pc.</p>
                <p><a class="btn btn-default" href="DesktopView.aspx" role="button">View all Desktop &raquo;</a></p>
            </div>
        </div>
        </div>

        <!---Middle contents-->
        <br />
        <br />
        <hr />
        <hr />
        <br />
        <br />
        <!---Middle contents-->
        <div class="container center" style="background-color:lemonchiffon;border-radius:15px;border-left-color:green;border-right-color:red;padding:20px;" >
        <div class="row">
            <div class="col-lg-4">
                
                <image class="img-circle" src="images/asus_logo.png" alt="laptop" width="160" height="160"></image>
                <h2>Asus</h2>
                <p>ASUS is a Taiwan-based, multinational computer hardware and consumer electronics company that was established in 1989. Dedicated to creating products for today’s and tomorrow’s smart life, ASUS is the world’s No. 1 motherboard and gaming brand as well as a top-three consumer notebook vendor.</p>
                <p><a class="btn btn-default" href="AsusBrand.aspx" role="button">Products of Asus &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                
                <image class="img-circle" src="images/apple_logo.jpg" alt="monitor" width="160" height="160"></image>
                <h2>Apple</h2>
                <p>Apple products have always been designed for the way we work as much as for the way we live. Today they help employees to work more simply and productively, solve problems creatively, and collaborate with a shared purpose. And they’re all designed to work together beautifully. </p>
                <p><a class="btn btn-default" href="AppleBrand.aspx" role="button">Products of Apple &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                
                <image class="img-circle" src="images/hp_logo.jpg" alt="Desktop" width="160" height="160"></image>
                <h2>HP</h2>
                <p>Hewlett Packard company (HP) is an American multinational Information Technology organization that provides hardware and software services to small, medium and large sized businesses across industries. It also has an extensive range of IT products to offer.</p>
                <p><a class="btn btn-default" href="HpBrand.aspx" role="button">Products of HP &raquo;</a></p>
            </div>
        </div>
        </div>

        <!---Middle contents-->
        <!---Footer-->
        <footer>
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
