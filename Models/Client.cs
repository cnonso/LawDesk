
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace LawDesk.Models
{
    public class Client
    {

        public string ClientID { get; set; }
        public string Surname { get; set; }
        public string Firstname { get; set; }
        public string Middlename { get; set; }
        public string Email { get; set; }
        public string ContactGroup { get; set; }
        public string ClientPortalEnabled { get; set; }
        public string MobilePhoneNo { get; set; }
        public string WorkPhoneNo { get; set; }
        public string HomePhoneNo { get; set; }
        public string Address { get; set; }
        public DateTime RegDate { get; set; }

        private string mClientID;
        public Client()
        { }

        public Client(string cientID)
        {
            this.mClientID = cientID.Replace("MCo/", string.Empty).TrimStart('0');
            DataTable clientTable = new DB().ReadTable("Client", "Select * from clients where clientID = " + mClientID);
            if (clientTable.Rows.Count > 0)
            {
                ClientID = mClientID;
                Surname = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Surname"]);
                Firstname = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Firstname"]); 
                Middlename = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Middlename"]);
                Email = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Email"]);
                ContactGroup = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["ContactGroup"]);
                ClientPortalEnabled = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["ClientPortalEnabled"]);
                MobilePhoneNo = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["MobilePhoneNo"]);
                WorkPhoneNo = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["WorkPhoneNo"]);
                HomePhoneNo = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["HomePhoneNo"]);
                Address = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Address"]);
                RegDate = Convert.ToDateTime(clientTable.Rows[0]["RegDate"]);
            }
        }
        public Client(string email, string phoneNo)
        { 
            DataTable clientTable = new DB().ReadTable("Client", "Select * from clients where Email = '" + email + "' or MobilePhoneNo = '" + phoneNo + "'");
            if (clientTable.Rows.Count > 0)
            {
                ClientID = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["ClientID"]);
                Surname = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Surname"]);
                Firstname = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Firstname"]); 
                Middlename = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Middlename"]);
                Email = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Email"]);
                ContactGroup = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["ContactGroup"]);
                ClientPortalEnabled = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["ClientPortalEnabled"]);
                MobilePhoneNo = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["MobilePhoneNo"]);
                WorkPhoneNo = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["WorkPhoneNo"]);
                HomePhoneNo = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["HomePhoneNo"]);
                Address = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Address"]);
                RegDate = Convert.ToDateTime(clientTable.Rows[0]["RegDate"]);
            }
        }
        internal bool Add()
        {
            string query = "insert into Clients (Surname,Firstname,Middlename,Email,ContactGroup,ClientPortalEnabled,MobilePhoneNo,WorkPhoneNo,HomePhoneNo,Address,Username,Password,RegDate)" +
                "values ('" + Surname + "','" + Firstname + "','" + Middlename + "','" + Email + "','" + ContactGroup + "','" + ClientPortalEnabled + "','" + MobilePhoneNo + "','" + WorkPhoneNo + "','" + HomePhoneNo + "','" + Address + "','" + MobilePhoneNo + "','" + AppHandler.Sha1(Surname.ToLower()) + "','"+DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss tt")+"')";
            return new DB().ExecuteQuery(query);
        }
    }
}