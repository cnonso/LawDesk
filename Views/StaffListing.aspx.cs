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
    public partial class StaffListing : System.Web.UI.Page
    {
        protected string tableBuilder = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadStaff();
        }
        protected void LoadStaff()
        {
            DataTable results = new DB().ReadTable("", "select * from users where usertype = 'support staff' or usertype = 'lawyer' order by Name");

            if (results.Rows.Count > 0)
            {
                int n = 0;
                foreach (DataRow dr in results.Rows)
                {
                    ++n;
                    string userType = dr["UserType"] + "";
                    if (userType == "Lawyer")
                        userType = "<span class='badge badge-success'>Lawyer</span>";
                    else if (userType == "Support Staff")
                        userType = "<span class='badge badge-warning'>Support Staff</span>";
                    else userType = "<span class='badge badge-info'>" + userType + "</span>";
                    string staffID = AppHandler.Encrypt(dr["UserID"].ToString());
                    string view = " <a href=\"../Views/StaffProfile.aspx?sid=" + staffID + "\"><span style='color:blue'>View</span></a>";
                    string checkBox = "<input id='" + dr["UserID"] + "' name='Staff' type='checkbox' value = '" + dr["UserID"] + "' />";
                    //string taskLoad = new DB().ReadData("select count (id) from CaseAssignedStaff where staffID = '" + dr["UserID"] + "'");
                    string totalAssignedTasks = new DB().ReadData("select count (id) from CaseAssignedStaff cas left join CaseDetails cd on cas.CaseID=cd.CaseID where staffID = '" + dr["UserID"] + "'");
                    string taskLoad = new DB().ReadData("select count (id) from CaseAssignedStaff cas left join CaseDetails cd on cas.CaseID=cd.CaseID where staffID = '" + dr["UserID"] + "'  and cd.status='Ongoing'");
                    tableBuilder += "<tr>" +
                               "    <td>" + n + "</td>" +
                               "      <td>" + dr["Title"] + " " + dr["SurName"] + " " + dr["FirstName"] + " " + dr["Middlename"] + "</td> " +
                               "      <td>" + userType + "</td>" +
                               "      <td>" + totalAssignedTasks + "</td>" +
                               "      <td>" + taskLoad + "</td>" +
                               "      <td>" + view + "</td>" +
                               "</tr>";
                }
            }
        }
    }
}