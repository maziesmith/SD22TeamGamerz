using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using GPClassLibrary;

namespace GroupWebProject
{
    public partial class Ads : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            AdsClass a = new AdsClass();
            a.InsertAds(txtTitle.Text, txtDescription.Text, Convert.ToInt32(ddlGames.SelectedValue));
            Response.Redirect("Ads.aspx");        
        }
    }
}