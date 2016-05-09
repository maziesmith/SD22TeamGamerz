using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;

namespace GPClassLibrary
{
    public class Game
    {
        public int GameID { get; set; }
        public string GameName { get; set; }
        public string GameImage { get; set; }
        public int GameRating { get; set; }
        public int CategoryID { get; set; }
        public int ConsoleID { get; set; }

        public static List<Game> GetGamesByCategoryID(int? GameID)
        {
            List<Game> listResults = new List<Game>();

            DAL_Project.DAL d = new DAL_Project.DAL(ConfigurationManager.ConnectionStrings["dbGroupProject"].ConnectionString);

            if (GameID != null)
            {
                d.AddParam("GameID", GameID);
            }

            DataSet ds = d.ExecuteProcedure("spGetGameByCategoryID");

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                listResults.Add(GetGameFromDataRow(row));
            }

            return listResults;
        }

        private static Game GetGameFromDataRow(DataRow row)
        {
            Game g = new Game();
            g.GameID = int.Parse(row["GameID"].ToString());
            g.CategoryID = int.Parse(row["CategoryID"].ToString());
            g.ConsoleID = int.Parse(row["ConsoleID"].ToString());
            g.GameName = row["GameName"].ToString();
            g.GameImage = row["GameImage"].ToString());
            g.GameRating = int.Parse(row["GameRating"].ToString());

            return g;
        }

    }
}
