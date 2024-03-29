﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using DAL_Project;

namespace GPClassLibrary
{
    public class Game
    {
        //private static string connString = "Data Source=(local);Initial Catalog=dbSD22GroupProject;Integrated Security=SSPI";
        public int GameID { get; set; }
        public string GameName { get; set; }
        public string GameImage { get; set; }
        public int GameRating { get; set; }
        public int CategoryID { get; set; }
        public int ConsoleID { get; set; }
        public string CategoryName { get; set; }
        public string ConsoleName { get; set; }

        public static List<Game> GetGamesByCategoryID(int? CategoryID)
        {
            List<Game> listResults = new List<Game>();

            DAL d = new DAL(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            d.AddParam("CategoryID", CategoryID);

            //if (CategoryID != null)
            //{
            //d.AddParam("GameID", CategoryID);
            //}

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
            g.GameImage = row["GameImage"].ToString();
            g.GameRating = int.Parse(row["GameRating"].ToString());
            g.CategoryName = row["CategoryName"].ToString();
            g.ConsoleName = row["ConsoleName"].ToString();

            return g;
        }

        public static List<Game> GetGamesByConsoleName(string ConsoleName)
        {
            List<Game> listResults = new List<Game>();

            DAL d = new DAL(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            d.AddParam("ConsoleName", ConsoleName);

            DataSet ds = d.ExecuteProcedure("spGetGameByConsoleName");

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                listResults.Add(GetGameFromDataRow(row));
            }

            return listResults;
        }

        public static List<Game> GetGamesByConsoleName(string ConsoleName, string GameName)
        {
            List<Game> listResults = new List<Game>();

            DAL d = new DAL(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            switch (ConsoleName)
            {
                case null:
                    break;
                default:
                    d.AddParam("ConsoleName", ConsoleName);
                    break;
            }
            switch (GameName)
            {
                case null:
                    break;
                default:
                    d.AddParam("GameName", GameName);
                    break;
            }
            

            DataSet ds = d.ExecuteProcedure("spQuickSearch");

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                listResults.Add(GetGameFromDataRow(row));
            }

            return listResults;
        }

        public static List<Game> GetAllGames()
        {
            List<Game> listResults = new List<Game>();

            DAL d = new DAL(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            DataSet ds = d.ExecuteProcedure("spGetGameByConsoleName");

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                listResults.Add(GetGameFromDataRow(row));
            }

            return listResults;
        }

        //public List<Game> SearchGames(string GameName, int ConsoleID)
        //{
        //    List<Game> listResults = new List<Game>();

        //    DAL d = new DAL(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

        //    d.AddParam("GameName", GameName);
        //    d.AddParam("ConsoleID", ConsoleID);
        //    DataSet ds = d.ExecuteProcedure("spQuickSearch");

        //    foreach (DataRow row in ds.Tables[0].Rows)
        //    {
        //        listResults.Add(GetGameFromDataRow(row));
        //    }

        //    return listResults;
        //}

        public static List<Game> GetGameByID(string GameID)
        {
            List<Game> listResults = new List<Game>();

            DAL d = new DAL(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            d.AddParam("GameID", GameID);
            DataSet ds = d.ExecuteProcedure("spGetGameByID");
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                listResults.Add(GetGameFromDataRow(row));
            }

            return listResults;
        }

        public string InsertGame(string GameName, string GameImage, string GameRating, int CategoryID, int ConsoleID)
        {
            DAL d = new DAL(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            d.AddParam("GameName", GameName);
            d.AddParam("GameImage", GameImage);
            d.AddParam("GameRating", GameRating);
            d.AddParam("CategoryID", CategoryID);
            d.AddParam("ConsoleID", ConsoleID);
            DataSet ds = d.ExecuteProcedure("spInsertGame");
            string newGameID = ds.Tables[0].Rows[0]["NewGameID"].ToString();
            return newGameID;
        }
    }
}
