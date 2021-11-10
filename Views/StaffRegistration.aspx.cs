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
    public partial class StaffRegistration : System.Web.UI.Page
    {
        private DB db = new DB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null)
                Response.Redirect("~/Default.aspx");
            if (Session["UserType"].ToString().ToLower() != "admin")
                Response.Redirect("~/Default.aspx");
            if (!IsPostBack)
            {
                //Load UserTypes
                LoadUserypes();
            }
        }
        protected void LoadUserypes()
        {
            ddlStaffType.Items.Clear();
            //ddlStaffType.Items.Add(new ListItem("-select-", ""));
            DataTable userTypes = new DataTable();
            userTypes = new DB().ReadTable("UserTypes", "select * from usertypes where name <> 'Admin'");
            ddlStaffType.ClearSelection();
            foreach (DataRow tRow in userTypes.Rows)
                ddlStaffType.Items.Add(new ListItem(tRow["Name"].ToString(), tRow["ID"].ToString()));
        }

        protected void btnAddNewUserType_Click(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            string groupName = Request.Form["txtAddNewContactGroup"];
            bool nameExists = db.ReadData("select id from usertypes where name = '" + groupName + "'").Trim() != string.Empty;
            if (nameExists)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                      "<strong style=\"text-align:center\">Group Name already exists</strong>" +
                      "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                  "</div>";
            }
            else
            {
                db.ExecuteQuery("insert into usertypes(name) values ('" + groupName + "')");
                LoadUserypes();
                ddlStaffType.ClearSelection();
                ddlStaffType.Items.FindByText(groupName).Selected = true;
            }
        }
        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            Staff staff = new Staff(txtEmail.Text,txtPhone.Text );
            //Check if email or Phone number exists
            if (staff.Email != null || staff.Phone != null)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                    "<strong style=\"text-align:center\">Staff with email or Mobile number already exists</strong>" +
                                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                "</div>";
                return;
            }

            string profilePicUrl = "../img/user/avatar2.png";
            string gender = ddlGender.SelectedItem.Value;
            if (gender == "Male")
                profilePicUrl = "../img/user/avatar.png";

            staff = new Staff
            {
                Username = txtPhone.Text,
                Title = txtTitle.Text,
                Surname = txtSurname.Text,
                Firstname = txtFirstname.Text,
                Middlename = txtMiddlename.Text,
                Name = txtTitle.Text + " " + txtFirstname.Text + " " + txtFirstname.Text + " " + txtMiddlename.Text,
                Gender = ddlGender.SelectedItem.Value,
                Email = txtEmail.Text,
                UserType = ddlStaffType.SelectedItem.Text,
                YearOfCall = txtYearOfCall.Text,
                Phone = txtPhone.Text,
                WorkPhone = txtWorkPhone.Text,
                Address = txtAddress.Text.Replace("'", "`"),
                Nok_Fullname = txtNoKFullname.Text.Replace("'", "`"),
                Nok_Relationship = txtNoKRelationship.Text.Replace("'", "`"),
                Nok_Phone = txtNoKPhone.Text.Replace("'", "`"),
                Nok_Email = txtNoKEmail.Text.Replace("'", "`"),
                Nok_Address = txtNoKAddress.Text.Replace("'", "`"),
                Status = "1",
                Logs = "0",
                DateAdded = DateTime.Now.ToString("yyyy-MM-dd"),
                RoleID = ddlStaffType.SelectedItem.Value,
                ProfilePicUrl = profilePicUrl,
                TaskLoad = "0",
                Password = txtSurname.Text.ToLower()
            };

            if (staff.Surname.Trim() == string.Empty ||
                staff.Firstname.Trim() == string.Empty ||
                staff.Email.Trim() == string.Empty ||
                staff.YearOfCall.Trim() == string.Empty ||
                staff.Phone.Trim() == string.Empty ||
                staff.Email.Trim() == string.Empty ||
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
            else if (staff.Add())
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

    }
}