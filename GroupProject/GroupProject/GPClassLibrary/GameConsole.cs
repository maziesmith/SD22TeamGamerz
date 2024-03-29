﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;

namespace GPClassLibrary
{
    public class GameConsole
    {
        public int ConsoleID { get; set; }
        public string ConsoleName { get; set; }
        public string ConsoleImage { get; set; }

        public GameConsole()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            DAL_Project.DAL d = new DAL_Project.DAL(connStr);
            DataSet ds = d.ExecuteProcedure("spGetConsoleByID");
        }

        public GameConsole(int ConsoleID)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            DAL_Project.DAL d = new DAL_Project.DAL(connStr);
            d.AddParam("CategoryID", ConsoleID);
            DataSet ds = d.ExecuteProcedure("spGetConsoleByID");
        }
        public void InsertConsole(string ConsoleName, string ConsoleImage)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            DAL_Project.DAL d = new DAL_Project.DAL(connStr);
            d.AddParam("ConsoleName", ConsoleName);
            d.AddParam("ConsoleImage", ConsoleImage);
            DataSet ds = d.ExecuteProcedure("spInsertConsole");
           this.ConsoleID = Convert.ToInt32(ds.Tables[0].Rows[0]["NewConsoleID"].ToString());
        }

        public static List<GameConsole> GetAllConsoles()
        {
            List<GameConsole> resultList = new List<GameConsole>();

            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            DAL_Project.DAL d = new DAL_Project.DAL(connStr);
            DataSet ds = d.ExecuteProcedure("spGetConsoleByID");

            foreach (DataRow console in ds.Tables[0].Rows)
            {
                GameConsole newConsole = new GameConsole()
                {
                    ConsoleID = int.Parse(console["ConsoleID"].ToString()),
                    ConsoleName = console["ConsoleName"].ToString()
                };

                resultList.Add(newConsole);
            }

            return resultList;
        }
    }
}
