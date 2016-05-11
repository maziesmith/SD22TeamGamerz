using GPClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GroupWebProject
{
    public class Security
    {
        public static Client CurrentClient
        {
            get
            {
                return HttpContext.Current.Session["Client"] == null ? null : (Client)HttpContext.Current.Session["Client"];
            }
        }

        public static void Login(string UserName, string Password)
        {
            HttpContext.Current.Session["Client"] = Client.Login(UserName, Password);
        }

        public static bool IsClientLoggedIn()
        {
            return CurrentClient != null;
        }

        public static bool IsClientAdmin()
        {
            return IsClientLoggedIn() && CurrentClient.IsAdmin;
        }

        internal static void LogOut()
        {
            HttpContext.Current.Session["Client"] = null;
            HttpContext.Current.Session.Abandon();
        }
    }
}