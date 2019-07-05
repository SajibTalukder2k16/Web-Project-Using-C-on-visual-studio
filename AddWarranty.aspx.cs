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
    public partial class AddWarranty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindWarrantyRepeater();
            }
        }

        private void BindWarrantyRepeater()
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from ProductWarrantyTable", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        WarrantyRepeater.DataSource = dt;
                        WarrantyRepeater.DataBind();
                    }
                }
            }
        }

        protected void WarrantyAddButton_Click(object sender, EventArgs e)
        {
            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into ProductWarrantyTable values('" + WarrantyTimeTextBox.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                WarrantyTimeTextBox.Text = string.Empty;
            }
            BindWarrantyRepeater();
        }
    }
}