using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GPClassLibrary;
using DAL_Project;
using System.Configuration;
using System.Data;


namespace GroupWebProject.Account
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (!Security.IsClientAdmin())
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {

                }
            }
        }

        protected void btnConsoles_Click(object sender, EventArgs e)
        {
            btnMain.Visible = true;
            pnlConsoles.Visible = true;
            pnlAdmin.Visible = false;
        }

        protected void btnGames_Click(object sender, EventArgs e)
        {
            pnlGames.Visible = true;
            btnMain.Visible = true;
            pnlAdmin.Visible = false;
        }

        protected void btnCategories_Click(object sender, EventArgs e)
        {
            pnlCategories.Visible = true;
            btnMain.Visible = true;
            pnlAdmin.Visible = false;
        }

        protected void btnAccounts_Click(object sender, EventArgs e)
        {
            pnlAccounts.Visible = true;
            btnMain.Visible = true;
            pnlAdmin.Visible = false;
        }

        protected void btnMain_Click(object sender, EventArgs e)
        {
            pnlConsoles.Visible = false;
            pnlAccounts.Visible = false;
            pnlGames.Visible = false;
            pnlCategories.Visible = false;
            btnMain.Visible = false;
            pnlAdmin.Visible = true;
        }
    }
}