using LawDesk.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string dashboard = "", documentManagement = "", appointments = "",
            clientregistration = "", clientdirectory = "", caseregistration = "", casedirectory = "",
            communicationChannel = "", trial = "", appeal = "", milestones = "", staffregistration = "", stafflisting = "",
            arbitration = "", agreementDrafting = "", contractDrafting = "", assignStaff = "";

        protected string trialcourts = "", electionpetition = "", appealshariacourt = "", appealcourtofapeal = "", appealsupremecourt = "",
            contracts = "", letters = "", mediation = "", incorporation = "", property = "",
            police = "", efcc = "", icpc = "", ministryofjustice = "", inec = "", nationalassembly = "", internalmemos = "", others = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = HttpContext.Current.Request.Url.AbsolutePath;  // /TESTERS/Default6.aspx
            string page = path.Split('/')[2];
            string task = Request.QueryString["q"];


            if (page.ToLower().StartsWith("dashboard"))
                dashboard = "active";
            else if (page.ToLower().StartsWith("documentmanagement"))
                documentManagement = "active";
            else if (page.ToLower().StartsWith("appointments"))
                appointments = "active";

            else if (page.ToLower().StartsWith("clientregistration"))
                clientregistration = "active";
            else if (page.ToLower().StartsWith("clientdirectory"))
                clientdirectory = "active";

            else if (page.ToLower().StartsWith("caseregistration"))
                caseregistration = "active";
            else if (page.ToLower().StartsWith("casedirectory"))
                casedirectory = "active";
            else if (page.ToLower().StartsWith("editcase"))
                casedirectory = "active";

            else if (page.ToLower().StartsWith("communicationchannel"))
                communicationChannel = "active";
            else if (page.ToLower().StartsWith("assignstaff"))
                assignStaff = "active";
            else if (page.ToLower().StartsWith("milestones"))
                milestones = "active";

            else if (page.ToLower().StartsWith("staffregistration"))
                staffregistration = "active";
            else if (page.ToLower().StartsWith("stafflisting"))
                stafflisting = "active";
            else if (page.ToLower().StartsWith("staffprofile"))
                stafflisting = "active";

            if (task != null)
            {
                task = AppHandler.Decrypt(Request.QueryString["q"]);
                //if (task.ToLower().StartsWith("trial"))
                //    trial = "active";
                //else 
                //if (task.ToLower().StartsWith("appeal"))
                //    appeal = "active";
                //else if (task.ToLower().StartsWith("arbitration"))
                //    arbitration = "active";
                //else if (task.ToLower().Replace(" ",string.Empty).StartsWith("agreementdrafting"))
                //    agreementDrafting = "active";
                //else if (task.ToLower().Replace(" ", string.Empty).StartsWith("contractdrafting"))
                //    contractDrafting = "active";

                //else 
                if (task.Equals("Arbitrations"))
                    arbitration = "active";
                else if (task.Equals("Trial Courts"))
                    trialcourts = "active";
                else if (task.Equals("Election Petitions"))
                    electionpetition = "active";
                else if (task.Equals("Appeals (Sharia Court)"))
                    appealshariacourt = "active";
                else if (task.Equals("Appeals (Court of Appeal)"))
                    appealcourtofapeal = "active";
                else if (task.Equals("Appeals (Supreme Court)"))
                    appealsupremecourt = "active";
                else if (task.Equals("Contracts"))
                    contracts = "active";
                else if (task.Equals("Letters"))
                    letters = "active";
                else if (task.Equals("Mediation"))
                    mediation = "active";
                else if (task.Equals("Incorporation"))
                    incorporation = "active";
                else if (task.Equals("Property"))
                    property = "active";
                else if (task.Equals("Police"))
                    police = "active";
                else if (task.Equals("EFCC"))
                    efcc = "active";
                else if (task.Equals("ICPC"))
                    icpc = "active";
                else if (task.Equals("Ministry of Justice"))
                    ministryofjustice = "active";
                else if (task.Equals("INEC"))
                    inec = "active";
                else if (task.Equals("National Assembly"))
                    nationalassembly = "active";
                else if (task.Equals("Internal Memos"))
                    internalmemos = "active";
                else if (task.Equals("Others"))
                    others = "active";
            }

        }
    }
}