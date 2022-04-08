using Microsoft.Extensions.Configuration;
using Pizzeria.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using static Pizzeria.Model.Enums;

namespace Pizzeria.DataAccess
{
    public class DatabaseHelper
    {
        private readonly string connectionString;

        /// <summary>
        /// Initializes a new instance of the <see cref="DatabaseHelper"/> class.
        /// </summary>
        /// <param name="configuration">The configuration.</param>
        public DatabaseHelper(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("PizzeriaEntities");
        }

        /// <summary>
        /// Executes the non query.
        /// </summary>
        /// <param name="cmdText">The command text.</param>
        /// <param name="paramList">The parameter list.</param>
        /// <returns></returns>
        public ResultWrapperModel ExecuteNonQuery(string cmdText, Dictionary<string, string> paramList)
        {
            var wrapper = new ResultWrapperModel();
            var conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();

                using (var cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = cmdText;
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (paramList.Count > 0)
                    {
                        foreach (var item in paramList)
                        {
                            cmd.Parameters.Add(new SqlParameter(item.Key, item.Value));
                        }
                    }

                    int n = cmd.ExecuteNonQuery();
                    wrapper.ResponseType = n > 0 ? ResponseType.Success : ResponseType.Error;
                }
            }
            catch (Exception ex)
            {
                wrapper.CaughtException = ex;
                wrapper.ResponseType = ResponseType.Error;
            }
            finally
            {
                conn.Close();
            }

            return wrapper;
        }

        /// <summary>
        /// Executes the scalar.
        /// </summary>
        /// <param name="cmdText">The command text.</param>
        /// <param name="paramList">The parameter list.</param>
        /// <returns></returns>
        public ResultWrapperModel ExecuteScalar(string cmdText, Dictionary<string, string> paramList)
        {
            var wrapper = new ResultWrapperModel();
            var conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();

                using (var cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = cmdText;
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (paramList.Count > 0)
                    {
                        foreach (var item in paramList)
                        {
                            cmd.Parameters.Add(new SqlParameter(item.Key, item.Value));
                        }
                    }

                    var obj = cmd.ExecuteScalar();

                    wrapper.ResultSet = obj;
                    wrapper.ResponseType = obj != null ? ResponseType.Success : ResponseType.Error;
                }
            }
            catch (Exception ex)
            {
                wrapper.CaughtException = ex;
                wrapper.ResponseType = ResponseType.Error;
            }
            finally
            {
                conn.Close();
            }

            return wrapper;
        }

        /// <summary>
        /// Gets the data list.
        /// </summary>
        /// <param name="cmdText">The command text.</param>
        /// <param name="model">The model.</param>
        /// <returns></returns>
        public ResultWrapperModel GetDataList(string cmdText, FilterModel model)
        {
            var wrapper = new ResultWrapperModel();
            var conn = new SqlConnection(connectionString);

            try
            {
                using (var cmd = new SqlCommand(cmdText, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (model != null)
                    {
                        cmd.Parameters.Add(new SqlParameter("@searchExpression", model.SearchExpression));
                        cmd.Parameters.Add(new SqlParameter("@sortExpression", model.SortExpression));
                        cmd.Parameters.Add(new SqlParameter("@sortDirection", model.SortDirection));
                        cmd.Parameters.Add(new SqlParameter("@startIndex", model.StartIndex));
                        cmd.Parameters.Add(new SqlParameter("@pageSize", model.PageSize));
                        cmd.Parameters.Add("@totalRecords", SqlDbType.Char, 500);
                        cmd.Parameters["@totalRecords"].Direction = ParameterDirection.Output;
                    }

                    conn.Open();

                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);

                    wrapper.ResultSet = dt;
                    wrapper.TotalCount = int.Parse(cmd.Parameters["@totalRecords"].Value + "");
                    wrapper.ResponseType = ResponseType.Success;
                }
            }
            catch (Exception ex)
            {
                wrapper.CaughtException = ex;
                wrapper.ResponseType = ResponseType.Error;
            }
            finally
            {
                conn.Close();
            }

            return wrapper;
        }

        /// <summary>
        /// Gets the dropdown list.
        /// </summary>
        /// <param name="mode">The mode.</param>
        /// <returns></returns>
        public ResultWrapperModel GetDropdownList(int mode)
        {
            var wrapper = new ResultWrapperModel();
            var conn = new SqlConnection(connectionString);

            try
            {
                using (var cmd = new SqlCommand("USP_GetDropdownList", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@mode", mode));

                    conn.Open();

                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);

                    wrapper.ResultSet = dt;
                    wrapper.ResponseType = ResponseType.Success;
                }
            }
            catch (Exception ex)
            {
                wrapper.CaughtException = ex;
                wrapper.ResponseType = ResponseType.Error;
            }
            finally
            {
                conn.Close();
            }

            return wrapper;
        }
    }
}
