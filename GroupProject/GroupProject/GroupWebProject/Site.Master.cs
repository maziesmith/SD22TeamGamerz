using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using DAL_Project;
using System.Data;
using GPClassLibrary;

namespace GroupWebProject
{
    public partial class SiteMaster : MasterPage
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GameConsole c = new GameConsole();
                ddlSearch.DataTextField = c.ConsoleName;
                ddlSearch.DataValueField= c.ConsoleID.ToString();
                ddlSearch.DataBind();

                if (Security.IsClientAdmin())
                {
                    lbName.Text = Security.CurrentClient.FirstName;
                    User.Visible = true;
                    Default.Visible = false;
                }
                else if (Security.IsClientLoggedIn())
                {
                    lbName.Text = Security.CurrentClient.FirstName;
                    User.Visible = true;
                    hlAdmin.Visible = false;
                    Default.Visible = false;
                }
                else
                {
                    User.Visible = false;
                }
               
            }
        }

        protected void lbLogout_Click1(object sender, EventArgs e)
        {
            Security.LogOut();
            Response.Redirect("~/Default.aspx");
        }
    }

}