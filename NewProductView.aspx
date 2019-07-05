<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="NewProductView.aspx.cs" Inherits="UsingBootstrapWebApplication.NewProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-top:50px;">
        <div>
            <div  class="thumbnail">
                <%--<img  style="max-width:480px;max-height:480px;" src="images\ProductImages\23\Macbook01.jpg" />--%>
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
      <asp:Repeater ID="ImageRepeaterId" runat="server">
          <ItemTemplate>
              <div class="item <%# GetActiveClass(Container.ItemIndex) %>">
                 <img src="Images/ProductImages/<%#Eval("ProductId") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
               </div>
          </ItemTemplate>
       </asp:Repeater>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

            </div>
        </div>
        <div class="col-md-7" style="background-color:azure;border-radius:10px;border-color:green;">
            <asp:Repeater ID="ProductDetailsRepeater" OnItemDataBound="ProductDetailsRepeater_ItemDataBound" runat="server">
                <ItemTemplate>
            <div class="divDet1">
                <h1 class="proNameView"><%#Eval("ProductName") %></h1>
                <span class="proOgPriceView"><%#Eval("ProductSellingPrice") %></span><span class="proPriceDiscountView"> <%# string.Format("{0}",Convert.ToInt64(Eval("ProductSellingPrice"))-Convert.ToInt64(Eval("ProductPrice"))) %> OFF</span>
                <p class="proPriceView"><%#Eval("ProductPrice") %></p>
            </div>

            <div>
                <h5 class="h5Size">Color</h5>
                <div>
                    <asp:RadioButtonList ID="ColorRadioButton" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                        
                        
                    </asp:RadioButtonList>
                    <asp:Label runat="server" ID="lblError" CssClass="text-danger" Text=""></asp:Label>
                </div>
            </div>
            <div>
                <asp:Button ID="AddToCartButton" class="divDet1" OnClick="AddToCartButton_Click"  CssClass="mainButton" runat="server" Text="Add To Cart" />
            </div>
            <div>
                <h5 class="h5Size">Description</h5>
                <p>
                    <%#Eval("ProductDescription") %>
                </p>
                <h5 class="h5Size">Product Details</h5>
                <p>
                    <%#Eval("ProductDetails") %>
                </p>

            </div>
                <div>
                 <p><%# ((int)Eval("FreeDelivery")==1)?"Free Delivery":"" %></p>
                  <p><%# ((int)Eval("7daysReplace")==1)?"7 Days Returns":"" %></p>
                  <p><%# ((int)Eval("CashOnDelivery")==1)?"Cash on Delivery":"" %></p>
                </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
