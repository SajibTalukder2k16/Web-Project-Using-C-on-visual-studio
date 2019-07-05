using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UsingBootstrapWebApplication
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                LogOutButton.Visible = true;
                LoginButton.Visible = false;
                
                LabelSuccess.Text =Session["username"].ToString() + "";
            }
            else
            {
                LogOutButton.Visible = false;
                LoginButton.Visible = true;
                //Response.Redirect("~/SignIn.aspx");
            }
        }

        protected void LogOutButton_Click(object sender, EventArgs e)
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