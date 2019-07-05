using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace UsingBootstrapWebApplication
{
    public partial class AddBrand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindBrandRepeater();
            }
        }

        private void BindBrandRepeater()
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using(SqlCommand cmd=new SqlCommand("select * from Product_Brand_Table",con))
                {
                    using(SqlDataAdapter sda=new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        BrandRepeater.DataSource = dt;
                        BrandRepeater.DataBind();
                    }
                }
            }
        }

        protected void BrandAddButton_Click(object sender, EventArgs e)
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into Product_Brand_Table values('" + BrandNameTextBox.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                BrandNameTextBox.Text = string.Empty;
            }
            BindBrandRepeater();
        }
    }
}