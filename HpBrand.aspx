<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="HpBrand.aspx.cs" Inherits="UsingBootstrapWebApplication.HpBrand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row" style="padding-top: 50px">
        <asp:Repeater ID="rptrProducts" runat="server">
            <HeaderTemplate>
                <div class="w3-container">
            </HeaderTemplate>
            <ItemTemplate>
               <%--<div class="col-sm-3 col-md-3">--%>
                <div class="w3-card" style="width:50% ; margin-left:25%; text-align :center;  background-color:slategrey; border: 2px solid blue; border-radius: 10px;border-bottom-right-radius: 30%;">
                    <a style="text-decoration:none;" href="NewProductView.aspx?PID=<%#Eval("ProductId") %>">
                    <%--<div class="thumbnail">--%>
                        <img class="w3-hover-grayscale" src="Images/ProductImages/<%#Eval("ProductId") %>/<%#Eval("ImageName") %><%#Eval("Extention") %>" style="width:95%;background-color:white;margin:2%;border-radius:10px" alt="<%#Eval("ImageName") %>">
                        <div class="w3-container" style="width:70% ; margin:10px; background-color: white;border: 2px solid violet; border-radius: 10px;border-bottom-right-radius: 30%;">
                            <h4><b><font color="blue"><%#Eval("BrandName") %></font></b></h4>
                            <h3><em><font color="blue"><%#Eval("ProductName") %></font></em></h3>
                            
                            <h3><strike><%#Eval("ProductSellingPrice") %> </strike></h3>
                            <h2><%#Eval("ProductPrice") %></h2>
                            
                            <h3><font color="green">(<%#Eval("DiscAmount") %>  Off)</font></h3>
                        </div>
                    <%--</div>--%>
                        </a>
                </div>
                <br />
                <hr />
            </ItemTemplate>
            <FooterTemplate>
                  </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

