using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;

namespace GPClassLibrary
{
    public class Console
    {
        public int ConsoleID { get; set; }
        public string ConsoleName { get; set; }
        public string ConsoleImage { get; set; }

        public Console() { }

        public Console(int ConsoleID)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbGroupProject"].ConnectionString;
            DAL_Project.DAL d = new DAL_Project.DAL(connStr);
            d.AddParam("CategoryID", ConsoleID);
            DataSet ds = d.ExecuteProcedure("spGetConsoleByID");
        }
    }
}
