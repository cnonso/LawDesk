using DevExpress.DataProcessing;
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
    public partial class EditCase : System.Web.UI.Page
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
            if (Request.QueryString["cid"] == null)
                Response.Redirect("~/Default.aspx");

            if (!IsPostBack)
            {
                LoadCaseTypes();
                LoadPracticeAreas();
                LoadCourts();
                GetCaseDetail(AppHandler.Decrypt(Request.QueryString["cid"]));

            }
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
        private void GetCaseDetail(string cid)
        {
            DataTable caseDetail = new DB().ReadTable("CaseDetail", "select * from casedetails where caseid =" + cid);
            if (caseDetail.Rows.Count > 0)
            {

                txtCaseID.Text = caseDetail.Rows[0]["CaseID"].ToString();

                txtClientID.Text = caseDetail.Rows[0]["ClientID"].ToString();
                LoadClients(caseDetail.Rows[0]["ClientID"].ToString());

                ddlClients.ClearSelection();
                ddlClients.Items.FindByValue(caseDetail.Rows[0]["ClientID"].ToString()).Selected = true;

                txtCaseName.Text = caseDetail.Rows[0]["Name"].ToString().Replace("`", "'");

                ddlCaseType.ClearSelection();
                ddlCaseType.Items.FindByText(caseDetail.Rows[0]["Type"].ToString()).Selected = true;

                LoadCaseCategories(ddlCaseType.SelectedItem.Value);
                ddlCaseCategory.ClearSelection();
                ddlCaseCategory.Items.FindByText(caseDetail.Rows[0]["Category"].ToString()).Selected = true;
                txtCategoryID.Text = ddlCaseCategory.SelectedItem.Value;

                try
                {
                    LoadCaseStages(ddlCaseCategory.SelectedItem.Value);
                    ddlCaseStages.ClearSelection();
                    ddlCaseStages.Items.FindByText(caseDetail.Rows[0]["Stage"].ToString()).Selected = true;
                }
                catch { }

                txtDateOpened.Text = Convert.ToDateTime(caseDetail.Rows[0]["DateOpened"]).ToString("yyyy-MM-dd");

                txtCaseNumber.Text = caseDetail.Rows[0]["CaseNumber"].ToString().Replace("`", "'");

                ddlPracticeArea.ClearSelection();
                ddlPracticeArea.Items.FindByText(caseDetail.Rows[0]["PracticeArea"].ToString()).Selected = true;

                ddlCourts.ClearSelection();
                ddlCourts.Items.FindByText(caseDetail.Rows[0]["Court"].ToString()).Selected = true;


                txtDescription.Text = caseDetail.Rows[0]["Description"].ToString().Replace("`", "'");

                //Grab the original folder directory and case names for rename purpose 
                //txtOldFolderDir.Text = "../Briefcase/" + ddlCaseType.SelectedItem.Text + "/" + ddlCaseCategory.SelectedItem.Text + "/" + txtCaseName.Text + " " + txtCaseNumber.Text.Replace('/', '_');
                txtOldFolderDir.Text = "../Briefcase/" + ddlCaseType.SelectedItem.Text + "/" + ddlCaseCategory.SelectedItem.Text;
                if (ddlCaseType.SelectedItem.Text == "Arbitration")
                    txtOldFolderDir.Text = "../Briefcase/" + ddlCaseType.SelectedItem.Text;

                txtCaseNameOriginal.Text = txtCaseName.Text;
                txtOldCaseType.Text = caseDetail.Rows[0]["Type"].ToString();
            }
            else
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                   "<strong style=\"text-align:center\">Case not found</strong>" +
                                   "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                   "<span aria-hidden=\"true\">&times;</span>" +
                                   "</button>" +
                               "</div>";
            }
        }

        protected void LoadClients(string clientID)
        {
            ltrMessage.Text = "";
            ddlClients.Items.Clear();
            DataTable clients = new DB().ReadTable("Clients", "select surname+' '+firstname+ isnull(middlename,'') as Name, ClientID from clients where clientid = " + clientID + " order by Name");
            foreach (DataRow dr in clients.Rows)
                ddlClients.Items.Add(new ListItem(dr["Name"].ToString(), dr["ClientID"].ToString()));
        }
        private void LoadCaseCategories(string typeID)
        {
            ltrMessage.Text = "";
            ddlCaseCategory.Items.Clear();
            ddlCaseCategory.Items.Add(new ListItem("--select--", ""));
            DataTable caseCategories = new DB().ReadTable("caseCategories", "select  * from caseCategories where typeid = '" + typeID + "' order by Name");
            foreach (DataRow dr in caseCategories.Rows)
                ddlCaseCategory.Items.Add(new ListItem(dr["Name"].ToString(), dr["ID"].ToString()));
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

        protected void ddlCaseType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ltrMessage.Text = "";
            ddlCaseCategory.Items.Clear();
            ddlCaseCategory.Items.Add(new ListItem("--select--", ""));
            DataTable caseCategories = new DB().ReadTable("caseCategories", "select  * from caseCategories where typeid = '" + ddlCaseType.SelectedItem.Value + "' order by Name");
            foreach (DataRow dr in caseCategories.Rows)
                ddlCaseCategory.Items.Add(new ListItem(dr["Name"].ToString(), dr["ID"].ToString()));

        }

        protected void ddlCaseCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCaseStages(ddlCaseCategory.SelectedItem.Value);
        }
        protected void LoadCaseStages(string catID)
        {
            ltrMessage.Text = "";
            ddlCaseStages.Items.Clear();
            ddlCaseStages.Enabled = false;
            DataTable caseStages = new DB().ReadTable("caseStages", "select  * from casestages where catID = " + catID + " order by Step");
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
            //if (c.CaseID != null)
            //{
            //    ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
            //                        "<strong style=\"text-align:center\">Case with case number: " + txtCaseNumber.Text + " already exists</strong>" +
            //                        "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
            //                        "<span aria-hidden=\"true\">&times;</span>" +
            //                        "</button>" +
            //                    "</div>";
            //    return;
            //}

            string stage = "";
            try
            {
                stage = ddlCaseStages.SelectedItem.Text.Replace("'", "`");
            }
            catch { }
            c = new Models.Case
            {
                CaseID = txtCaseID.Text,
                ClientID = ddlClients.SelectedItem.Value.Replace("MCo/", string.Empty).TrimStart('0').Replace("'", "`"),
                Name = txtCaseName.Text.Replace("'", "`"),
                Type = ddlCaseType.SelectedItem.Text.Replace("'", "`"),
                Category = ddlCaseCategory.SelectedItem.Text,
                CaseNumber = txtCaseNumber.Text.Replace("'", "`"),
                DateOpened = txtDateOpened.Text,// DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss tt"),
                Description = txtDescription.Text.Replace("'", "`"),
                PracticeArea = ddlPracticeArea.SelectedItem.Text.Replace("'", "`"),
                TypeID = ddlCaseType.SelectedItem.Value,
                CategoryID = ddlCaseCategory.SelectedItem.Value,
                Stage = stage,
                Court = ddlCourts.SelectedItem.Text
            };

            if (c.ClientID.Trim() == string.Empty ||
                c.Name.Trim() == string.Empty ||
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
            else if (c.Update())
            {
                ltrMessage.Text = "<div class=\"alert alert-success alert-dismissible\">" +
                                         "<strong style=\"text-align:center\">Case updated successfully</strong>" +
                                         "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                    "<span aria-hidden=\"true\">&times;</span>" +
                                    "</button>" +
                                     "</div>";

                //Check if case type has been modified. if modified, create a new set of folder and sub-folders. 
                //Also, the old folders will become renamed and archived.
                if (ddlCaseCategory.SelectedItem.Value != txtCategoryID.Text)
                {
                    //Rename old folder
                    string sourceFolderDir = txtOldFolderDir.Text;
                    //string destinationFolderDir = txtOldFolderDir.Text + "/Archived";
                    string destinationFolderDir = "../Briefcase/Archived/" + txtOldCaseType.Text;
                    //Directory.CreateDirectory(Server.MapPath(destinationFolderDir));

                    //Create Sub-dirctories for the archive folder
                    //DataTable oldcaseStages = new DB().ReadTable("caseStages", "select  * from caseStages2 where catid = " + txtCategoryID.Text + " order by Step");
                    //if (oldcaseStages.Rows.Count > 0)
                    //    foreach (DataRow dr in oldcaseStages.Rows)
                    //    {
                    //        string subFolder = txtOldFolderDir.Text + "/Archived" + "/" + dr["Name"].ToString();
                    //        Directory.CreateDirectory(Server.MapPath(subFolder));
                    //    }

                    try
                    {
                        Directory.Move(Server.MapPath(sourceFolderDir), Server.MapPath(destinationFolderDir));
                    }
                    catch { }
                    try
                    {
                        //Create new Directories to house Documents for the case
                        string root = "../Briefcase/" + ddlCaseType.SelectedItem.Text + "/" + ddlCaseCategory.SelectedItem.Text + "/" + txtCaseName.Text + " " + txtCaseNumber.Text.Replace('/', '_');
                        if (ddlCaseType.SelectedItem.Text == "Arbitration")
                            root = "../Briefcase/" + ddlCaseType.SelectedItem.Text + "/" + txtCaseName.Text + " " + txtCaseNumber.Text.Replace('/', '_');

                        Directory.CreateDirectory(Server.MapPath(root));

                        DataTable caseStages = new DB().ReadTable("caseStages", "select  * from caseStages where typeid = " + ddlCaseType.SelectedItem.Value + " order by Step");
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

                //Check if case type wasn't modified but case name is modified. if so, create a corresponding folder and sub-folders. 
                //and move the old folders to the new one.
                else if (txtCaseNameOriginal.Text != txtCaseName.Text)
                {
                    //Rename old folder
                    string oldFolderDir = txtOldFolderDir.Text;
                    string newFolderDir = "../Briefcase/" + ddlCaseType.SelectedItem.Text + "/" + ddlCaseCategory.SelectedItem.Text + "/" + txtCaseName.Text + " " + txtCaseNumber.Text.Replace('/', '_');
                    Directory.CreateDirectory(Server.MapPath(newFolderDir));
                    Directory.Move(oldFolderDir, newFolderDir);
                }
            }
            else
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                      "<strong style=\"text-align:center\">Unable to update case. Please try again</strong>" +
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