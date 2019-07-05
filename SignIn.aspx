<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="UsingBootstrapWebApplication.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="images/favicon.png" type="image/gif" sizes="16x16">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Sajib's Computer Shop</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <link href="css/LoginCss.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
         <!---navbar--->
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
                            <li ><a href="home.aspx">Home</a></li>
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
                            <li ><a  href="SignUp.aspx">Register</a></li>
                            <li class="active"><a  href="SignIn.aspx">Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
           
        </div>
         <!---navbar--->
    <!---Sign In--->
    <%--<div class="container">--%>
        <div class="box">
            <h1>Login</h1>
            <hr />
                  <asp:TextBox ID="UsernameTextBox" type="text" placeholder="Username or Email" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server"  ErrorMessage="The Username field is required!" ControlToValidate="UsernameTextBox"></asp:RequiredFieldValidator>

                  <asp:TextBox ID="PasswordTextBox"  placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" CssClass="text-danger" runat="server"  ErrorMessage="The Password field is required!" ControlToValidate="PasswordTextBox"></asp:RequiredFieldValidator>

            <br />
                  <asp:CheckBox ID="CookieCheckBox" type="checkbox" runat="server" />
                  <asp:Label ID="Label3" runat="server"  ForeColor="White"  Text="Remember me"></asp:Label>
              <%--</div>
          </div>--%>
          <%-- <div class="form-group">
              <div class="col-md-2"></div>
                <div class="col-md-6">--%>
                    <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="btn btn-default" OnClick="LoginButton_Click1" /> 
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/SignUp.aspx">Register Now</asp:LinkButton>
                
             <%-- </div>
          </div>--%>
            <%--<div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">--%>
                    <asp:Label ID="LabelError" runat="server"  ></asp:Label>
                <%--</div>
            </div>--%>

        </div>
   <%-- </div>--%>

    <!---Sign In--->
        <!---Footer-->
        <footer class="footer-pos">
            <div class="container center">
                <p class="pull-right"><a href="#">Back to top &uarr;</a></p>
                <p><font color="white">&copy;2019 All Rights Reserved by Sajib Talukder &middot;</font><a href="Home.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot;<a href="#">Products</a>&middot; </p>
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
