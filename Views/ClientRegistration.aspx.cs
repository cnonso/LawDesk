using LawDesk.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk.Views
{
    public partial class ClientRegistration : System.Web.UI.Page
    {
        protected string tableBuilder = "";
        protected string alertMessage = "";

        DB db = new DB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null)
                Response.Redirect("~/Default.aspx");
            if (Session["UserType"].ToString().ToLower() != "admin")
                Response.Redirect("~/Default.aspx");

            if (!IsPostBack)
            {
                //Generate a new ClientID
                int lastClientID = int.Parse(db.ReadData("select top 1 clientid from clients order by clientid desc"));
                int nextClientID = lastClientID + 1;
                string nextClientIDFormated = "MCo/" + nextClientID.ToString().PadLeft(6, '0');
                txtClientID.Text = nextClientIDFormated;

                //Load Contact Groups
                LoadContactGroups();

                //Load Practice Areas
                LoadPracticeAreas();
            }
        }

        protected void ddlCaseType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            string[] litigationStages = new string[] { "Commencement", "Trial", "Adoption of Addresses", "Judgement", "Closure" };
            string[] commercialCaseStages = new string[] { "First Draft", "Final Draft" };
            string[] stages;
            if (ddlCaseType.SelectedItem.Text == "Litigation") stages = litigationStages;
            else stages = commercialCaseStages;
            ddlCaseStages.Items.Clear();
            foreach (string stage in stages)
                ddlCaseStages.Items.Add(new ListItem(stage, stage));
        }


        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            Client client = new Client(txtEmail.Text, txtMobilePhone.Text);
            //Check if email or Phone number exists
            if (client.Email != null || client.MobilePhoneNo != null)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                    "<strong style=\"text-align:center\">Client with email or Mobile number already exists</strong>" +
                                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                "</div>";
                return;
            }

            client = new Client
            {
                Address = txtAddress.Text.Replace("'", "`"),
                ClientPortalEnabled = Request.Form["chkBxClientPortal"],
                ContactGroup = ddlClientGroup.SelectedItem.Text.Replace("'", "`"),
                Email = txtEmail.Text.Replace("'", "`"),
                Firstname = txtFirstname.Text.Replace("'", "`"),
                HomePhoneNo = txtHomePhone.Text.Replace("'", "`"),
                Middlename = txtMiddlename.Text.Replace("'", "`"),
                MobilePhoneNo = txtMobilePhone.Text.Replace("'", "`"),
                Surname = txtSurname.Text.Replace("'", "`"),
                WorkPhoneNo = txtWorkPhone.Text.Replace("'", "`")
            };

            if (client.Address.Trim() == string.Empty ||
                client.Email.Trim() == string.Empty ||
                client.Firstname.Trim() == string.Empty ||
                client.MobilePhoneNo.Trim() == string.Empty ||
                client.Surname.Trim() == string.Empty)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                    "<strong style=\"text-align:center\">Surname, Firstname, Email, Mobile Phone Number and Address are required</strong>" +
                                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                "</div>";
                return;
            }
            else if (client.Add())
            {
                ltrMessage.Text = "<div class=\"alert alert-success alert-dismissible\">" +
                                      "<strong style=\"text-align:center\">Client Registration Successful</strong>" +
                                      "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                  "</div>";
            }
            else
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                      "<strong style=\"text-align:center\">Unable to Register Client Successfully</strong>" +
                      "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                  "</div>";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            if (txtSearchClientID.Text.Trim()== string.Empty)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                      "<strong style=\"text-align:center\">Enter a valid Client ID</strong>" +
                      "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                  "</div>";
                return;
            }
            Client client = new Client(txtSearchClientID.Text);
            txtClientID.Text = "MCo/" + client.ClientID.PadLeft(6, '0');
            txtAddress.Text = client.Address.Replace("`", "'");
            ddlClientGroup.ClearSelection();
            ddlClientGroup.Items.FindByText(client.ContactGroup).Selected = true;
            txtEmail.Text = client.Email.Replace("`", "'");
            txtFirstname.Text = client.Firstname.Replace("`", "'");
            txtHomePhone.Text = client.HomePhoneNo;
            txtMiddlename.Text = client.Middlename.Replace("`", "'");
            txtMobilePhone.Text = client.MobilePhoneNo;
            txtSurname.Text = client.Surname.Replace("`", "'");
            txtWorkPhone.Text = client.WorkPhoneNo;
        }

        protected void btnAddNewContactGroup_Click(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            string groupName = Request.Form["txtAddNewContactGroup"];
            bool nameExists = db.ReadData("select id from contactgroups where name = '" + groupName + "'").Trim() != string.Empty;
            if (nameExists)
            {
                alertMessage = "<div class=\"alert alert-danger alert-dismissible\">" +
                      "<strong style=\"text-align:center\">Group Name already exists</strong>" +
                      "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                  "</div>";
            }
            else
            {
                db.ExecuteQuery("insert into ContactGroups(name) values ('" + groupName + "')");
                LoadContactGroups();
                ddlClientGroup.ClearSelection();
                ddlClientGroup.Items.FindByText(groupName).Selected = true;
            }
        }
        protected void LoadContactGroups()
        {
            ddlClientGroup.Items.Clear();
            ddlClientGroup.Items.Add(new ListItem("-select-", ""));
            DataTable contactGroups = new DataTable();
            contactGroups = new DB().ReadTable("Client Groups", "select distinct Name from ContactGroups order by Name");
            ddlClientGroup.ClearSelection();
            foreach (DataRow tRow in contactGroups.Rows)
                ddlClientGroup.Items.Add(new ListItem(tRow["Name"].ToString(), tRow["Name"].ToString()));
        }

        protected void btnSaveCase_Click(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            Client client = new Client(txtClientID.Text);
            //Check if email or Phone number exists
            if (client.ClientID == null)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                    "<strong style=\"text-align:center\">Client does not exist</strong>" +
                                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                "</div>";
                return;
            }

            Models.Case c = new Models.Case(txtCaseNumber.Text);
            //Check if case number exists
            if (c.CaseID != null)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                    "<strong style=\"text-align:center\">Case with case number: " + txtCaseNumber.Text + " already exists</strong>" +
                                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                "</div>";
                return;
            }

            c = new Models.Case
            {
                CaseNumber = txtCaseNumber.Text.Replace("'","`"),
                ClientID = txtClientID.Text.Replace("MCo/", string.Empty).TrimStart('0').Replace("'", "`"),
                DateOpened = txtDateOpened.Text,// DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss tt"),
                Description = txtDescription.Text.Replace("'", "`"),
                Name = txtCaseName.Text.Replace("'", "`"),
                PracticeArea = ddlPracticeArea.SelectedItem.Text.Replace("'", "`"),
                Stage = ddlCaseStages.SelectedItem.Text.Replace("'", "`"),
                Type = ddlCaseType.SelectedItem.Text.Replace("'", "`")
            };

            if (c.CaseNumber.Trim() == string.Empty ||
                c.Description.Trim() == string.Empty ||
                c.DateOpened.Trim() == string.Empty)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                    "<strong style=\"text-align:center\">All case registration fields are required</strong>" +
                                    "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                "</div>";
                return;
            }
            else if (c.Add())
            {
                ltrMessage.Text = "<div class=\"alert alert-success alert-dismissible\">" +
                                         "<strong style=\"text-align:center\">Case registered successfully</strong>" +
                                         "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                     "</div>";
                try
                {
                    //Create Directories to house Documents for the case
                    string root = "../Briefcase/" + txtCaseName.Text + " " + txtCaseNumber.Text.Replace('/', '_');
                    Directory.CreateDirectory(Server.MapPath(root));
                    if (ddlCaseType.SelectedItem.Text == "Litigation")
                    {
                        string commencement = root + "/Commencement";
                        string trial = root + "/Trial";
                        string adoption = root + "/Adoption of Address";
                        string judgement = root + "/Judgement";
                        string closure = root + "/Closure";
                        Directory.CreateDirectory( Server.MapPath(commencement));
                        Directory.CreateDirectory(Server.MapPath(trial));
                        Directory.CreateDirectory(Server.MapPath(adoption));
                        Directory.CreateDirectory(Server.MapPath(judgement));
                        Directory.CreateDirectory(Server.MapPath(closure));
                    }
                    else
                    {
                        string firstDraft = root + "/First Draft"; ;
                        string finalDraft = root + "/Final Draft";
                        Directory.CreateDirectory(Server.MapPath(firstDraft));
                        Directory.CreateDirectory(Server.MapPath(finalDraft));
                    }
                }
                catch (Exception ex)
                {
                    ltrMessage.Text += "<div class=\"alert alert-danger alert-dismissible\">" +
                                            "<strong style=\"text-align:center\">" + ex.Message + "</strong>" +
                                            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                        "</div>";
                    return;
                }
            }
            else
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                      "<strong style=\"text-align:center\">Unable to Register case. Please try again</strong>" +
                      "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                  "</div>";
            }
        }

        protected void btnAddnewPracticeArea_Click(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            string practiceName = Request.Form["txtAddNewPracticeArea"];
            bool nameExists = db.ReadData("select id from PracticeAreas where name = '" + practiceName + "'").Trim() != string.Empty;
            if (nameExists)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger\">" +
                      "<strong style=\"text-align:center\">Practice Area already exists</strong>" +
                      "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                  "</div>";
            }
            else
            {
                db.ExecuteQuery("insert into PracticeAreas(name) values ('" + practiceName + "')");
                LoadPracticeAreas();
                ddlPracticeArea.ClearSelection();
                ddlPracticeArea.Items.FindByText(practiceName).Selected = true;
            }
        }
        protected void LoadPracticeAreas()
        {
            ddlPracticeArea.Items.Clear();
            ddlPracticeArea.Items.Add(new ListItem("-select-", ""));
            DataTable practiceAreas = new DataTable();
            practiceAreas = new DB().ReadTable("Practice Areas", "select distinct Name from PracticeAreas order by Name");
            ddlPracticeArea.ClearSelection();
            foreach (DataRow tRow in practiceAreas.Rows)
                ddlPracticeArea.Items.Add(new ListItem(tRow["Name"].ToString(), tRow["Name"].ToString()));
        }
    }
}