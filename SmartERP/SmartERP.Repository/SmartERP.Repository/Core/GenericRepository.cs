using Dapper;
using SmartERP.Entity.Interface;
using SmartERP.Entity.Model.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace SmartERP.Repository.Core
{
    public class GenericRepository<T> : IBase<T>
        where T : BaseEntity
    {
        string errorMessage = string.Empty;

        string _SPDML = "SP_DML_";
        string tablename = "";

        public GenericRepository()
        {
            _SPDML = _SPDML + typeof(T).Name;
            tablename = typeof(T).Name;
        }

        public GenericRepository(string table)
        {
            tablename = table;
            _SPDML = _SPDML + table;
        }
        public virtual List<T> GetAll()
        {
            using (SqlConnection conn = ConnectionMangement.GetOpenConnection())
            {
                List<T> listobjects = conn.Query<T>(_SPDML, new { action = "SELECTALL" }, commandType: System.Data.CommandType.StoredProcedure).ToList();
                ConnectionMangement.CloseConnection(conn);
                return listobjects;
            }

        }
        public virtual T Get(int id)
        {

            using (SqlConnection conn = ConnectionMangement.GetOpenConnection())
            {
                T obj = conn.Query<T>(_SPDML, new { action = "SELECT", id = id }, commandType: System.Data.CommandType.StoredProcedure).FirstOrDefault();
                ConnectionMangement.CloseConnection(conn);
                return obj;
            }
        }
        public virtual int Insert(T obj)
        {
            using (SqlConnection conn = ConnectionMangement.GetOpenConnection())
            {
                using (SqlTransaction trans = conn.BeginTransaction())
                {
                    var retVal = conn.Query<int>(_SPDML, obj, trans, commandType: System.Data.CommandType.StoredProcedure).FirstOrDefault();
                    trans.Commit();
                    return retVal;
                }

            }

        }

        public virtual bool Update(T obj)
        {

            using (SqlConnection conn = ConnectionMangement.GetOpenConnection())
            {
                using (SqlTransaction trans = conn.BeginTransaction())
                {
                    var retVal = conn.Query<int>(_SPDML, obj, trans, commandType: System.Data.CommandType.StoredProcedure).FirstOrDefault();
                    trans.Commit();
                    return (retVal == obj.Id);
                }

            }


        }
        public virtual bool Delete(T obj)
        {
            using (SqlConnection conn = ConnectionMangement.GetOpenConnection())
            {
                using (SqlTransaction trans = conn.BeginTransaction())
                {
                    var retVal = conn.Query<int>(_SPDML, new { action = "DELETE", id = obj.Id }, trans, commandType: System.Data.CommandType.StoredProcedure).FirstOrDefault();
                    trans.Commit();
                    return (retVal == obj.Id);
                }

            }
        }

        public virtual IEnumerable<dynamic> GetDropDownList(string DropdownName = "DROPDOWN")
        {

            using (SqlConnection conn = ConnectionMangement.GetOpenConnection())
            {
                IEnumerable<dynamic> results = null;
                results = conn.Query<dynamic>(_SPDML, new { action = DropdownName }, commandType: System.Data.CommandType.StoredProcedure).ToList();
                ConnectionMangement.CloseConnection(conn);
                return results;
            }
  
        }
    }
}



