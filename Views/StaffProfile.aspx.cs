using DevExpress.XtraSpreadsheet.Model;
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
    public partial class StaffProfile : System.Web.UI.Page
    {
        protected string fullname = "", email = "", casesTableBuilder = "", sharedFilesTableBuilder = "";
        protected int taskLoad = 0, completedCases = 0, ongoingCases = 0;
        protected Staff staff = new Staff();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null)
                Response.Redirect("~/Default.aspx");
            if (Session["UserType"].ToString().ToLower() != "admin")
                Response.Redirect("~/Default.aspx");
            if (Request.QueryString["sid"] == null)
                Response.Redirect("~/Default.aspx");
            staff = new Staff(int.Parse(AppHandler.Decrypt(Request.QueryString["sid"])));

            if (!IsPostBack)
            {
                LoadProfile(int.Parse(AppHandler.Decrypt(Request.QueryString["sid"])));
                CourtCases(AppHandler.Decrypt(Request.QueryString["sid"]), "");
                SharedFiles(AppHandler.Decrypt(Request.QueryString["sid"]), "");
            }
        }

        protected void LoadProfile(int userID)
        {
            Staff staff = new Staff(userID);
            txtStaffID.Text = userID.ToString();
            txtTitle.Text = staff.Title.Replace("`", "'");
            txtSurname.Text = staff.Surname.Replace("`", "'");
            txtFirstname.Text = staff.Firstname.Replace("`", "'");
            txtMiddlename.Text = staff.Middlename.Replace("`", "'");
            txtPhoneNo.Text = staff.Phone;
            txtWorkMobile.Text = staff.WorkPhone;
            txtAddress.Text = staff.Address.Replace("`", "'");
            txtNoKFullname.Text = staff.Nok_Fullname.Replace("`", "'");
            txtNoKRelationship.Text = staff.Nok_Relationship.Replace("`", "'");
            txtNoKPhone.Text = staff.Nok_Phone;
            txtNoKEmail.Text = staff.Nok_Email;
            txtNoKAddress.Text = staff.Nok_Address.Replace("`", "'");
            string gender = staff.Gender;
            if (gender == "Female")
                ddlGender.SelectedIndex = 1;
            else ddlGender.SelectedIndex = 0;
            txtYearOfCall.Text = staff.YearOfCall;
        }


        private void CourtCases(string userID, string filter)
        {
            casesTableBuilder = "";
               taskLoad = completedCases = ongoingCases = 0;
            string query = "select cd.*, st.* from CaseDetails cd left join CaseAssignedStaff st on cd.CaseID = st.CaseID where  st.StaffID='" + userID + "'";
            if (filter.Trim() != string.Empty)
                query = "select cd.*, st.* from CaseDetails cd left join CaseAssignedStaff st on cd.CaseID = st.CaseID where  st.StaffID='" + userID + "'  and (cd.Name like '%" + txtSearchCase.Text + "%' or cd.CaseNumber like '%" + txtSearchCase.Text + "%' or cd.court  like '%" + txtSearchCase.Text + "%')";


            DataTable results = new DB().ReadTable("", query);


            if (results.Rows.Count > 0)
            {
                taskLoad = results.Rows.Count;
                int n = 0;
                foreach (DataRow dr in results.Rows)
                {
                    ++n;
                    string date = "";
                    try { date = Convert.ToDateTime(dr["DateOpened"]).ToShortDateString(); }
                    catch { }
                    string status = dr["Status"] + "";
                    if (status == "Ongoing")
                    {
                        ++ongoingCases;
                        status = "<span class=\"circle bg-danger circle-lg text-left\"></span>";
                    }
                    else if (status == "Completed")
                    {
                        ++completedCases;
                        status = "<span class=\"circle bg-success circle-lg text-left\"></span>";
                    }
                    else status = "<span class=\"circle bg-info circle-lg text-left\"></span>";

                    casesTableBuilder += "<div class=\"list-group-item list-group-item-action\">" +
                                        "<div class=\"media\">" +
                                           "<img class=\"align-self-start mx-2 circle thumb32\" src=\"../img/briefcase.jpg\" alt=\"Image\">" +
                                               "<div class=\"media-body text-truncate\">" +
                                                   "<p class=\"mb-1\"><strong class=\"text-primary\">" + status + "<span>" + dr["Name"] + " </span><small>(" + dr["CaseNumber"] + ")</small></strong></p>" +
                                                   "<p class=\"mb-1 text-sm\">" + dr["Court"] + "</p>" +
                                               "</div>" +
                                           "<div class=\"ml-auto\"><small class=\"text-muted ml-2\">" + date + "</small></div>" +
                                       "</div>" +
                                   "</div>";
                }
                Literal1.Text = casesTableBuilder;
            }
        }

        private void SharedFiles(string userID, string keyWord)
        {
            sharedFilesTableBuilder = "";
            string query = "select cd.*, st.*,m.* from CaseDetails cd left join CaseAssignedStaff st on cd.CaseID = st.CaseID left join Milestones m on cd.CaseID = m.CaseID where  st.StaffID='" + userID + "' and m.SupportingDocuments is not null order by cd.CaseID desc";
            if (keyWord.Trim() != string.Empty)
                query = "select cd.*, st.*,m.* from CaseDetails cd left join CaseAssignedStaff st on cd.CaseID = st.CaseID left join Milestones m on cd.CaseID = m.CaseID where  st.StaffID='" + userID + "' and m.SupportingDocuments is not null   and (cd.Name like '%" + txtSearchCase.Text + "%' or cd.CaseNumber like '%" + txtSearchCase.Text + "%' or m.SupportingDocuments  like '%" + txtSearchCase.Text + "%')  order by cd.CaseID desc";

            DataTable results = new DB().ReadTable("", query);

            if (results.Rows.Count > 0)
            {
                int n = 0;
                foreach (DataRow dr in results.Rows)
                {
                    ++n;
                    string name = dr["Name"].ToString(),
                        number = dr["CaseNumber"].ToString();

                    string date = "";
                    try { date = Convert.ToDateTime(dr["DateAchieved"]).ToShortDateString(); }
                    catch { }
                    string supportingDocs = dr["SupportingDocuments"].ToString().TrimEnd('`').TrimEnd('~');
                    string[] filePaths = supportingDocs.Split('`');

                    foreach (string filePath in filePaths)
                    {
                        string[] folders = filePath.Split('/');
                        string fileName = folders[folders.Length-1];
                        string stage = folders[folders.Length - 2];
                        if (!name.ToLower().Contains(keyWord) && !number.ToLower().Contains(keyWord) && !fileName.ToLower().Contains(keyWord))
                            continue;

                        sharedFilesTableBuilder += " <div class=\"list-group-item list-group-item-action\">" +
                                              "<div class=\"media\">" +
                                                "<img class=\"align-self-start mx-2 circle thumb32\" src=\"../img/briefcase.jpg\" alt=\"Image\">" +
                                                 "<div class=\"media-body text-truncate\">" +
                                                    "<p class=\"mb-1\">" +
                                                        "<strong class=\"text-primary\">" +
                                                            "<span>" +stage+": " + fileName + "</span></strong>" +
                                                    "</p>" +
                                                    "<p class=\"mb-1 text-sm\">" + dr["Name"] + " <small>(" + dr["CaseNumber"] + ")</small></p>" +
                                                "</div>" +
                                                "<div class=\"ml-auto\">" +
                                                "<small class=\"text-muted ml-2\"><a href='" + filePath + "'><em class=\"ml-auto fa fa-download fa-fw text-info\"></em></a>" +
                                                "<br />" + date +
                                                "</small>" +
                                            "</div>" +
                                        "</div>" +
                                    "</div>";
                    }
                }
                Literal2.Text = sharedFilesTableBuilder;
            }
        }

        protected void btnSearchCase_Click(object sender, EventArgs e)
        {
            CourtCases(AppHandler.Decrypt(Request.QueryString["sid"]), txtSearchCase.Text.Replace("'", "`"));
        }

        protected void btnSearchFile_Click(object sender, EventArgs e)
        {
          SharedFiles(AppHandler.Decrypt(Request.QueryString["sid"]), txtSearchFile.Text.Replace("'", "`"));
        }
        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            Staff staff = new Staff(int.Parse(txtStaffID.Text));
            ////Check if email or Phone number exists
            //if (staff.Email != null || staff.Phone != null)
            //{
            //    ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
            //                        "<strong style=\"text-align:center\">Staff with email or Mobile number already exists</strong>" +
            //                        "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
            //                        "<span aria-hidden=\"true\">&times;</span>" +
            //                        "</button>" +
            //                    "</div>";
            //    return;
            //}

            string profilePicUrl = "../img/user/avatar2.png";
            string gender = ddlGender.SelectedItem.Value;
            if (gender == "Male")
                profilePicUrl = "../img/user/avatar.png";

            staff = new Staff
            {
                ID = int.Parse(txtStaffID.Text),
                Title = txtTitle.Text,
                Surname = txtSurname.Text,
                Firstname = txtFirstname.Text,
                Middlename = txtMiddlename.Text,
                Name = txtTitle.Text + " " + txtFirstname.Text + " " + txtFirstname.Text + " " + txtMiddlename.Text,
                Gender = ddlGender.SelectedItem.Value,
                YearOfCall = txtYearOfCall.Text,
                Address = txtAddress.Text.Replace("'", "`"),
                Phone = txtPhoneNo.Text,
                Nok_Fullname = txtNoKFullname.Text.Replace("'", "`"),
                Nok_Relationship = txtNoKRelationship.Text.Replace("'", "`"),
                Nok_Phone = txtNoKPhone.Text.Replace("'", "`"),
                Nok_Email = txtNoKEmail.Text.Replace("'", "`"),
                Nok_Address = txtNoKAddress.Text.Replace("'", "`"),
                ProfilePicUrl = profilePicUrl,
            };

            if (staff.Surname.Trim() == string.Empty ||
                staff.Firstname.Trim() == string.Empty ||
                staff.Phone.Trim() == string.Empty ||
                staff.YearOfCall.Trim() == string.Empty ||
                staff.Nok_Fullname.Trim() == string.Empty ||
                staff.Nok_Relationship.Trim() == string.Empty ||
                staff.Nok_Phone.Trim() == string.Empty ||
                staff.Nok_Address.Trim() == string.Empty)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                    "<strong style=\"text-align:center\">Fields marked with (*) are required</strong>" +
                                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                "</div>";
                return;
            }
            else if (staff.Update())
            {
                ltrMessage.Text = "<div class=\"alert alert-success alert-dismissible\">" +
                                      "<strong style=\"text-align:center\">Staff Registration Successful</strong>" +
                                      "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                  "</div>";
            }
            else
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                      "<strong style=\"text-align:center\">Unable to Register Staff</strong>" +
                      "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                  "</div>";
            }
        }
        protected void btnResetPass_Click(object sender, EventArgs e)
        {
            string oldPassword = txtOldPassword.Text;
            string newPassword = txtNewPassword.Text;
            string confirmPass = txtConfirmPassword.Text;

            if (oldPassword.Trim() == string.Empty || newPassword.Trim() == string.Empty || confirmPass.Trim() == string.Empty)
            {
                ltrMessage.Text = lblPasswordChangeReport.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                    "<strong style=\"text-align:center\">Password-Reset fields  are required</strong>" +
                                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                "</div>";
                return;
            }

            if (new DB().ReadData("select Password from Users where UserID = '" + txtStaffID.Text + "'") != AppHandler.Sha1(oldPassword))
            {
                ltrMessage.Text = lblPasswordChangeReport.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                  "<strong style=\"text-align:center\">Wrong password</strong>" +
                                  "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                  "<span aria-hidden=\"true\">&times;</span>" +
                                  "</button>" +
                              "</div>";
                return;
            }


            if (newPassword.Trim() != confirmPass.Trim())
            {
                ltrMessage.Text = lblPasswordChangeReport.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                 "<strong style=\"text-align:center\">Passwords do not match.</strong>" +
                                 "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                 "<span aria-hidden=\"true\">&times;</span>" +
                                 "</button>" +
                             "</div>";
                return;
            }
            if (newPassword.Trim().Length < 6)
            {
                ltrMessage.Text = lblPasswordChangeReport.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                "<strong style=\"text-align:center\">Password is too short. Minimum of 6 characters is required.</strong>" +
                                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                "<span aria-hidden=\"true\">&times;</span>" +
                                "</button>" +
                            "</div>";
                return;
            }
            if (new DB().ExecuteQuery("update users set password = '" + AppHandler.Sha1(newPassword) + "' where UserID = '" + txtStaffID.Text + "'"))
            {
                ltrMessage.Text = lblPasswordChangeReport.Text = "<div class=\"alert alert-success alert-dismissible\">" +
                               "<strong style=\"text-align:center\">Password Changed Successfully.</strong>" +
                               "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                               "<span aria-hidden=\"true\">&times;</span>" +
                               "</button>" +
                           "</div>";
                Session.Clear();
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                ltrMessage.Text = lblPasswordChangeReport.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                            "<strong style=\"text-align:center\">Failed to update password at this time. Try again.</strong>" +
                            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                            "<span aria-hidden=\"true\">&times;</span>" +
                            "</button>" +
                        "</div>";
            }
        }
    }
}