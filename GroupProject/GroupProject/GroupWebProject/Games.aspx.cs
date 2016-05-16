using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GPClassLibrary;

namespace GroupWebProject
{
    public partial class Games : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.AllKeys.Length != 0)
            {
                foreach (String key in Request.QueryString.AllKeys)
                {
                    //Response.Write("Key: " + key + " Value: " + Request.QueryString[key]);
                    switch (key)
                    {
                        case "category":
                            int gameQueryInt = Convert.ToInt32(Request.QueryString["category"]);
                            dlGames.DataSource = Game.GetGamesByCategoryID(gameQueryInt);
                            break;
                        case "console":
                            string gameQueryString = Request.QueryString["console"];
                            dlGames.DataSource = Game.GetGamesByConsoleName(gameQueryString);
                            break;
                        default:
                            break;
                    }
                }
            }
            else
            {
                dlGames.DataSource = Game.GetAllGames();
            }
            //string queryName = Request.QueryString["console"] ?? Request.QueryString["category"];
            //dlGames.DataSource = Game.GetGamesByConsoleName(queryName);
            dlGames.DataBind();
        }

        protected void dlGames_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Response.Redirect("GamePage.aspx?game=" + e.CommandArgument.ToString());
        }
    }
}