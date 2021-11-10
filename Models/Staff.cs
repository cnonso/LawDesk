using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;

namespace LawDesk.Models
{
    public class Staff
    {
        private string mPhone;
        private string mEmail;



        [Key]
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
        public string ExecutionError { get; set; }
        public bool Exists { get; set; }
        DB db = new DB();
        public Staff()
        { }

        public Staff(int userID)
        {
            ExecutionError = "";
             DataTable staffTable = new DB().ReadTable("Staff", "Select * from Users where userID = '" + userID + "'");
            if (staffTable.Rows.Count > 0)
            {
                Username = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Username"]);
                Title = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Title"]);
                Surname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Surname"]);
                Firstname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Firstname"]);
                Middlename = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Middlename"]);
                Name = Title + " " + Surname + " " + Firstname + " " + Middlename;
                Gender = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Gender"]);
                Email = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Email"]);
                UserType = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["UserType"]);
                YearOfCall = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["YearOfCall"]);
                Phone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Phone"]);
                WorkPhone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["WorkPhone"]);
                Address = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Address"]);
                StaffID = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["StaffID"]);
                Nok_Fullname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Fullname"]);
                Nok_Relationship = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Nok_Relationship"]);
                Nok_Phone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Phone"]);
                Nok_Email = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Email"]);
                Nok_Address = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Address"]);
                Status = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Status"]);
                Logs = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Logs"]);
                DateAdded = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["DateAdded"]);
                RoleID = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["RoleID"]);
                TaskLoad = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["TaskLoad"]);
                ProfilePicUrl = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["ProfilePicUrl"]);
                Exists = true;
            }
            else if (db.DBError.Length > 0)
            {
                ExecutionError = db.DBError;
            }
        }
        public Staff(string phone)
        {
            this.mPhone = phone;
            ExecutionError = "";
            DataTable staffTable = new DB().ReadTable("Staff", "Select * from Users where Phone = '" + phone + "'");
            if (staffTable.Rows.Count > 0)
            {
                Username = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Username"]);
                Title = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Title"]);
                Surname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Surname"]);
                Firstname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Firstname"]);
                Middlename = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Middlename"]);
                Name = Title + " " + Surname + " " + Firstname + " " + Middlename;
                Gender = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Gender"]);
                Email = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Email"]);
                UserType = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["UserType"]);
                YearOfCall = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["YearOfCall"]);
                Phone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Phone"]);
                WorkPhone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["WorkPhone"]);
                Address = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Address"]);
                StaffID = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["StaffID"]);
                Nok_Fullname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Fullname"]);
                Nok_Relationship = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Nok_Relationship"]);
                Nok_Phone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Phone"]);
                Nok_Email = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Email"]);
                Nok_Address = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Address"]);
                Status = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Status"]);
                Logs = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Logs"]);
                DateAdded = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["DateAdded"]);
                RoleID = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["RoleID"]);
                TaskLoad = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["TaskLoad"]);
                ProfilePicUrl = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["ProfilePicUrl"]);
                Exists = true;
            }
            else if (db.DBError.Length > 0)
            {
                ExecutionError = db.DBError;
            }
        }
        public Staff(string email, string phone)
        {
            this.mPhone = phone;
            this.mEmail = email;
            ExecutionError = "";

            DataTable staffTable = new DB().ReadTable("Staff", "Select * from Users where Email = '" + email + "' or Phone = '" + phone + "'");
            if (staffTable.Rows.Count > 0)
            {
                Username = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Username"]);
                Title = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Title"]);
                Surname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Surname"]);
                Firstname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Firstname"]);
                Middlename = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Middlename"]);
                Name = Title + " " + Surname + " " + Firstname + " " + Middlename;
                Gender = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Gender"]);
                Email = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Email"]);
                UserType = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["UserType"]);
                YearOfCall = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["YearOfCall"]);
                Phone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Phone"]);
                WorkPhone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["WorkPhone"]);
                Address = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Address"]);
                StaffID = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["StaffID"]);
                Nok_Fullname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Fullname"]);
                Nok_Relationship = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Nok_Relationship"]);
                Nok_Phone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Phone"]);
                Nok_Email = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Email"]);
                Nok_Address = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Address"]);
                Status = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Status"]);
                Logs = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Logs"]);
                DateAdded = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["DateAdded"]);
                RoleID = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["RoleID"]);
                TaskLoad = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["TaskLoad"]);
                ProfilePicUrl = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["ProfilePicUrl"]);
                Exists = true;
            }
        
        }
        public Staff(string email, string phone, string password)
        {
            this.mPhone = phone;
            this.mEmail = email;
            ExecutionError = "";
            DataTable staffTable = new DB().ReadTable("Staff", "Select * from Users where (Email = '" + email + "' or Phone = '" + phone + "') and Password = '" + AppHandler.Sha1(password) + "'");
            if (staffTable.Rows.Count > 0)
            {
                Username = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Username"]);
                Title = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Title"]);
                Surname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Surname"]);
                Firstname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Firstname"]);
                Middlename = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Middlename"]);
                Name = Title + " " + Surname + " " + Firstname + " " + Middlename;
                Gender = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Gender"]);
                Email = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Email"]);
                UserType = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["UserType"]);
                YearOfCall = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["YearOfCall"]);
                Phone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Phone"]);
                WorkPhone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["WorkPhone"]);
                Address = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Address"]);
                StaffID = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["StaffID"]);
                Nok_Fullname = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Fullname"]);
                Nok_Relationship = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Nok_Relationship"]);
                Nok_Phone = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Phone"]);
                Nok_Email = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Email"]);
                Nok_Address = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["NoK_Address"]);
                Status = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Status"]);
                Logs = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["Logs"]);
                DateAdded = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["DateAdded"]);
                RoleID = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["RoleID"]);
                TaskLoad = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["TaskLoad"]);
                ProfilePicUrl = AppHandler.IgnoreDBNullString(staffTable.Rows[0]["ProfilePicUrl"]);
                Exists = true;
            }
            else if (db.DBError.Length > 0)
            {
                ExecutionError = db.DBError;
            }
        }
        public bool Add()
        {
            string strQuery = string.Format("INSERT INTO [Users]([Username],[Title],[Surname],[Firstname],[Middlename],[Name],[Gender],[Email],[UserType],[YearOfCall],[Phone], WorkPhone, Address,Nok_Fullname,Nok_Relationship,Nok_Phone,Nok_Email,Nok_Address,Status,Logs,DateAdded,RoleID,TaskLoad, password,ProfilePicUrl) " +
            "VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}','{23}','{24}')", Username, Title, Surname, Firstname, Middlename, Name, Gender, Email, UserType, YearOfCall, Phone, WorkPhone, Address, Nok_Fullname, Nok_Relationship, Nok_Phone, Nok_Email, Nok_Address, Status, Logs, DateAdded, RoleID, TaskLoad, AppHandler.Sha1(Password), ProfilePicUrl);
            return new DB().ExecuteQuery(strQuery);
        }
        public bool Update()
        {
            string query = "update users set " +
                " Title = '" + Title + "', " +
                " Surname = '" + Surname + "', " +
                " Firstname = '" + Firstname + "', " +
                " Middlename = '" + Middlename + "', " +
                " Gender = '" + Gender + "', " +
                " YearOfCall = '" + YearOfCall + "', " +
                " Phone = '" + Phone + "', " +
                " WorkPhone = '" + WorkPhone + "', " +
                " Address = '" + Address + "', " +
                " Nok_Fullname = '" + Nok_Fullname + "', " +
                " Nok_Relationship = '" + Nok_Relationship + "', " +
                " Nok_Phone = '" + Nok_Phone + "', " +
                " Nok_Email = '" + Nok_Email + "', " +
                " Nok_Address = '" + Nok_Address + "' " + 
                " where UserID = '" + ID + "'";
            return new DB().ExecuteQuery(query);
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
        public bool ChangePassword()
        {
            return new DB().ExecuteQuery("UPDATE Users SET Password='" + AppHandler.Sha1(Password) + "' WHERE Username='" + Username + "'");
        }
        public DataTable ActiveStafflist()
        {
            return new DB().ReadTable("Staff", "Select * from Users where usertype = 'staff' and accounttype = 'active'");
        }
        internal bool UsernameExists()
        {
            return new DB().ReadData("select userid from Users where Username = '" + Username + "'").Trim() != string.Empty;
        }
        internal bool PhonNoExists()
        {
            return new DB().ReadData("select userid from Users where Phone = '" + Phone + "'").Trim() != string.Empty;
        }
        internal bool EmailExists()
        {
            return new DB().ReadData("select userid from Users where Email = '" + Email + "'").Trim() != string.Empty;
        }
        internal bool StaffIDExists()
        {
            return new DB().ReadData("select userid from Users where StaffID = '" + StaffID + "'").Trim() != string.Empty;
        }

        internal bool UsernameExists(string id)
        {
            return new DB().ReadData("select userid from Users where Username = '" + Username + "' and UserID <> " + ID).Trim() != string.Empty;
        }
        internal bool PhonNoExists(string id)
        {
            return new DB().ReadData("select userid from Users where Phone = '" + Phone + "' and UserID <> " + ID).Trim() != string.Empty;
        }
        internal bool EmailExists(string id)
        {
            return new DB().ReadData("select userid from Users where Email = '" + Email + "' and UserID <> " + ID).Trim() != string.Empty;
        }
        internal bool StaffIDExists(string id)
        {
            return new DB().ReadData("select userid from Users where StaffID = '" + StaffID + "' and UserID <> " + ID).Trim() != string.Empty;
        }
      
        public bool Delete()
        {
            string query = "delete from  users where UserID = '" + ID + "'";
            return new DB().ExecuteQuery(query);
        }
        public bool Deactivate()
        {
            string query = "update users set accounttype = 'Inactive' where UserID = '" + ID + "'";
            return new DB().ExecuteQuery(query);
        }
    }
}