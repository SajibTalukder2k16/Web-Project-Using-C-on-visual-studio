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
    public partial class NewProductView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["PID"] != null)
            {
                if (!IsPostBack)
                {
                    BindProductImages();
                    BindProductDetails();
                }
            }
            else
            {
                Response.Redirect("~/AllProducts.aspx");
            }
        }

        private void BindProductDetails()
        {
            Int64 ProductId = Convert.ToInt64(Request.QueryString["PID"]);
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from ProductTable where ProductId =" + ProductId + "", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);

                        ProductDetailsRepeater.DataSource = dtBrands;
                        ProductDetailsRepeater.DataBind();
                    }

                }
            }
        }

        private void BindProductImages()
        {
            Int64 ProductId=Convert.ToInt64(Request.QueryString["PID"]);
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from ProductImageTable where ProductId ="+ProductId+"", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dtBrands = new DataTable();
                        sda.Fill(dtBrands);

                        ImageRepeaterId.DataSource = dtBrands;
                        ImageRepeaterId.DataBind();
                    }

                }
            }
        }
        protected string GetActiveClass(int ItemIndex)
        {
            if(ItemIndex==0)
            {
                return "active";
            }
            else
            {
                return "";
            }
        }

        protected void ProductDetailsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Int64 ProductId = Convert.ToInt64(Request.QueryString["PID"]);
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RadioButtonList Colorlist = e.Item.FindControl("ColorRadioButton") as RadioButtonList;

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
                            Colorlist.DataSource = dtBrands;
                            Colorlist.DataTextField = "ProductColor";
                            Colorlist.DataValueField = "ProductColorId";
                            Colorlist.DataBind();
                        }

                    }
                }

            }
        }

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            {
                string SelectedColor = string.Empty;

                foreach (RepeaterItem item in ProductDetailsRepeater.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        var rbList = item.FindControl("ColorRadioButton") as RadioButtonList;
                        SelectedColor = rbList.SelectedValue;

                        var lblError = item.FindControl("lblError") as Label;
                        lblError.Text = "";
                    }
                }

                if (SelectedColor != "")
                {
                    Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

                    if (Request.Cookies["CartPID"] != null)
                    {
                        string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                        CookiePID = CookiePID + "," + PID + "-" + SelectedColor;
                        Response.Write(CookiePID);

                        HttpCookie CartProducts = new HttpCookie("CartPID");
                        CartProducts.Values["CartPID"] = CookiePID;
                        CartProducts.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(CartProducts);
                    }
                    else
                    {
                        HttpCookie CartProducts = new HttpCookie("CartPID");
                        CartProducts.Values["CartPID"] = PID.ToString() + "-" + SelectedColor;
                        CartProducts.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(CartProducts);
                    }
                    Response.Redirect("~/NewProductView.aspx?PID=" + PID);
                }
                else
                {
                    foreach (RepeaterItem item in ProductDetailsRepeater.Items)
                    {
                        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                        {
                            var lblError = item.FindControl("lblError") as Label;
                            lblError.Text = "Please select a color";
                        }
                    }
                }
            }
        }
    }
}