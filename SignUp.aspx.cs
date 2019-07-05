using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace UsingBootstrapWebApplication
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            //Response.Write(UserNameTextBox.Text);
            //Response.Write("<script>alert('Sajib');</script>");
            if (UserNameTextBox.Text!=""&&FullNameTextBox.Text!=""&&EmailTextBox.Text!=""&&PasswordTextBox.Text!=""&&ConfirmPasswordTextBox.Text!="")
            {
                if (PasswordTextBox.Text != ConfirmPasswordTextBox.Text)
                {
                    MessageLabel.ForeColor = Color.White;
                    MessageLabel.Text = "Both Password must be same";
                   //window.alert("Both Password must be same");
                   // Response.Write("<script>alert('Both Password must be same');</script>");
                }
                else
                {
                    string pass = PasswordTextBox.Text;
                    if(pass.Length<8 && pass.Length>10)
                    {
                        MessageLabel.ForeColor = Color.Red;
                        MessageLabel.Text = "Password lenght must be between 8 to 10";
                    }
                    else
                    {
                        int i;
                        int len = pass.Length;
                        bool low = false;
                        bool upp = false;
                        bool num = false;
                        bool other = false;
                        for(i=0;i<len;i++)
                        {
                            if (pass[i] >='a' && pass[i]<='z')
                            {
                                low = true;
                            }
                            else if(pass[i]>='A' && pass[i]<='Z')
                            {
                                upp = true;
                            }
                            else if(pass[i]>='0' && pass[i]<='9')
                            {
                                num = true;
                            }
                            else
                            {
                                other = true;
                            }
                        }
                        if(low==false)
                        {
                            MessageLabel.ForeColor = Color.White;
                            MessageLabel.Text = "Password need at least one lower case letter";
                        }
                        else if(upp==false)
                        {
                            MessageLabel.ForeColor = Color.Red;
                            MessageLabel.Text = "Password need at least one upper case letter";
                        }
                        else if(num==false)
                        {
                            MessageLabel.ForeColor = Color.Red;
                            MessageLabel.Text = "Password need at least one number character";
                        }
                        else if(other==false)
                        {
                            MessageLabel.ForeColor = Color.Red;
                            MessageLabel.Text = "Password need at least one special character";
                        }
                        else
                        {
                            String cs = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(cs))
                            {
                                SqlCommand cmd = new SqlCommand("insert into users values('" + UserNameTextBox.Text + "','" + FullNameTextBox.Text + "','" + EmailTextBox.Text + "','" + PasswordTextBox.Text + "','U')", con);
                                con.Open();
                                cmd.ExecuteNonQuery();
                                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully Registered')", true);


                                Response.Redirect("~/SignIn.aspx");
                                // Response.Redirect("~/SignIn.aspx");
                            }
                        }
                    }
                    
         

                }
            }
            else
            {
                MessageLabel.ForeColor = Color.Red;
                MessageLabel.Text = "Please Fill up all the required fields";
            }
            
        }
    }
}