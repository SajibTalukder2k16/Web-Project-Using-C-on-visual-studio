<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddColor.aspx.cs" Inherits="UsingBootstrapWebApplication.AddColor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
        <div class="form-horizontal">
            <h2>Add Color</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Product Id"></asp:Label>
                <div class="col-md-3">
                    <asp:dropdownlist runat="server" ID="ProductDropDownId" CssClass="form-control" ></asp:dropdownlist>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ProductDropDownId" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Color"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="ProductQuantityTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ProductQuantityTextBox"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
              <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="QuantityAddButton" runat="server" Text="Add" CssClass="btn btn-default" OnClick="QuantityAddButton_Click" />
              </div>
          </div>
         </div>

        <!--Start-->
        <h1>Quantity</h1>
        <hr />
        <!--table start-->
        <div class="panel panel-default">
            <div class="panel-heading">All Color of Products</div>
            <asp:Repeater ID="QuantityRepeater" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                          <tr>
                             <th scope="col">#</th>
                             <th scope="col">Product Color Id</th>
                             <th scope="col">Product Color</th>
                             <th scope="col">Edit</th>
                          </tr>
                        </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                    <th scope="row"><%# Eval("ProductColorId") %></th>
                    <td><%# Eval("ProductId") %></td>
                    <td><%# Eval("ProductColor") %></td>
                    <td>Edit</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        

        </div>
        <!--End-->
      </div>
</asp:Content>
