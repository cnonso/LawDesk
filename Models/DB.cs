using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections;

namespace LawDesk.Models
{
    /// <summary>
    /// Summary description for DB
    /// </summary>
    public class DB
    {
        private SqlConnection serverConnector = new SqlConnection();
        public string DBError;
        public DB()
        {
            serverConnector = new SqlConnection(WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        }
         
        public DataTable GetTableColumns(string tableName)
        {

            return ReadTable(tableName + "Columns", "select * from information_schema.columns where table_name = '" + tableName + "'");
        }
        public int InsertData(string table, string[] fields, object[] values)
        {
            int resultId = -1;
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                DBError = ex.Message;
                return -1;
            }
            SqlCommand insertCmd = serverConnector.CreateCommand();
            SqlTransaction transaction = serverConnector.BeginTransaction();
            string strValues = "VALUES(";
            string strQuery = "INSERT INTO [" + table + "] (";
            foreach (string fld in fields)
            {
                strQuery += "[" + fld + "],";
                strValues += "@" + fld.Replace(" ", "") + ",";
            }
            strQuery = strQuery.Trim(',') + ") " + strValues.Trim(',') + ") SET @Identity = SCOPE_IDENTITY()";

            insertCmd.Connection = serverConnector;
            insertCmd.Transaction = transaction;
            insertCmd.CommandText = strQuery;
            SqlParameter identityParam = new SqlParameter("@Identity", SqlDbType.Int, 0, "TableID") { Direction = ParameterDirection.Output };
            int i = -1;
            foreach (string fld in fields)
            {
                insertCmd.Parameters.AddWithValue("@" + fld.Replace(" ", ""), values[++i]);
            }

            insertCmd.Parameters.Add(identityParam);
            bool added = insertCmd.ExecuteNonQuery() > 0;
            try
            {
                if (added)
                {
                    resultId = AppHandler.ToInt(identityParam.Value);
                    transaction.Commit();
                }
            }
            catch (Exception ex)
            {
                DBError = ex.Message;
            }
            if (!added) transaction.Rollback();
            serverConnector.Close();
            return resultId;
        }
        public bool UpdateData(string table, string[] fields, object[] values, string whereString)
        {
            bool updated = false;
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                DBError = ex.Message;
                return false;
            }
            SqlCommand updateCmd = serverConnector.CreateCommand();
            //SqlTransaction transaction = serverConnector.BeginTransaction();
            string strValues = "VALUES(";
            string strQuery = "UPDATE [" + table + "] SET ";
            for (int c = 0; c < fields.Length; c++)
            {
                strQuery += "[" + fields[c] + "]=@" + fields[c].Replace(" ", "") + ",";
            }
            strQuery = strQuery.Trim(',') + " WHERE " + whereString;
            updateCmd.Connection = serverConnector;
            //updateCmd.Transaction = transaction;
            updateCmd.CommandText = strQuery;

            int i = -1;
            foreach (string fld in fields)
            {
                updateCmd.Parameters.AddWithValue("@" + fld.Replace(" ", ""), values[++i]);
            }

            try
            {
                updated = updateCmd.ExecuteNonQuery() > 0;
            }
            catch (Exception ex)
            {
                DBError = ex.Message;
            }
            serverConnector.Close();
            return updated;
        }
        public string ReadData(string strQuery)
        {
            string result = string.Empty;
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                //AppHandler.MsgBox(ex.Message);
                DBError = ex.Message;
                return "";
            }
            SqlCommand sqlCmd = new SqlCommand(strQuery, serverConnector);
            SqlDataReader sdr = sqlCmd.ExecuteReader();
            if (sdr.Read())
                result = sdr.GetValue(0).ToString();
            sdr.Close();
            serverConnector.Close();
            return result;
        }
        public string ReadData(string strQuery, string[] fields, string[] values)
        {
            string result = string.Empty;
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                DBError = ex.Message;
                //AppHandler.MsgBox(ex.Message);
                return "";
            }
            SqlCommand sqlCmd = new SqlCommand(strQuery, serverConnector);
            int i = -1;
            foreach (string fld in fields)
            {
                sqlCmd.Parameters.AddWithValue("@" + fld.Replace(" ", ""), values[++i]);
            }
            SqlDataReader sdr = sqlCmd.ExecuteReader();
            if (sdr.Read())
                result = sdr.GetValue(0).ToString();
            sdr.Close();
            serverConnector.Close();
            return result;
        }


        public DataTable ReadTable(string tableName, string customQuery, string[] fields, string[] values)
        {
            DataTable tableData = new DataTable(tableName);
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                DBError = ex.Message;
                return tableData;
            }
            SqlCommand sqlCmd = new SqlCommand(customQuery, serverConnector);
            int i = -1;
            foreach (string fld in fields)
            {
                sqlCmd.Parameters.AddWithValue("@" + fld.Replace(" ", ""), values[++i]);
            }
            sqlCmd.CommandTimeout = 0;
            tableData.Load(sqlCmd.ExecuteReader());
            serverConnector.Close();
            return tableData;
        }
        public DataTable ReadTable(string tableName)
        {
            DataTable tableData = new DataTable(tableName);
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                //AppHandler.MsgBox(ex.Message);
                DBError = ex.Message;
                return tableData;
            }
            SqlCommand sqlCmd = new SqlCommand("SELECT * FROM " + tableName + "", serverConnector);
            sqlCmd.CommandTimeout = 0;
            tableData.Load(sqlCmd.ExecuteReader());
            serverConnector.Close();
            return tableData;
        }

        public DataTable ReadTable(string tableName, string customQuery)
        {
            DataTable tableData = new DataTable(tableName);
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                //AppHandler.MsgBox(ex.Message);
                DBError = ex.Message;
                return tableData;
            }
            SqlCommand sqlCmd = new SqlCommand(customQuery, serverConnector);
            sqlCmd.CommandTimeout = 0;
            tableData.Load(sqlCmd.ExecuteReader());
            serverConnector.Close();
            return tableData;
        }

        public bool ExecuteQuery(string query)
        {
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex) { return false; }
            SqlCommand sqlCmd = new SqlCommand(query, serverConnector);
            sqlCmd.CommandTimeout = 0;
            bool executed = sqlCmd.ExecuteNonQuery() > 0;
            serverConnector.Close();
            return executed;
        }

        public bool BatchExecution(string query)
        {
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex) { }
            SqlCommand sqlCmd = new SqlCommand(query, serverConnector);
            sqlCmd.CommandTimeout = 0;
            return sqlCmd.ExecuteNonQuery() > 0;
        }

        public void StopBatchExecution()
        {
            try
            {
                serverConnector.Close();
            }
            catch (Exception ex) { }
        }  
        public bool CreateTableFromAnotherDbTable(string sourceDB, string sourceTable, string destDB, string destTable)
        {
            try
            {
                if (ExecuteQuery("SELECT * INTO [" + destDB + "].[dbo].[" + destTable + "] FROM [" + sourceDB + "].[dbo].[" + sourceTable + "]")) ;
                return true;
            }
            catch (Exception ex) { }
            return false;
        }

        public bool BackupDB(string dest)
        {
            return ExecuteQuery("BACKUP DATABASE " + serverConnector.Database + " TO disk = '" + dest + "'");
        }

        public void DeleteAllTables()
        {
            ExecuteQuery("EXEC sp_MSforeachtable @command1 = \"DROP TABLE ?\"");
        }

        public DataTable SortDataTable(DataTable table, string columnName, string order)
        {
            table.DefaultView.Sort = columnName + " " + order;
            table = table.DefaultView.ToTable();
            return table;
        }
        /** -----------------------------------   FROM VB TO C# ------------------------------------------------*/
        public string InsertInfo(string CheckString, params string[] SqlString)
        {
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                DBError = ex.Message;
                return "False";
            }
            SqlCommand MyCommand = new SqlCommand();
            SqlCommand CheckCommand = new SqlCommand();

            MyCommand = serverConnector.CreateCommand();
            CheckCommand = serverConnector.CreateCommand();
            CheckCommand.CommandText = CheckString;
            CheckCommand.CommandType = CommandType.Text;

            if (CheckString.Length != 0)
            {
                try
                {
                    if ((CheckCommand.ExecuteScalar() + "") != "")
                        throw new Exception("Data already added to Database");
                }
                catch (Exception ex)
                {
                    serverConnector.Close();
                    throw ex;
                    return "False";
                }
            }

            SqlTransaction MyTrans = serverConnector.BeginTransaction();
            MyCommand.Transaction = MyTrans;

            foreach (string sql in SqlString)
            {
                MyCommand.CommandText = sql;
                MyCommand.CommandType = CommandType.Text;
                try
                {
                    MyCommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MyTrans.Rollback();
                    serverConnector.Close();
                    throw ex;
                    MyCommand.Dispose();
                    return "False";
                }

            }
            MyTrans.Commit();

            MyCommand.Dispose();
            CheckCommand.Dispose();
            serverConnector.Close();
            return "True";
        }

        public SqlDataReader GetDataReader(string SqlString)
        {
            SqlCommand MyCommand = new SqlCommand(SqlString, serverConnector);
            MyCommand.CommandType = CommandType.Text;

            try
            {
                SqlDataReader sdr = MyCommand.ExecuteReader();
                return sdr;
                serverConnector.Close();
            }
            catch (Exception ex)
            {
                serverConnector.Close();
                throw ex;
            }
        }

        public DataSet GetDataSet(string SqlString, params string[] TableNames)
        {
            DataSet dataSet = new DataSet();
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                throw ex;
                return null;
            }
            char[] delimiters = { ';' };
            string[] parts = SqlString.Split(delimiters);
            IEnumerator iPart;
            iPart = parts.GetEnumerator();

            int i = 0;
            try
            {
                while (iPart.MoveNext())
                {
                    SqlDataAdapter MyAdapter = new SqlDataAdapter(iPart.Current.ToString(), serverConnector);
                    MyAdapter.Fill(dataSet, TableNames[i]);

                    DataColumn dtCol = dataSet.Tables[TableNames[i]].Columns[0];
                    try
                    {
                        dtCol.AutoIncrement = true;
                    }
                    catch (Exception ex)
                    {
                        //'Ignore the error
                    }

                    i += 1;
                }
                serverConnector.Close();
                return dataSet;

            }
            catch (Exception ex)
            {
                throw ex;
                serverConnector.Close();
                return null;
            }
        }
        public void UpdateDataSet(DataSet DataInfo, params string[] TableNames)
        {
            //'Using Scope = new  Transactions.TransactionScope

            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                throw ex;
                return;
            }
            SqlDataAdapter MyAdapter = new SqlDataAdapter();
            SqlTransaction MyTrans = serverConnector.BeginTransaction();

            try
            {
                foreach (string table in TableNames)
                {
                    MyAdapter.InsertCommand = BuildInsertCommand(DataInfo.Tables[table]);
                    MyAdapter.UpdateCommand = BuildUpdateCommand(DataInfo.Tables[table]);
                    MyAdapter.DeleteCommand = BuildDeleteCommand(DataInfo.Tables[table]);
                    MyAdapter.InsertCommand.Transaction = MyTrans;
                    MyAdapter.UpdateCommand.Transaction = MyTrans;
                    MyAdapter.DeleteCommand.Transaction = MyTrans;
                    int x = MyAdapter.Update(DataInfo.Tables[table]);
                }
                MyTrans.Commit();
                //'Scope.Complete()
            }
            catch (Exception ex)
            {
                throw ex;
                MyTrans.Rollback();
            }
            finally
            {
                MyAdapter.Dispose();
                serverConnector.Close();
            }
            //'Scope.Dispose()
            //'End Using
        }

        private SqlCommand BuildDeleteCommand(DataTable Data)
        {
            SqlCommand NewCmd = new SqlCommand();
            NewCmd.Connection = serverConnector;

            string Identity = "";
            foreach (DataColumn Col in Data.Columns)
            {
                if (Col.AutoIncrement)
                    Identity = Col.ColumnName + " = @" + Col.ColumnName;

                SqlParameter Param = new SqlParameter();
                Param.ParameterName = "@" + Col.ColumnName;
                Param.SourceColumn = Col.ColumnName;
                NewCmd.Parameters.Add(Param);
                break;
            }

            string CmdText = "DELETE FROM " + Data.TableName + " WHERE " + Identity;
            NewCmd.CommandText = CmdText;

            return NewCmd;
        }

        private SqlCommand BuildUpdateCommand(DataTable Data)
        {
            SqlCommand NewCmd = new SqlCommand();
            NewCmd.Connection = serverConnector;
            string SetString = "";
            string Identity = "";
            foreach (DataColumn Col in Data.Columns)
            {
                string CorrectedColName = Col.ColumnName.Replace(" ", "");

                if (Col.AutoIncrement)
                    Identity = Col.ColumnName + " = @" + CorrectedColName;
                else
                {
                    if (!(SetString == string.Empty))
                        SetString += ", ";

                    SetString += "[" + Col.ColumnName + "]" + " = @" + CorrectedColName;
                }
                SqlParameter Param = new SqlParameter();
                Param.ParameterName = "@" + CorrectedColName;
                Param.SourceColumn = Col.ColumnName;
                NewCmd.Parameters.Add(Param);
            }
            string CmdText = "UPDATE " + Data.TableName + " SET " + SetString + " WHERE " + Identity;
            NewCmd.CommandText = CmdText;
            return NewCmd;
        }

        private SqlCommand BuildInsertCommand(DataTable Data)
        {
            SqlCommand NewCmd = new SqlCommand();
            NewCmd.Connection = serverConnector;
            string Fields = "";
            string Values = "";
            string Identity = "";

            foreach (DataColumn Col in Data.Columns)
            {
                string CorrectedColName = Col.ColumnName.Replace(" ", "");

                if (Col.AutoIncrement)
                    Identity = "SELECT @@IDENTITY AS " + Col.ColumnName;
                else
                {
                    if (!(Fields == string.Empty))
                        Fields += ", ";

                    Fields += "[" + Col.ColumnName + "]";

                    if (!(Values == string.Empty))
                        Values += ", ";

                    Values += "@" + CorrectedColName;

                    SqlParameter Param = new SqlParameter();
                    Param.ParameterName = "@" + CorrectedColName;
                    Param.SourceColumn = Col.ColumnName;
                    NewCmd.Parameters.Add(Param);
                }
            }
            string CmdText = "INSERT INTO " + Data.TableName + "(" + Fields + ") VALUES(" + Values + ")";
            if (Identity != string.Empty)
                CmdText += ";" + Identity;
            NewCmd.CommandText = CmdText;
            return NewCmd;
        }
    }
}