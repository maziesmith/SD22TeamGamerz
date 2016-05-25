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
                ddlSearch.DataSource = GameConsole.GetAllConsoles();
                ddlSearch.DataTextField = "ConsoleName";
                ddlSearch.DataValueField = "ConsoleID";
                ddlSearch.DataBind();

                if (Security.IsClientAdmin())
                {
                    lbName.Text = Security.CurrentClient.UserName;
                    User.Visible = true;
                    Default.Visible = false;
                }
                else if (Security.IsClientLoggedIn())
                {
                    lbName.Text = Security.CurrentClient.UserName;
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("Games.aspx?game=" + txtSearchBar.Text + "&console=" + ddlSearch.SelectedItem);
        }

        protected void lbManageAccount_Click(object sender, EventArgs e)
        {
            //~/ Account / ManageAccount.aspx ? user =<%# Security.CurrentClient.ID %>'
            Response.Redirect("~/Account/ManageAccount.aspx?user=" + Security.CurrentClient.ClientID);
        }
    }

}