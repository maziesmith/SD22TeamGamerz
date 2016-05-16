using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupWebProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Security.IsClientAdmin())
            {
                Response.Redirect("AdminPage.aspx");
            }
            else if (Security.IsClientLoggedIn())
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    Security.Login(UserName.Text, Password.Text);
                    if (Security.IsClientAdmin())
                    {
                        Response.Redirect("~/Account/AdminPage.aspx");
                    }
                    else if (Security.IsClientLoggedIn())
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                }
                catch (Exception)
                {
                    ErrorMessage.Visible = true;
                }
            }
        }
    }
}