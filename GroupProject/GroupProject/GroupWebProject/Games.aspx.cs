﻿using System;
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
            string consoleName = Request.QueryString["console"];
            dlGames.DataSource = Game.GetGamesByConsoleName(consoleName);
            dlGames.DataBind();
        }
    }
}