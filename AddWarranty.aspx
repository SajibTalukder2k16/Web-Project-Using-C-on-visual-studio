<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddWarranty.aspx.cs" Inherits="UsingBootstrapWebApplication.AddWarranty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Warranty</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Warranty Time"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="WarrantyTimeTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="WarrantyTimeTextBox"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
              <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="WarrantyAddButton" runat="server" Text="Add" CssClass="btn btn-default" OnClick="WarrantyAddButton_Click"  />
              </div>
          </div>
         </div>
        <!--Start-->
        <h1>Warranty</h1>
        <hr />
        <!--table start-->
        <div class="panel panel-default">
            <div class="panel-heading">All Warranty Time</div>
            <asp:Repeater ID="WarrantyRepeater" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                          <tr>
                             <th scope="col">#</th>
                             <th scope="col">Warranty Time</th>
                             <th scope="col">Edit</th>
                          </tr>
                        </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                    <th scope="row"><%# Eval("WarrantyId") %></th>
                    <td><%# Eval("Warranty_time") %></td>
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
