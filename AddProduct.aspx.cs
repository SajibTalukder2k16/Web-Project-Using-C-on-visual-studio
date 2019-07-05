using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace UsingBootstrapWebApplication
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindAllBrands();
                BindCategory();
                BindWarranty();
            }
        }

        private void BindWarranty()
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from ProductWarrantyTable ", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                //Response.Write(dt1.Rows.Count);
                if (dt.Rows.Count != 0)
                {

                    ProductWarrantyDropDownList.DataSource = dt;
                    ProductWarrantyDropDownList.DataTextField = "Warranty_time";
                    ProductWarrantyDropDownList.DataValueField = "WarrantyId";
                    ProductWarrantyDropDownList.DataBind();
                    ProductWarrantyDropDownList.Items.Insert(0, new ListItem("-Select-", "0"));
                }

            }
        }

        private void BindCategory()
        {
            
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from ProductCategoryTable ", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                //Response.Write(dt1.Rows.Count);
                if (dt.Rows.Count != 0)
                {

                    ProductCategoryDropDownList.DataSource = dt;
                    ProductCategoryDropDownList.DataTextField = "CategoryName";
                    ProductCategoryDropDownList.DataValueField = "CategoryId";
                    ProductCategoryDropDownList.DataBind();
                    ProductCategoryDropDownList.Items.Insert(0, new ListItem("-Select-", "0"));
                }

            }
        }

        private void BindAllBrands()
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Product_Brand_Table ", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                //Response.Write(dt1.Rows.Count);
                if (dt.Rows.Count != 0)
                {
                    
                    ProductBrandDropDownList.DataSource = dt;
                    ProductBrandDropDownList.DataTextField = "BrandName";
                    ProductBrandDropDownList.DataValueField = "BrandId";
                    ProductBrandDropDownList.DataBind();
                    ProductBrandDropDownList.Items.Insert(0, new ListItem("-Select-", "0"));
                }
                
            }
        }

        protected void ProductAddButton_Click(object sender, EventArgs e)
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("procInsertProducts", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductName", ProductNameTextBox.Text);
                cmd.Parameters.AddWithValue("@ProductPrice", ProductPriceTextBox.Text);
                cmd.Parameters.AddWithValue("@ProductSellingPrice", ProductSellingPriceTextBox.Text);
                cmd.Parameters.AddWithValue("@ProductBrandID", ProductBrandDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ProductCategoryID", ProductCategoryDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ProductWarrantyId", ProductWarrantyDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ProductDescription", ProductDescriptionTextBox.Text);
                cmd.Parameters.AddWithValue("@ProductDetails", ProductDetailsTextBox.Text);
                cmd.Parameters.AddWithValue("@ProductModel", ProductModelTextBox.Text);
                if (FreeDeliveryCheckBox.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@FreeDelivery", 1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString());
                }
                if (SevenDaysReturnCheckBox.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@7daysReplace", 1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@7daysReplace", 0.ToString());
                }
                if (CashOnDeliveryCheckBox.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@CashOnDelivery", 1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@CashOnDelivery", 0.ToString());
                }
                con.Open();
                Int64 ProductId = Convert.ToInt64(cmd.ExecuteScalar());

               
                foreach (ListItem item in ProductBrandDropDownList.Items)
                {
                    item.Selected = false;
                }
                foreach (ListItem item in ProductCategoryDropDownList.Items)
                {
                    item.Selected = false;
                }
                foreach (ListItem item in ProductWarrantyDropDownList.Items)
                {
                    item.Selected = false;
                }
                

                //int Quantity = Convert.ToInt32(txtQuantity.Text);
               // int x = Int32.Parse(TextBoxD1.Text);
                //int Quantity = int.Parse(ProductQuantityTextBox.Text);
                int Quantity = 0;

                Int32.TryParse(ProductQuantityTextBox.Text, out Quantity);


                SqlCommand cmd2 = new SqlCommand("insert into ProductQuantityTable values('" + ProductId + "','" + Quantity + "')", con);
                 cmd2.ExecuteNonQuery();
                if (ProductFileUpload1.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + ProductId;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(ProductFileUpload1.PostedFile.FileName);
                    ProductFileUpload1.SaveAs(SavePath + "\\" + ProductNameTextBox.Text.ToString().Trim() + "01" + Extention);

                    SqlCommand cmd3 = new SqlCommand("insert into ProductImageTable values('" + ProductId + "','" + ProductNameTextBox.Text.ToString().Trim() + "01" + "','" + Extention + "')", con);
                    cmd3.ExecuteNonQuery();
                }
                if (ProductFileUpload2.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + ProductId;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(ProductFileUpload2.PostedFile.FileName);
                    ProductFileUpload2.SaveAs(SavePath + "\\" + ProductNameTextBox.Text.ToString().Trim() + "02" + Extention);
                    //Response.Write(ProductNameTextBox.Text.ToString().Trim());

                    SqlCommand cmd4 = new SqlCommand("insert into ProductImageTable values('" + ProductId + "','" + ProductNameTextBox.Text.ToString().Trim() + "02" + "','" + Extention + "')", con);
                    cmd4.ExecuteNonQuery();
                }
                //if (ProductFileUpload2.HasFile)
                //{
                //    string SavePath = Server.MapPath("~/Images/ProductImages/") + ProductId;
                //    if (!Directory.Exists(SavePath))
                //    {
                //        Directory.CreateDirectory(SavePath);
                //    }
                //    string Extention = Path.GetExtension(ProductFileUpload2.PostedFile.FileName);
                //    ProductFileUpload2.SaveAs(SavePath + "\\" + ProductNameTextBox.Text.ToString().Trim() + "02" + Extention);

                //    SqlCommand cmd3 = new SqlCommand("insert into ProductImageTable values('" + ProductId + "','" + ProductNameTextBox.Text.ToString().Trim() + "02" + "','" + Extention + "')", con);
                //    cmd3.ExecuteNonQuery();
                //}
                if (ProductFileUpload3.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/ProductImages/") + ProductId;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(ProductFileUpload3.PostedFile.FileName);
                    ProductFileUpload3.SaveAs(SavePath + "\\" + ProductNameTextBox.Text.ToString().Trim() + "03" + Extention);

                    SqlCommand cmd3 = new SqlCommand("insert into ProductImageTable values('" + ProductId + "','" + ProductNameTextBox.Text.ToString().Trim() + "03" + "','" + Extention + "')", con);
                    cmd3.ExecuteNonQuery();
                }
                ProductModelTextBox.Text = string.Empty;
                ProductNameTextBox.Text = string.Empty;
                ProductPriceTextBox.Text = string.Empty;
                ProductSellingPriceTextBox.Text = string.Empty;
                ProductDescriptionTextBox.Text = string.Empty;
                ProductDetailsTextBox.Text = string.Empty;
                ProductQuantityTextBox.Text = string.Empty;
                FreeDeliveryCheckBox.Checked = false;
                CashOnDeliveryCheckBox.Checked = false;
                SevenDaysReturnCheckBox.Checked = false;


            }
            }
    }
}