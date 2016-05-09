using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Data;

namespace GroupWebProject
{
    public partial class _Default : Page
    {
        private string connString = "Data Source=(local);Initial Catalog=dbSD22GroupProject;Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DAL myDAL = new DAL(connString);
                DataSet ds = new DataSet();
                ds = myDAL.ExecuteProcedure("spGetConsoleByID");
                dlHomePageConsoles.DataSource = ds;
                dlHomePageConsoles.DataBind();
            }
        }
    }
}