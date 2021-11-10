using DevExpress.XtraGauges.Core.Base;
using LawDesk.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk.Views
{
    public partial class MileStones : System.Web.UI.Page
    {
        protected string milesones = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null)
                Response.Redirect("~/Default.aspx");
            if (Session["UserType"].ToString().ToLower() != "admin")
                Response.Redirect("~/Default.aspx");

            if (!IsPostBack)
            {
                LoadCases();
            }
        }

        protected void ddlCases_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadMilesones(ddlCases.SelectedItem.Value);
        }
        protected void LoadCases()
        {

            ddlCases.Items.Clear();
            ddlCases.Items.Add(new ListItem("Select Case", ""));
            DataTable cases = new DB().ReadTable("Cases", "select *   from Casedetails   order by CaseID desc");
            foreach (DataRow tRow in cases.Rows)
                ddlCases.Items.Add(new ListItem(tRow["Name"] + " " + tRow["CaseNumber"], tRow["CaseID"] + ":" + tRow["CategoryID"]));
        }
        protected void LoadMilesones(string caseIDAndCategoryID)
        {

            string caseID = caseIDAndCategoryID.Split(':')[0];
            string catID = caseIDAndCategoryID.Split(':')[1];

            DataTable stages = new DB().ReadTable("Stages", "select distinct * from CaseStages where catid = " + catID + " order by step DESC");
            DataTable milestonesTable = new DB().ReadTable("Milestones", "select  * from Milestones where CaseID = " + caseID + " order by ID desc");
            string teamLeader = new DB().ReadData("select staffname from CaseAssignedStaff where StaffID=TeamLeaderID and CaseID=" + caseID);

            string previousDate = "", currentDate = "", separator = "";

            //string separator = "<li class=\"timeline-separator\" data-datetime=\"Yesterday\"></li>";
            //milesones += separator;

            string[] colors = new string[] { "info", "success", "warning", "danger", "purple", "pink" };
            string color = "info";//Default color
            int i = 0;
            foreach (DataRow dr in stages.Rows)
            {
                if (i > stages.Rows.Count)
                    color = colors[0];
                else color = colors[i];



                DataRow[] milestoneRows = milestonesTable.Select("stage='" + dr["Name"] + "'");
                //DataRow[] milestoneRows = milestonesTable.Select("stage='" + dr["Name"] + "'", "ID ASC");

                //foreach (DataRow mr in milestoneRows)
                foreach (DataRow mr in milestoneRows)
                {
                    //Indicate date
                    currentDate = Convert.ToDateTime(mr["DateAchieved"]).ToString("yyyy-MM-dd");
                    if (previousDate != currentDate)
                    {
                        previousDate = currentDate;

                        //Format date to Today, yesterday or actual date
                        if (DateTime.Today.ToString("yyyy-MM-dd") == currentDate)
                            currentDate = "Today";
                        else if (DateTime.Today.AddDays(-1).ToString("yyyy-MM-dd") == currentDate)
                            currentDate = "Yesterday";

                        separator = "<li class=\"timeline-separator\" data-datetime=\"" + currentDate + "\"></li>";
                        milesones += separator;
                    }
                    else separator = "";

                    ++i;
                    string inverter = " <li>";
                    if (i % 2 == 0)
                        inverter = " <li class=\"timeline-inverted\">";

                    //milesones += "<li>" +
                    milesones += inverter +
                                    //"<div class=\"timeline-badge info\"><em class=\"far icon-pin\"></em></div>" +
                                    "<div class=\"timeline-badge " + color + "\"><em class=\"far icon-pin\"></em></div>" +
                                        "<div class=\"timeline-card\">" +
                                            "<div class=\"popover left\">" +
                                                "<h4 class=\"popover-header\">" + dr["Name"] + "</h4>" +
                                                "<div class=\"arrow\"></div>" +
                                                "<div class=\"popover-body\">" +
                                                "<p>Team Lead: " + teamLeader + "<br>" +
                                                    "<small>" + mr["milestone"] + "</small>" +
                                                "</p>" +
                                                "</div>" +
                                            "</div>" +
                                        "</div>" +
                                    "</li>";
                }
            }
        }
    }
}