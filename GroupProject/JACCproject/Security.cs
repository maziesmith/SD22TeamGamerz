using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JACCproject
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
        public static void Login(string userName, string password)
        {
            HttpContext.Current.Session["Customer"] = Client.Login(userName, password);
        }
    }
}