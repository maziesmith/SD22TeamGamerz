using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GPClassLibrary;

namespace GroupWebProject.Account
{
    public partial class ManageAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (ViewState["editIsVisible"] != null)
            //{
            //if ((bool)ViewState["editIsVisible"] == true)
            //{
            //
            //}
            //divEditUser.Visible = true;
            //}
            
            if (!IsPostBack)
            {
                if (Request.QueryString.AllKeys.Length != 0)
                {
                    string userID;
                    ViewState["user"] = Request.QueryString["user"];
                    userID = ViewState["user"].ToString();
                    if (!Security.IsClientLoggedIn() || userID != Security.CurrentClient.ClientID.ToString())
                    //userID != Security.CurrentClient.ClientID.ToString()
                    {
                        Response.Redirect("../Default.aspx");
                    }
                    else
                    {
                        List<Client> userList = new List<Client>();
                        Client currentUser = new Client();

                        userList = currentUser.GetClient(userID);
                        lblClientID.Text = userList[0].ClientID.ToString();
                        lblUserName.Text = userList[0].UserName;
                        txtFirstName.Text = userList[0].FirstName;
                        txtLastName.Text = userList[0].LastName;
                        txtEmail.Text = userList[0].Email;
                        txtCity.Text = userList[0].City;
                        txtAddress.Text = userList[0].Address;
                        txtPostalCode.Text = userList[0].PostalCode;
                        txtPhoneNumber.Text = userList[0].PhoneNumber;
                    }
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }    
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string query = ViewState["user"].ToString();
            Client updateClient = new Client();
            updateClient.UpdateClient(Security.CurrentClient.ClientID.ToString(), txtFirstName.Text, txtLastName.Text, txtAddress.Text, txtCity.Text, txtPostalCode.Text, txtPhoneNumber.Text, lblUserName.Text, Security.CurrentClient.Password, txtEmail.Text, Security.CurrentClient.IsAdmin);
            //ViewState["editIsVisible"] = false;
            Response.Redirect("ManageAccount.aspx?user=" + query);
            
        }

        protected void lbEditAccount_Click(object sender, EventArgs e)
        {
            //ViewState["editIsVisible"] = true;
            divEditUser.Visible = true;
        }
    }
}