using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using Dapper;
using System.Data;

namespace SmartERP.Repository
{
    public static class ConnectionMangement
    {

        public static SqlConnection GetOpenConnection()
        {
            SqlConnection Cn = new SqlConnection();
            try
            {
                Cn.ConnectionString = ConfigurationManager.ConnectionStrings["SmartDBConn"].ConnectionString;
                Cn.Open();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            return Cn;
        }
        public static void CloseConnection(SqlConnection Connection)
        {
            Connection.Close();
        }

        public static bool ExecuteProcedure(string procedureName, List<SqlParameter> paramList = null)
        {
            try
            {
                using (SqlConnection conn = GetOpenConnection())
                {
                    DynamicParameters dp = new DynamicParameters();
                    if (paramList != null)
                        foreach (SqlParameter sp in paramList)
                            dp.Add(sp.ParameterName, sp.SqlValue, sp.DbType);
                    conn.Open();
                    return conn.Execute(procedureName, dp, commandType: CommandType.StoredProcedure) > 0;
                }
            }
            catch (Exception e)
            {
                //do logging
                return false;
            }
        }
    }
}
