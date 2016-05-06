using DAL_Project;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GPClassLibrary
{
    public class Client
    {
        public int ClientID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public string PhoneNumber { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public bool IsAdmin { get; set; }

        public static Client Login(string UserName, string Password)
        {
            Client result = null;
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbGroupProject"].ConnectionString);
            d.AddParam("UserName", UserName);
            d.AddParam("Password", Password);
            DataSet ds = d.ExecuteProcedure("spLogin");

            if (ds.Tables[0].Rows.Count == 1)
            {
                DataRow r = ds.Tables[0].Rows[0];
                result = new Client();
                result.ClientID = int.Parse(r["ClientID"].ToString());
                result.FirstName = r["FirstName"].ToString();
                result.LastName = r["LastName"].ToString();
                result.Address = r["Address"].ToString();
                result.City = r["City"].ToString();
                result.PostalCode = r["PostalCode"].ToString();
                result.PhoneNumber = r["PhoneNumber"].ToString();
                result.UserName = r["UserName"].ToString();
                result.Email = r["Email"].ToString();
                result.IsAdmin = (bool)r["AccessLevel"];
            }
            return result;
        }

        public List<Client> GetClient()
        {
            List<Client> result = new List<Client>();

            DAL d = new DAL(ConfigurationManager.ConnectionStrings["dbGroupProject"].ConnectionString);
            DataSet ds = d.ExecuteProcedure("spGetClientByID");

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                Client c = new Client();
                c.ClientID = int.Parse(row["ClientID"].ToString());
                c.FirstName = row["FirstName"].ToString();
                c.LastName = row["LastName"].ToString();
                c.Address = row["Address"].ToString();
                c.City = row["City"].ToString();
                c.PostalCode = row["PostalCode"].ToString();
                c.PhoneNumber = row["PhoneNumber"].ToString();
                c.UserName = row["UserName"].ToString();
                c.Email = row["Email"].ToString();
                c.IsAdmin = (bool)row["AccessLevel"];

                result.Add(c);
            }
            return result;
        }
    }

}
