<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="UsingBootstrapWebApplication.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--User Card-->
        <h2 style="text-align:center">Admin Profile Card</h2>

<div class="card">
  <img src="images/admin.jpg" alt="Sajib" style="width:100%">
  <h1><asp:Label ID="LabelSuccess" runat="server"></asp:Label></h1>
  <p class="title">CEO & Founder, Example</p>
  <p>Sajib's Computer Shop</p>
  <div style="margin: 24px 0;">
    <a href="http://sajibtalukder2k16.blogspot.com/"><i class="fa fa-dribbble"></i></a> 
    <a href="#"><i class="fa fa-twitter"></i></a>  
    <a href="https://www.linkedin.com/in/sajib-talukder-769193147/"><i class="fa fa-linkedin"></i></a>  
    <a href="https://www.facebook.com/sajibtalukder.cse.kuet?ref=bookmarks"><i class="fa fa-facebook"></i></a> 
  </div>
  <p><button>Contact</button></p>
</div>

        <!--User Card-->
</asp:Content>
