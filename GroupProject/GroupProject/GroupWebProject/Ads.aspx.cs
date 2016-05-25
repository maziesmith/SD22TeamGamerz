using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using GPClassLibrary;
using System.Configuration;
using System.Data;

namespace GroupWebProject
{
    public partial class Ads : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadAds();
            }
        }
        public void loadAds()
        {
            var d = new DAL(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            ViewState["gv"] = d.ExecuteProcedure("spGetAds").Tables[0];
            gvAds.DataSource = (DataTable)ViewState["gv"];
            gvAds.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Security.IsClientAdmin())
            {
                AdsClass a = new AdsClass();
                a.InsertAds(txtTitle.Text, txtDescription.Text, Convert.ToInt32(ddlGames.SelectedValue), Security.CurrentClient.ClientID);
                loadAds();
                pnlGridAds.Visible = true;
                pnlInsertAdd.Visible = false;
            }
            else if (Security.IsClientLoggedIn())
            {
                AdsClass a = new AdsClass();
                a.InsertAds(txtTitle.Text, txtDescription.Text, Convert.ToInt32(ddlGames.SelectedValue), Security.CurrentClient.ClientID);
                loadAds();
                pnlGridAds.Visible = true;
                pnlInsertAdd.Visible = false;
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
                    
        }

        protected void lbAdd_Click(object sender, EventArgs e)
        {
            if (Security.IsClientAdmin())
            {
                pnlGridAds.Visible = false;
                pnlInsertAdd.Visible = true;
            }
            else if (Security.IsClientLoggedIn())
            {
                pnlGridAds.Visible = false;
                pnlInsertAdd.Visible = true;
            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
      }
}