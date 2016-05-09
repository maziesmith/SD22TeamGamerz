using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

namespace DAL_Project
{
    public class DAL
    {
        public string ConnString; 
        List<SqlParameter> _parameters;

        public DAL(string connString)
        {
            ConnString = connString; // Set the internal variable ConnString to the value of the user chosen value connString
            _parameters = new List<SqlParameter>(); // initialize our list of parameters to 0
        }

        /// <summary>
        /// Pass the parameter name first Example: "@FirstName"
        /// Pass the value for the value next: "Scott"
        /// </summary>
        public void AddParam(string paramName, object paramValue)
        {
            _parameters.Add(new SqlParameter(paramName, paramValue)); // create a new SqlParameter object with the use chosen values, add it to the internal list of parameters
        }

        public DataSet ExecuteProcedure(string ProcName)
        {
            DataSet dsResult = new DataSet();

            SqlConnection conn = new SqlConnection(ConnString);
            SqlDataAdapter da = new SqlDataAdapter(ProcName, conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            foreach (SqlParameter parameter in _parameters)
            {
                da.SelectCommand.Parameters.Add(parameter);
            }

            conn.Open();
            da.Fill(dsResult);
            conn.Close();

            ClearParams();

            return dsResult;
        }

        public void ClearParams()
        {
            _parameters = new List<SqlParameter>();
        }
    }
}
