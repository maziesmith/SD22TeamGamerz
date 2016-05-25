using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL_Project;
using System.Configuration;
using System.Data;

namespace GPClassLibrary
{
    public class AdsClass
    {
        public int AdsID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int GameID { get; set; }


        public void GetAds()
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            d.AddParam("AdsID", AdsID);
            DataSet ds = d.ExecuteProcedure("spGetAds");
        }

        public void InsertAds(string Title, string Description, int GameID, int ClientID)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            d.AddParam("AdsTitle", Title);
            d.AddParam("AdsDesc", Description);
            d.AddParam("GameID", GameID);
            d.AddParam("ClientID", ClientID);
            DataSet ds = d.ExecuteProcedure("spInsertAds");
            this.AdsID = Convert.ToInt32(ds.Tables[0].Rows[0]["NewAdsID"].ToString());
        }
    }
}
