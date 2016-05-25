using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GPClassLibrary;
using System.Data;

namespace GroupWebProject
{
    public partial class PostAd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Security.IsClientLoggedIn())
            {
                Session["previousUrl"] = Request.Url;
                Response.Redirect("Account/Login.aspx");
            }
            if (!IsPostBack)
            {
                ddlConsole.DataSource = GameConsole.GetAllConsoles();
                ddlConsole.DataValueField = "ConsoleID";
                ddlConsole.DataTextField = "ConsoleName";
                ddlConsole.DataBind();
                ddlCategory.DataSource = Category.GetAllCategories();
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataBind();
            }
        }

        protected void btnList_Click(object sender, EventArgs e)
        {

        }
    }
}