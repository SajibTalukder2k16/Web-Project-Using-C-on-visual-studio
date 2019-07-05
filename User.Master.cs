using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UsingBootstrapWebApplication
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCartNumber();
            if (Session["username"] != null)
            {
                LogoutButton.Visible = true;
                LoginButton.Visible = false;
                //LabelSuccess.Text = "Login Success , Welcome " + Session["username"].ToString() + "";
            }
            else
            {
                LogoutButton.Visible = false;
                LoginButton.Visible = true;
               // Response.Redirect("~/SignIn.aspx");
            }
        }
        public void BindCartNumber()
        {
            //Response.Cookies["CartPID"].Expires = DateTime.Now.AddDays(-1);
            if (Request.Cookies["CartPID"] != null)
            {
                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];

                string[] ProductArray = CookiePID.Split(',');
                int ProductCount = ProductArray.Length;
                pCount.InnerText = ProductCount.ToString();
            }
            else
            {
                pCount.InnerText = 0.ToString();
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session["usename"] = null;
            Response.Redirect("~/Home.aspx");
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn.aspx");
        }
    }
}