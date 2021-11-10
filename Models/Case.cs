using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace LawDesk.Models
{
    public class Case
    {

        public string CaseID { get; set; }
        public string ClientID { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string TypeID { get; set; }
        public string Category { get; set; }
        public string CategoryID { get; set; }
        public string Stage { get; set; }
        public string DateOpened { get; set; }
        public string CaseNumber { get; set; }
        public string PracticeArea { get; set; }
        public string Description { get; set; }
        public string Court { get; set; }
        public string Status { get; set; }

        private string mCaseNumber; 

        public Case()
        { }

        public Case(int caseID)
        { 
            DataTable clientTable = new DB().ReadTable("Case Details", "Select * from CaseDetails where caseID = '" + caseID + "'");
            if (clientTable.Rows.Count > 0)
            {
                CaseID = caseID.ToString();
                CaseNumber = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["CaseNumber"]);
                ClientID = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["ClientID"]);
                Name = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Name"]); 
                Type = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Type"]);
                TypeID = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["TypeID"]);
                Category = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Category"]);
                CategoryID = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["CategoryID"]);
                Stage = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Stage"]);
                DateOpened = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["DateOpened"]);
                PracticeArea = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["PracticeArea"]);
                Description = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Description"]);
                Court = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Court"]);
                Status = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Status"]);
            }
        }
        public Case(string caseNumber)
        {
            this.mCaseNumber = caseNumber;
            DataTable clientTable = new DB().ReadTable("Case Details", "Select * from CaseDetails where caseNumber = '" + mCaseNumber + "'");
            if (clientTable.Rows.Count > 0)
            {
                CaseNumber = mCaseNumber;
                CaseID = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["CaseID"]);
                ClientID = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["ClientID"]);
                Name = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Name"]);
                Type = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Type"]);
                TypeID = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["TypeID"]);
                Category = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Category"]);
                CategoryID = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["CategoryID"]);
                Stage = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Stage"]);
                DateOpened = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["DateOpened"]);
                PracticeArea = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["PracticeArea"]);
                Description = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Description"]);
                Court = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Court"]);
                Status = AppHandler.IgnoreDBNullString(clientTable.Rows[0]["Status"]);
            }
        }
        internal bool Add()
        {
            string query = "insert into CaseDetails (ClientID,Name,Type,Stage,DateOpened,CaseNumber,PracticeArea,Description,Category,TypeID,CategoryID,Status,Court)" +
                 "OUTPUT INSERTED.CaseID, '" + Name + "' INTO [Resources] ([ResourceID], [ResourceName]) " +
                "values ('" + ClientID + "','" + Name + "','" + Type + "','" + Stage + "','" + DateOpened + "','" + CaseNumber + "','" + PracticeArea + "','" + Description + "','" + Category + "','" + TypeID + "','" + CategoryID + "','Ongoing','"+Court+"')";
            return new DB().ExecuteQuery(query);
        }
        internal bool Update()
        {
            string query = "Update CaseDetails set Name ='" + Name + "', Type ='" + Type + "',Stage ='" + Stage + "',DateOpened ='" + DateOpened + "',PracticeArea ='" + PracticeArea + "', Description ='" + Description + "',Category ='" + Category + "',TypeID ='" + TypeID + "',CategoryID ='" + CategoryID + "', Court ='" + Court + "' where CaseNumber ='" + CaseNumber + "'";
            return new DB().ExecuteQuery(query);
        }
    }
}