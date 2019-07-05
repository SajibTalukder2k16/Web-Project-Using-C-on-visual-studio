using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace UsingBootstrapWebApplication
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request.Cookies["username"]!=null && Request.Cookies["password"]!=null)
                {
                    UsernameTextBox.Text = Request.Cookies["username"].Value;
                    PasswordTextBox.Text = Request.Cookies["password"].Value;
                    CookieCheckBox.Checked = true;
                }
            }
        }

        protected void LoginButton_Click1(object sender, EventArgs e)
        {
            

                //Response.Write("Sajib Talukder");
                String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd1 = new SqlCommand("select * from users where password='" + PasswordTextBox.Text + "'and  username='" + UsernameTextBox.Text + "'",con);
                    SqlCommand cmd2 = new SqlCommand("select * from users where password='" + PasswordTextBox.Text + "'and  email='" + UsernameTextBox.Text + "'",con);
                    con.Open();
                    SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                    SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
                    DataTable dt1 = new DataTable();
                    DataTable dt2 = new DataTable();
                    sda1.Fill(dt1);
                    sda2.Fill(dt2);
                    //Response.Write(dt1.Rows.Count);
                    if (dt1.Rows.Count != 0 || dt2.Rows.Count != 0)
                    {
                    if(CookieCheckBox.Checked)
                    {
                        Response.Cookies["username"].Value = UsernameTextBox.Text;
                        Response.Cookies["password"].Value = PasswordTextBox.Text;

                        Response.Cookies["username"].Expires = DateTime.Now.AddDays(15);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(15);
                    }
                    else
                    {
                        Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["password"].Expires = DateTime.Now.AddDays(-1);
                    }
                        Session["username"] = UsernameTextBox.Text;
                        Session["password"] = PasswordTextBox.Text;

                    string usertype;
                    usertype = dt1.Rows[0][5].ToString().Trim();
                    if(usertype=="U")
                    {
                        Response.Redirect("~/UserHome.aspx");
                    }
                    if(usertype=="A")
                    {
                        Response.Redirect("~/AdminHome.aspx");
                    }

                        //Response.Redirect("~/UserHome.aspx");
                    }
                    else
                    {
                    //LabelError.Text = "Invalid Username/Email or password";
                    Response.Write("<script>alert('Invalid Username/Email or password');</script>");
                    //Response.Redirect("~/SignIn.aspx");
                }
                }
            }
        
    }
}