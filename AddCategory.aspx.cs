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
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategoryRepeater();
            }
        }

        private void BindCategoryRepeater()
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from ProductCategoryTable", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        CategoryRepeater.DataSource = dt;
                        CategoryRepeater.DataBind();
                    }
                }
            }
        }

        protected void CategoryAddButton_Click(object sender, EventArgs e)
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into ProductCategoryTable values('" + CategoryNameTextBox.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                CategoryNameTextBox.Text = string.Empty;
            }
            BindCategoryRepeater();
        }
    }
}