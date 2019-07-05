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
    public partial class AddQuantity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAllProductId();
                BindQuantityRepeater();
            }
        }

        private void BindQuantityRepeater()
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from ProductQuantityTable", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        QuantityRepeater.DataSource = dt;
                        QuantityRepeater.DataBind();
                    }
                }
            }
        }

        private void BindAllProductId()
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from ProductTable ", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                //Response.Write(dt1.Rows.Count);
                if (dt.Rows.Count != 0)
                {
                    ProductDropDownId.DataSource = dt;
                    ProductDropDownId.DataTextField = "ProductName";
                    ProductDropDownId.DataValueField = "ProductId";
                    ProductDropDownId.DataBind();
                    ProductDropDownId.Items.Insert(0, new ListItem("-Select-", "0"));
                }
                
            }
        }

        protected void QuantityAddButton_Click(object sender, EventArgs e)
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into ProductQuantityTable values('"+ProductDropDownId.SelectedItem.Value+"','" + ProductQuantityTextBox.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                ProductQuantityTextBox.Text = string.Empty;
                ProductDropDownId.ClearSelection();
                ProductDropDownId.Items.FindByValue("0").Selected = true;
            }
        }
    }
}