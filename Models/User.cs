using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace LawDesk.Models
{
    public class User
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string Title { get; set; }
        public string Surname { get; set; }
        public string Firstname { get; set; }
        public string Middlename { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string Email { get; set; }
        public string UserType { get; set; }
        public string YearOfCall { get; set; }
        public string Phone { get; set; }
        public string WorkPhone { get; set; }
        public string Address { get; set; }
        public string DoB { get; set; }
        public string StaffID { get; set; }
        public string Nok_Fullname { get; set; }
        public string Nok_Relationship { get; set; }
        public string Nok_Phone { get; set; }
        public string Nok_Email { get; set; }
        public string Nok_Address { get; set; }
        public string Status { get; set; }
        public string Logs { get; set; }
        public string DateAdded { get; set; }
        public string Password { get; set; }
        public string RoleID { get; set; }
        public string TaskLoad { get; set; }
        public string ProfilePicUrl { get; set; }
        public bool Exists { get; set; }
        public string ExecutionError = "";

        DB db = new DB();
        public User()
        {

        }

        public User(string user)
        {
            Username = user;
            DataTable userTable = db.ReadTable("Users", String.Format("SELECT * FROM Users WHERE Username='{0}'", Username));
            //DataTable userTable = db.ReadTable("Users", String.Format("SELECT * FROM Users WHERE AccountID='{0}'", _username));
            if (userTable.Rows.Count > 0)
            {
                Username = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Username"]);
                Title = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Title"]);
                Surname = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Surname"]);
                Firstname = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Firstname"]);
                Middlename = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Middlename"]);
                Name = Title + " " + Surname + " " + Firstname + " " + Middlename;
                Gender = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Gender"]);
                Email = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Email"]);
                UserType = AppHandler.IgnoreDBNullString(userTable.Rows[0]["UserType"]);
                YearOfCall = AppHandler.IgnoreDBNullString(userTable.Rows[0]["YearOfCall"]);
                Phone = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Phone"]);
                WorkPhone = AppHandler.IgnoreDBNullString(userTable.Rows[0]["WorkPhone"]);
                Address = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Address"]);
                StaffID = AppHandler.IgnoreDBNullString(userTable.Rows[0]["StaffID"]);
                Nok_Fullname = AppHandler.IgnoreDBNullString(userTable.Rows[0]["NoK_Fullname"]);
                Nok_Relationship = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Nok_Relationship"]);
                Nok_Phone = AppHandler.IgnoreDBNullString(userTable.Rows[0]["NoK_Phone"]);
                Nok_Email = AppHandler.IgnoreDBNullString(userTable.Rows[0]["NoK_Email"]);
                Nok_Address = AppHandler.IgnoreDBNullString(userTable.Rows[0]["NoK_Address"]);
                Status = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Status"]);
                Logs = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Logs"]);
                DateAdded = AppHandler.IgnoreDBNullString(userTable.Rows[0]["DateAdded"]);
                RoleID = AppHandler.IgnoreDBNullString(userTable.Rows[0]["RoleID"]);
                TaskLoad = AppHandler.IgnoreDBNullString(userTable.Rows[0]["TaskLoad"]);
                ProfilePicUrl = AppHandler.IgnoreDBNullString(userTable.Rows[0]["ProfilePicUrl"]);
                Exists = true;
            }
            else if (db.DBError.Length > 0)
            {
                ExecutionError = db.DBError;
            }
        }

        public User(string user, string pswd)
        {
            Username = user;
            Password = pswd;
            db.DBError = "";
            ExecutionError = "";
            DataTable userTable = db.ReadTable("Users", String.Format("SELECT DISTINCT * FROM Users WHERE (Username='{0}' or Email='{0}') AND Password='{1}'", Username, AppHandler.Sha1(Password)));
            //DataTable userTable = db.ReadTable("Users", String.Format("SELECT DISTINCT * FROM Users WHERE AccountID='{0}' AND Password='{1}'", _username, AppHandler.Sha1(_password)));
            if (userTable.Rows.Count > 0)
            {
                Username = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Username"]);
                Title = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Title"]);
                Surname = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Surname"]);
                Firstname = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Firstname"]);
                Middlename = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Middlename"]);
                Name = Title + " " + Surname + " " + Firstname + " " + Middlename;
                Gender = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Gender"]);
                Email = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Email"]);
                UserType = AppHandler.IgnoreDBNullString(userTable.Rows[0]["UserType"]);
                YearOfCall = AppHandler.IgnoreDBNullString(userTable.Rows[0]["YearOfCall"]);
                Phone = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Phone"]);
                WorkPhone = AppHandler.IgnoreDBNullString(userTable.Rows[0]["WorkPhone"]);
                Address = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Address"]);
                StaffID = AppHandler.IgnoreDBNullString(userTable.Rows[0]["StaffID"]);
                Nok_Fullname = AppHandler.IgnoreDBNullString(userTable.Rows[0]["NoK_Fullname"]);
                Nok_Relationship = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Nok_Relationship"]);
                Nok_Phone = AppHandler.IgnoreDBNullString(userTable.Rows[0]["NoK_Phone"]);
                Nok_Email = AppHandler.IgnoreDBNullString(userTable.Rows[0]["NoK_Email"]);
                Nok_Address = AppHandler.IgnoreDBNullString(userTable.Rows[0]["NoK_Address"]);
                Status = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Status"]);
                Logs = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Logs"]);
                DateAdded = AppHandler.IgnoreDBNullString(userTable.Rows[0]["DateAdded"]);
                RoleID = AppHandler.IgnoreDBNullString(userTable.Rows[0]["RoleID"]);
                TaskLoad = AppHandler.IgnoreDBNullString(userTable.Rows[0]["TaskLoad"]);
                ProfilePicUrl = AppHandler.IgnoreDBNullString(userTable.Rows[0]["ProfilePicUrl"]);
                Exists = true;
            }
            else if (db.DBError.Length > 0)
            {
                ExecutionError = db.DBError;
            }
        }
        //Methods
        //public bool Add()
        //{
        //    string strQuery = String.Format("INSERT INTO [Users]([Name],[Username],[Email],[Phone],[Department],[StaffID],[Password],[UserType],[Status],[Logs],[DateAdded],AccountID,AccountType) " +
        //    "VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', 0, 0, '{8}')", Name, Username, Email, _phoneNos, _department, _staffID, AppHandler.Sha1(_password), _usertype, _date_added, AccountID, AccountType);
        //    try
        //    {
        //        return db.ExecuteQuery(strQuery);
        //    }
        //    catch (Exception ex)
        //    {
        //        ExecutionError = ex.Message;
        //    }
        //    return false;
        //}

        public bool ChangePassword(string pswd)
        {
            return db.ExecuteQuery("UPDATE Users SET Password='" + AppHandler.Sha1(pswd) + "' WHERE Username='" + Username + "'");
        }

        public bool DoLogin()
        {
            bool loggedIn = false;
            try
            {
                DataTable userTable = db.ReadTable("Users", String.Format("SELECT FirstName FROM Users WHERE Username='{0}' AND Password='{1}'", Username, AppHandler.Sha1(Password)));
                loggedIn = userTable.Rows.Count > 0;
            }
            catch (Exception ex)
            {
                ExecutionError = ex.Message;
            }
            return loggedIn;
        }

        public void UpdateLogin(string logType = "login")
        {
            string strQuery = String.Format("UPDATE [Users] SET [Status]=1, Logs=Logs+1 WHERE [Username]='{0}'", Username);
            if (logType != "login") strQuery = String.Format("UPDATE [Users] SET [Status]=0 WHERE [Username]='{0}'", Username);
            try
            {
                db.ExecuteQuery(strQuery);
            }
            catch (Exception ex)
            {
                ExecutionError = ex.Message;
            }
        }

        public bool Delete()
        {
            try
            {
                db.ExecuteQuery("DELETE FROM [Users] WHERE [Username]='" + Username + "'");
            }
            catch (Exception ex)
            {
                ExecutionError = ex.Message;
                return false;
            }
            return true;
        }


    }
}