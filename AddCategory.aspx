<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="UsingBootstrapWebApplication.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Brand</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Category Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="CategoryNameTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="CategoryNameTextBox"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
              <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="CategoryAddButton" runat="server" Text="Add Category" CssClass="btn btn-default" OnClick="CategoryAddButton_Click" />
              </div>
          </div>
         </div>
                <!--Start-->
        <h1>Category</h1>
        <hr />
        <!--table start-->
        <div class="panel panel-default">
            <div class="panel-heading">All Category</div>
            <asp:Repeater ID="CategoryRepeater" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                          <tr>
                             <th scope="col">#</th>
                             <th scope="col">Category Name</th>
                             <th scope="col">Edit</th>
                          </tr>
                        </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                    <th scope="row"><%# Eval("CategoryId") %></th>
                    <td><%# Eval("CategoryName") %></td>
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
