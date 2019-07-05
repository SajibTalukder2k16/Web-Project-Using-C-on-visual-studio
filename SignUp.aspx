<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="UsingBootstrapWebApplication.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="images/favicon.png" type="image/gif" sizes="16x16">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Sign Up</title>

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
    <style>
span{
    display:none;
}
#side-menu {
    background-color :#191919;
    border-radius:5px;
    margin-left:19px;
    color:white;
    width:20px;
    list-style:none;
}

#side-menu:hover {
    width: 200px !important;	

}
#side-menu:hover span{
    display:inline-block;

}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!---navbar--->
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
                            <li class="active"><a  href="SignUp.aspx">Register</a></li>
                            <li><a  href="SignIn.aspx">Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!---navbar--->
        </div>
        <!---Sign Up--->
        <div class="box"><%--"center-page">--%>
            <%--<label class="col-xs-11">Username</label>
            <div class="col-xs-11">--%>
            <h1>Sign Up</h1>
            <hr/>
                <asp:TextBox ID="UserNameTextBox" class="form-control" placeholder="UserName" runat="server"></asp:TextBox>
            <%--</div>

            <label class="col-xs-11">Full Name</label>
            <div class="col-xs-11">--%>
                <asp:TextBox ID="FullNameTextBox" class="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
            <%--</div>

            <label class="col-xs-11">Email</label>
            <div class="col-xs-11">--%>
                <asp:TextBox ID="EmailTextBox" class="form-control" type="email"  placeholder="Email" runat="server" TextMode="Email"></asp:TextBox>
            <%--</div>

            <label class="col-xs-11">Password</label>
            <div class="col-xs-11">--%>



                <asp:TextBox ID="PasswordTextBox" class="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>






            <%--<asp:Label ID="Label1" runat="server" ForeColor="ForestGreen" Text="Minimum 8 and Maximum 10 characters at least 1 Uppercase Alphabet, 1 Lowercase Alphabet, 1 Number and 1 Special Character"></asp:Label>--%>
            <%-- </div>

            <label class="col-xs-11">Confirm Password</label>
            <div class="col-xs-11">--%>
                <asp:TextBox ID="ConfirmPasswordTextBox" class="form-control" placeholder="Confirm Password" runat="server" TextMode="Password"></asp:TextBox>
            <%--</div>--%>
            <%--<div class="col-xs-11 center space-vert">--%>
            <asp:Button ID="SignUpButton" runat="server" Text="Sign Up" OnClick="SignUpButton_Click" />
                <asp:Label ID="MessageLabel" ForeColor="White"  runat="server" Text="Sajib Talukder"></asp:Label>
            <%--</div>--%>
        </div>
        <!---Sign Up--->
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
