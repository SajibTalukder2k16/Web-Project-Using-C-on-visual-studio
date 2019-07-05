using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UsingBootstrapWebApplication
{
    public partial class ProductView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ProductId"] != null)
            {
                if (!IsPostBack)
                {
                    BindProductImages();
                    BindProductDetails();
                   // RptrProductDetails_ItemDataBound();
                }
            }
            else
            {
                Response.Redirect("~/AllProducts.aspx");
            }
        }

        private void BindProductDetails()
        {
            Int64 ProductId = Convert.ToInt64(Request.QueryString["ProductId"]);

            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from ProductTable where ProductId=" + ProductId + "", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);
                        RptrProductDetails.DataSource = dtBrands;
                        RptrProductDetails.DataBind();
                    }

                }
            }
        }

        private void BindProductImages()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from ProductImageTable where ProductId=" + PID + "", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);
                        rptrImages.DataSource = dtBrands;
                        rptrImages.DataBind();
                    }

                }
            }
        }
        protected string GetActiveClass(int ItemIndex)
        {
            if (ItemIndex == 0)
            {
                return "active";
            }
            else
            {
                return "";
            }
        }
        protected void RptrProductDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Int64 ProductId = Convert.ToInt64(Request.QueryString["ProductId"]);
                string BrandID = (e.Item.FindControl("hfBrandID") as HiddenField).Value;
                string CatID = (e.Item.FindControl("hfCatID") as HiddenField).Value;
                string WarrantyID = (e.Item.FindControl("hfWarrantyID") as HiddenField).Value;

                RadioButtonList rblSize = e.Item.FindControl("rblSize") as RadioButtonList;

                String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand("select * from ProductColorTable where ProductId=" + ProductId + "", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dtBrands = new DataTable();
                            sda.Fill(dtBrands);
                            rblSize.DataSource = dtBrands;
                            rblSize.DataTextField = "ProductColor";
                            rblSize.DataValueField = "ProductColorId";
                            rblSize.DataBind();
                        }

                    }
                }

            }
        }

        protected void BtnAddToCart_Click(object sender, EventArgs e)
        {
            string SelectedSize = string.Empty;
            foreach (RepeaterItem item in RptrProductDetails.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var rbList = item.FindControl("rblSize") as RadioButtonList;
                    SelectedSize = rbList.SelectedValue;

                    var lblError = item.FindControl("lblError") as Label;
                    lblError.Text = "";
                }
            }

            if (SelectedSize != "")
            {
                Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

                if (Request.Cookies["CartPID"] != null)
                {
                    string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                    CookiePID = CookiePID + "," + PID + "-" + SelectedSize;

                    HttpCookie CartProducts = new HttpCookie("CartPID");
                    CartProducts.Values["CartPID"] = CookiePID;
                    CartProducts.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(CartProducts);
                }
                else
                {
                    HttpCookie CartProducts = new HttpCookie("CartPID");
                    CartProducts.Values["CartPID"] = PID.ToString() + "-" + SelectedSize;
                    CartProducts.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(CartProducts);
                }
                Response.Redirect("~/ProductView.aspx?PID=" + PID);
            }
            else
            {
                foreach (RepeaterItem item in RptrProductDetails.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        var lblError = item.FindControl("lblError") as Label;
                        lblError.Text = "Please select a size";
                    }
                }
            }
        }

        protected void CheckRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}