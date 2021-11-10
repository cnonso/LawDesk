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
    public partial class CaseRegistration : System.Web.UI.Page
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
                LoadClients();
                LoadCaseTypes();
                LoadPracticeAreas();
                LoadCourts();
            }
        }

        protected void LoadClients()
        {
            ltrMessage.Text = "";
            ddlClients.Items.Clear();
            ddlClients.Items.Add(new ListItem("--select--", ""));
            DataTable clients = new DB().ReadTable("Clients", "select surname+' '+firstname+ isnull(middlename,'') as Name, ClientID from clients order by Name");
            foreach (DataRow dr in clients.Rows)
                ddlClients.Items.Add(new ListItem(dr["Name"].ToString(), dr["ClientID"].ToString()));
        }
        protected void LoadCaseTypes()
        {
            ltrMessage.Text = "";
            ddlCaseType.Items.Clear();
            ddlCaseType.Items.Add(new ListItem("--select--", ""));
            DataTable caseTypes = new DB().ReadTable("caseTypes", "select  * from caseTypes order by Name");
            foreach (DataRow dr in caseTypes.Rows)
                ddlCaseType.Items.Add(new ListItem(dr["Name"].ToString(), dr["ID"].ToString()));
        }
        protected void LoadCourts()
        {
            ltrMessage.Text = "";
            ddlCourts.Items.Clear();
            ddlCourts.Items.Add(new ListItem("--select--", ""));
            DataTable clients = new DB().ReadTable("Courts", "select * from Courts order by Name");
            foreach (DataRow dr in clients.Rows)
                ddlCourts.Items.Add(new ListItem(dr["Name"].ToString(), dr["Name"].ToString()));
        }
        protected void ddlCaseType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            ddlCaseCategory.Items.Clear();
            ddlCaseCategory.Items.Add(new ListItem("--select--", ""));
            DataTable caseCategories = new DB().ReadTable("caseCategories", "select  * from caseCategories where typeid = '" + ddlCaseType.SelectedItem.Value + "' order by Name");
            foreach (DataRow dr in caseCategories.Rows)
                ddlCaseCategory.Items.Add(new ListItem(dr["Name"].ToString(), dr["ID"].ToString()));

            //LoadCaseStages(ddlCaseType.SelectedItem.Value);
        }

        protected void LoadCaseStages(string typeID)
        {
            ltrMessage.Text = "";
            ddlCaseStages.Items.Clear();
            ddlCaseStages.Enabled = false;
            DataTable caseStages = new DB().ReadTable("caseStages", "select  * from caseStages where typeid = " + typeID + " order by Step");
            if (caseStages.Rows.Count > 0)
            {
                ddlCaseStages.Enabled = true;
                ddlCaseStages.Items.Add(new ListItem("--select--", ""));
                foreach (DataRow dr in caseStages.Rows)
                    ddlCaseStages.Items.Add(new ListItem(dr["Name"].ToString(), dr["ID"].ToString()));
            }
        }
        protected void btnSaveCase_Click(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            string clientID = ddlClients.SelectedItem.Value;
            Client client = new Client(clientID);
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

            string stage = "";
            try
            {
                stage = ddlCaseStages.SelectedItem.Text.Replace("'", "`");
            }
            catch { }
            c = new Models.Case
            {
                CaseNumber = txtCaseNumber.Text.Replace("'", "`"),
                ClientID = ddlClients.SelectedItem.Value.Replace("MCo/", string.Empty).TrimStart('0').Replace("'", "`"),
                DateOpened = txtDateOpened.Text,// DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss tt"),
                Description = txtDescription.Text.Replace("'", "`"),
                Name = txtCaseName.Text.Replace("'", "`"),
                PracticeArea = ddlPracticeArea.SelectedItem.Text.Replace("'", "`"),
                Stage = stage,
                Type = ddlCaseType.SelectedItem.Text.Replace("'", "`"),
                Category = ddlCaseCategory.SelectedItem.Text,
                TypeID = ddlCaseType.SelectedItem.Value,
                CategoryID = ddlCaseCategory.SelectedItem.Value,
                Court=ddlCourts.SelectedItem.Text
            };

            if (c.Name.Trim() == string.Empty ||
                c.Type.Trim() == string.Empty ||
                c.Category.Trim() == string.Empty ||
                c.DateOpened.Trim() == string.Empty ||
                c.CaseNumber.Trim() == string.Empty ||
                c.Court.Trim() == string.Empty ||
                c.Description.Trim() == string.Empty)
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
                //try
                //{
                //    //Create Directories to house Documents for the case
                //    string root = "../Briefcase/" + txtCaseName.Text + " " + txtCaseNumber.Text.Replace('/', '_');
                //    Directory.CreateDirectory(Server.MapPath(root));
                //    if (ddlCaseType.SelectedItem.Text == "Litigation")
                //    {
                //        string commencement = root + "/Commencement";
                //        string trial = root + "/Trial";
                //        string adoption = root + "/Adoption of Address";
                //        string judgement = root + "/Judgement";
                //        string closure = root + "/Closure";
                //        Directory.CreateDirectory(Server.MapPath(commencement));
                //        Directory.CreateDirectory(Server.MapPath(trial));
                //        Directory.CreateDirectory(Server.MapPath(adoption));
                //        Directory.CreateDirectory(Server.MapPath(judgement));
                //        Directory.CreateDirectory(Server.MapPath(closure));
                //    }
                //    else
                //    {
                //        string firstDraft = root + "/First Draft"; ;
                //        string finalDraft = root + "/Final Draft";
                //        Directory.CreateDirectory(Server.MapPath(firstDraft));
                //        Directory.CreateDirectory(Server.MapPath(finalDraft));
                //    }
                //}
                //catch (Exception ex)
                //{
                //    ltrMessage.Text += "<div class=\"alert alert-danger alert-dismissible\">" +
                //                            "<strong style=\"text-align:center\">" + ex.Message + "</strong>" +
                //                            "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                //                    "<span aria-hidden=\"true\">&times;</span>" +
                //                    "</button>" +
                //                        "</div>";
                //    return;
                //}
                try
                {
                    //Create Directories to house Documents for the case
                    string root = "../Briefcase/" + ddlCaseType.SelectedItem.Text + "/" + ddlCaseCategory.SelectedItem.Text + "/" + txtCaseName.Text + " " + txtCaseNumber.Text.Replace('/', '_');
                    if (ddlCaseType.SelectedItem.Text == "Arbitration")
                        root = "../Briefcase/" + ddlCaseType.SelectedItem.Text + "/" + txtCaseName.Text + " " + txtCaseNumber.Text.Replace('/', '_');

                    Directory.CreateDirectory(Server.MapPath(root));

                    //DataTable caseStages = new DB().ReadTable("caseStages", "select  * from caseStages where typeid = " + ddlCaseType.SelectedItem.Value + " order by Step");
                    DataTable caseStages = new DB().ReadTable("caseStages", "select  * from caseStages where catid = " + ddlCaseCategory.SelectedItem.Value + " order by Step");
                    if (caseStages.Rows.Count > 0)
                        foreach (DataRow dr in caseStages.Rows)
                        {
                            string subFolder = root + "/" + dr["Name"].ToString();
                            Directory.CreateDirectory(Server.MapPath(subFolder));
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

        protected void ddlCaseCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCaseStages2(ddlCaseCategory.SelectedItem.Value);
        }
        protected void LoadCaseStages2(string catID)
        {
            ltrMessage.Text = "";
            ddlCaseStages.Items.Clear();
            ddlCaseStages.Enabled = false;
            DataTable caseStages = new DB().ReadTable("caseStages", "select  * from caseStages where catID = " + catID + " order by Step");
            if (caseStages.Rows.Count > 0)
            {
                ddlCaseStages.Enabled = true;
                ddlCaseStages.Items.Add(new ListItem("--select--", ""));
                foreach (DataRow dr in caseStages.Rows)
                    ddlCaseStages.Items.Add(new ListItem(dr["Name"].ToString(), dr["ID"].ToString()));
            }
        }
    }
}