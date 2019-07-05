<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="UsingBootstrapWebApplication.AddBrand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Brand</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Brand Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="BrandNameTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="BrandNameTextBox"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
              <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="BrandAddButton" runat="server" Text="Add Brand" CssClass="btn btn-default" OnClick="BrandAddButton_Click" />
              </div>
          </div>
         </div>
        <h1>Brands</h1>
        <hr />
        <!--table start-->
        <div class="panel panel-default">
            <div class="panel-heading">All Brands</div>
            <asp:Repeater ID="BrandRepeater" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                          <tr>
                             <th scope="col">#</th>
                             <th scope="col">Brand</th>
                             <th scope="col">Edit</th>
                          </tr>
                        </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                    <th scope="row"><%# Eval("BrandId") %></th>
                    <td><%# Eval("BrandName") %></td>
                    <td>Edit</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        

        </div>
        <!--table end-->
      </div>
</asp:Content>
