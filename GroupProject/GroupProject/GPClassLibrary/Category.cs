using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;

namespace GPClassLibrary
{
    public class Category
    {
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }

        public Category() { }

        public Category(int CategoryID)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            DAL_Project.DAL d = new DAL_Project.DAL(connStr);
            d.AddParam("CategoryID", CategoryID);
            DataSet ds = d.ExecuteProcedure("spGetCategoryByID");
        }

        public static List<Category> GetAllCategories()
        {
            List<Category> resultList = new List<Category>();

            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            DAL_Project.DAL d = new DAL_Project.DAL(connStr);
            DataSet ds = d.ExecuteProcedure("spGetCategoryByID");

            foreach (DataRow category in ds.Tables[0].Rows)
            {
                Category newCategory = new Category()
                {
                    CategoryID = int.Parse(category["CategoryID"].ToString()),
                    CategoryName = category["Name"].ToString()
                };

                resultList.Add(newCategory);
            }
            return resultList;
        }
    }

}
