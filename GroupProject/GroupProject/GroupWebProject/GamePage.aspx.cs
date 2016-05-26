using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GPClassLibrary;

namespace GroupWebProject
{
    public partial class GamePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string GameID = Request.QueryString["game"];        
            dlGame.DataSource = Game.GetGameByID(GameID);
            dlGame.DataBind();
            btnBack.Visible = true;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Games.aspx");
            btnBack.Visible = false;
        }
    }
}