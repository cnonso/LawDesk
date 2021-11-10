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
    public partial class AssignStaff : System.Web.UI.Page
    {
        protected string tableBuilder = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null)
                Response.Redirect("~/Default.aspx");
            if (Session["UserType"].ToString().ToLower() != "admin")
                Response.Redirect("~/Default.aspx");

            if (!IsPostBack)
            {
                LoadStaff();
                LoadCases();
            }
        }
        protected void LoadStaff()
        {
            DataTable results = new DB().ReadTable("", "select  * from users where usertype = 'support staff' or usertype = 'lawyer' order by Name");

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
                    string name = dr["Title"] + " " + dr["surName"] + " " + dr["firstname"] + " " + dr["middlename"];
                    string add = "<a style='cursor:pointer; color:green' onclick=\"AddStaffToList('" + dr["UserID"] + "','" + name+ "','" + dr["ProfilePicUrl"] + "')\">Add</a>";
                    string checkBox = "<input id='" + dr["UserID"] + "' name='Staff' type='checkbox' value = '" + dr["UserID"] + "' />";
                    tableBuilder += "<tr>" +
                               "    <td>" + n + "</td>" +
                               "      <td>" + dr["Title"] + " " + dr["surName"] + " " + dr["firstname"] +" " +dr["middlename"] +"</td> " +
                               "      <td>" + userType + "</td>" +
                               "      <td>" + dr["TaskLoad"] + "</td>" +
                               "      <td>" + add + "</td>" +
                               "</tr>";
                }
            }
        }
        protected void LoadCases()
        {
            ltrMessage.Text = "";
            ddlCases.Items.Clear();
            ddlCases.Items.Add(new ListItem("-Select Case-", ""));
            DataTable cases = new DB().ReadTable("Cases", "select *   from Casedetails order by CaseID desc");
            foreach (DataRow tRow in cases.Rows)
                ddlCases.Items.Add(new ListItem(tRow["Name"] + " " + tRow["CaseNumber"], tRow["CaseID"].ToString()));
        }

        protected void btnSaveAssignment_Click(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            string caseID = ddlCases.SelectedItem.Value;
            string query = "delete from CaseAssignedStaff where caseID = '" + caseID + "'";
            if (ddlCases.SelectedIndex == 0)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                    "<strong style=\"text-align:center\">No Case selected</strong>" +
                                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                "</div>";
                LoadStaff();
                LoadAssignedStaff(caseID);
                return;
            }
            string selectedStaffIDs = Request.Form["staffIDs"].TrimStart(',');
            string[] staffIDs = selectedStaffIDs.Split(',');
            if (staffIDs.Length > 0)
            {
                foreach (string id in staffIDs)
                {
                    string staffID = id.Split('~')[0];
                    string staffName = id.Split('~')[1];
                    string teamLeaderID = Request.Form["ddlTeamLead"];
                    query += "insert into CaseAssignedStaff (CaseID, StaffID, StaffName, TeamLeaderID) values ('" + caseID + "','" + staffID + "','" + staffName + "','" + teamLeaderID + "')";
                }
                if (new DB().ExecuteQuery(query))
                {
                    ltrMessage.Text = "<div class=\"alert alert-success alert-dismissible\">" +
                                        "<strong style=\"text-align:center\">Staff Assignment successful</strong>" +
                                        "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                        "<span aria-hidden=\"true\">&times;</span>" +
                                        "</button>" +
                                    "</div>";

                    LoadStaff();
                    LoadAssignedStaff(caseID);
                }
            }
            else
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                  "<strong style=\"text-align:center\">No Staff selected</strong>" +
                                  "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                  "<span aria-hidden=\"true\">&times;</span>" +
                                  "</button>" +
                              "</div>";
                LoadStaff();
                LoadAssignedStaff(caseID);
                return;
            }
        }

        protected string staffListBuilder = "",
            saveSelectionButtonStyle = "display: none; float: right",
            selectionDropDown = "<select id=\"ddlTeamLead\" class=\"form-control\"></select>";
        protected void LoadAssignedStaff(string caseID)
        {
            
            staffListBuilder = "";
            saveSelectionButtonStyle = "display: none; float: right";
            txtAppendedStaffIDs.Text = ",";
            selectionDropDown = "<select id=\"ddlTeamLead\" name=\"ddlTeamLead\" class=\"form-control\">";

            DataTable assignedStaff = new DB().ReadTable("Staff", "select * from CaseAssignedStaff where caseid = '" + caseID + "'");
            txtTotalAssignedStaff.Text = assignedStaff.Rows.Count.ToString();
            if (assignedStaff.Rows.Count > 0)
            {
                string teamLeaderID = assignedStaff.Rows[0]["teamLeaderID"].ToString();
                saveSelectionButtonStyle = "display: block; float: right";
                foreach (DataRow dr in assignedStaff.Rows)
                {
                    if (teamLeaderID == dr["StaffID"].ToString())
                        selectionDropDown += "<option value=\"" + dr["StaffID"] + "\" selected='selected'>" + dr["StaffName"] + "</option>";
                    else
                        selectionDropDown += "<option value=\"" + dr["StaffID"] + "\">" + dr["StaffName"] + "</option>";
                    txtAppendedStaffIDs.Text += dr["StaffID"] + ",";
                    staffListBuilder += "<input id=\"input_" + dr["StaffID"] + "\" style=\"display: none\" name=\"staffIDs\" value=\"" + dr["StaffID"] + "~" + dr["StaffName"] + "\" />";
                    staffListBuilder += " <p id=\"p_" + dr["StaffID"] + "\">" +
                                   "<img class=\"mr-2 rounded-circle thumb32\" src=\"../img/avatar.png\" alt=\"Image\">" +
                                   dr["StaffName"] + " <span style= \"float: right; cursor: pointer; color: red\" id= \"rmvBtn_" + dr["StaffID"] + "\" onclick= \"removeLinkElemClicked('" + dr["StaffID"] + "');\" > Remove </span><hr id='hr_" + dr["StaffID"] + "' />" +
                               "</p>";
                }
            }
            selectionDropDown += "</select>";
        }

        protected void ddlCases_SelectedIndexChanged(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            string caseID = ddlCases.SelectedItem.Value;
            LoadStaff();
            LoadAssignedStaff(caseID);
        }
    }
}