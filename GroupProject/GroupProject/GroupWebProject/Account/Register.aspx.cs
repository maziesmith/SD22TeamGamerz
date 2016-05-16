using GPClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupWebProject.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            try
            {
                Client client = new Client();
                client.InsertClient(null, null, null, null, null, null, UserName.Text, Password.Text, Email.Text, false);
                Response.Redirect("~/Account/Login");
            }
            catch (Exception)
            {
                ErrorMessage.Visible = true;
            }
        }
    }
}