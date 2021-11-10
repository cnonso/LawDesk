using DevExpress.DataProcessing;
using LawDesk.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk.Views
{
    public partial class Case : System.Web.UI.Page
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
                string caseType = AppHandler.Decrypt(Request.QueryString["z"]);
                string caseCategory = AppHandler.Decrypt(Request.QueryString["q"]);
                LoadCases(caseType, caseCategory);
                if (Request.QueryString["c"] != null)
                {
                    ddlCases.ClearSelection();
                    string caseID = AppHandler.Decrypt(Request.QueryString["c"]);
                    ddlCases.Items.FindByValue(caseID).Selected = true;
                    ddlCases_SelectedIndexChanged(sender, e);
                }
                //Encrypt(); 
                //LoadCaseStages();
            }
        }
        protected void LoadStaff(string caseID)
        {
            string query = @"select c.Stage, a.*, u.* from CaseAssignedStaff a 
                            inner join Users u on a.StaffID = u.UserID 
                            inner join CaseDetails c on a.CaseID = c.CaseID
                            where a.CaseID = '" + caseID + "' order by a.StaffName";

            DataTable results = new DB().ReadTable("", query);

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

                    string checkBox = "<input id='" + dr["UserID"] + "' name='Staff' type='checkbox' value = '" + dr["UserID"] + "' />";
                    string taskLoad = new DB().ReadData("select count (id) from CaseAssignedStaff cas left join CaseDetails cd on cas.CaseID=cd.CaseID where staffID = '" + dr["UserID"] + "'  and cd.status='Ongoing'");
                    tableBuilder += "<tr>" +
                               "    <td>" + n + "</td>" +
                               "      <td>" + dr["title"] + " " + dr["surName"] + " " + dr["firstname"] + " " + dr["middlename"] + "</td> " +
                               "      <td>" + userType + "</td>" +
                               //"      <td>" + dr["TaskLoad"] + "</td>" +
                               "      <td>" + taskLoad + "</td>" +
                               "</tr>";
                }
            }
        }


        protected void Encrypt()
        {
            Litigation.Text = AppHandler.Encrypt("Litigation");
            CommercialCase.Text = AppHandler.Encrypt("Commercial Case");
            Appeal.Text = AppHandler.Encrypt("Appeal");
            Trial.Text = AppHandler.Encrypt("Trial");
            Arbitration.Text = AppHandler.Encrypt("Arbitration");
            AgreementDrafting.Text = AppHandler.Encrypt("Agreement Drafting");
            ContractDrafting.Text = AppHandler.Encrypt("Contract Drafting");
        }
        protected void LoadCases(string caseType, string caseCategory)
        {
            ddlCases.Items.Clear();
            ddlCases.Items.Add(new ListItem("-Select Case-", ""));
            DataTable cases = new DB().ReadTable("Cases", "select *   from Casedetails where type='" + caseType + "' and category = '" + caseCategory + "' order by CaseID desc");
            foreach (DataRow tRow in cases.Rows)
                ddlCases.Items.Add(new ListItem(tRow["Name"] + " " + tRow["CaseNumber"], tRow["CaseID"].ToString()));


        }
        //protected void LoadCaseStages()
        //{
        //    string task = Request.QueryString["z"];
        //    if (task != null)
        //    {
        //        task = AppHandler.Decrypt(Request.QueryString["z"]);
        //        string[] litigationStages = new string[] { "Commencement", "Trial", "Adoption of Addresses", "Judgement", "Closure" };
        //        string[] commercialCaseStages = new string[] { "First Draft", "Final Draft" };
        //        string[] stages;
        //        if (task.ToLower() == "litigation") stages = litigationStages;
        //        else stages = commercialCaseStages;
        //        ddlCaseStages.Items.Clear();
        //        ddlCaseStages.Items.Add(new ListItem("Select Stage", ""));
        //        foreach (string stage in stages)
        //            ddlCaseStages.Items.Add(new ListItem(stage, stage));
        //    }
        //}
        protected void LoadCaseStages()
        {
            if (ddlCases.SelectedIndex > 0)
            {
                Models.Case c = new Models.Case(int.Parse(ddlCases.SelectedItem.Value));
                //string catID = new DB().ReadData("select categoryID from casedetails where caseid = '" + ddlCases.SelectedItem.Value + "'");
                string catID = c.CategoryID;
                ddlCaseStages.Items.Clear();
                ddlCaseStages.Items.Add(new ListItem("Select Stage", ""));
                DataTable stages = new DB().ReadTable("Stages", "select * from casestages where catID = '" + catID + "'");
                foreach (DataRow dr in stages.Rows)
                    //ddlCaseStages.Items.Add(new ListItem(dr["Name"].ToString(), dr["ID"].ToString()));
                    ddlCaseStages.Items.Add(new ListItem(dr["Name"].ToString(), dr["Name"].ToString()));

                ddlCaseStages.ClearSelection();
                ddlCaseStages.ClearSelection();
                ddlCaseStages.Items.FindByText(c.Stage).Selected = true;
            }
        }
        protected void ddlCases_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadStaff(ddlCases.SelectedItem.Value);
            LoadMilestones(ddlCases.SelectedItem.Value);
            LoadCaseStages();
        }

        protected string milestonesTableBuilder = "";
        protected void LoadMilestones(string caseID)
        {
            milestonesTableBuilder = "";
            string query = @"select * from milestones where CaseID = '" + caseID + "' order by id desc";

            DataTable results = new DB().ReadTable("", query);

            if (results.Rows.Count > 0)
            {
                int n = 0;
                foreach (DataRow dr in results.Rows)
                {
                    string dateAchieved = "";
                    try
                    {
                        dateAchieved = Convert.ToDateTime(dr["DateAchieved"]).ToShortDateString();
                    }
                    catch { }
                    ++n;
                    string edit = "<a style='cursor:pointer; color:blue' onclick=\"editMileStone('" + dr["ID"] + "','" + dr["Stage"] + "','" + Convert.ToDateTime(dr["DateAchieved"]).ToString("yyyy-MM-dd") + "','" + dr["Milestone"] + "')\">Edit</a>";
                    string remove = "<a style='cursor:pointer; color:red' onclick=\"removeMileStone('" + dr["ID"] + "')\"> Del</a>";
                    milestonesTableBuilder += "<tr>" +
                               "    <td>" + n + "</td>" +
                               "      <td>" + dr["Stage"] + "</td> " +
                               "      <td>" + dr["Milestone"] + "</td>" +
                               "      <td>" + dateAchieved + "</td>" +
                               "      <td>" + edit + " | " + remove + "</td>" +
                               "</tr>";
                }
            }
        }

        protected void btnSavemileStone_Click(object sender, EventArgs e)
        {
            if (Session["UserType"] == null)
                Response.Redirect("~/Default.aspx");

            ltrMessage.Text = "";
            string caseID = ddlCases.SelectedItem.Value,
                stage = ddlCaseStages.SelectedItem.Text,
                dateAchieved = Convert.ToDateTime(txtDate.Text).ToString("yyyy-MM-dd hh:mm:ss tt"),
                milestone = txtMilestone.Text.Replace("'", "`");
            if (ddlCases.SelectedIndex == 0 || ddlCaseStages.SelectedIndex == 0 || dateAchieved.Trim() == string.Empty || milestone.Trim() == string.Empty)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                 "<strong style=\"text-align:center\">Please select a case & stage, enter date and milesto</strong>" +
                                 "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                 "<span aria-hidden=\"true\">&times;</span>" +
                                 "</button>" +
                             "</div>";
                return;
            }
            try
            {

                if ((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
                {
                    var count = 0;
                    string supportingDocuments = "";
                    Models.Case c = new Models.Case(int.Parse(ddlCases.SelectedItem.Value));

                    foreach (HttpPostedFile uploadedFile in FileUpload1.PostedFiles)
                    {
                        string fn = System.IO.Path.GetFileName(uploadedFile.FileName);
                        //string casename = ddlCases.SelectedItem.Text.Replace("/", "_");
                        //string path = "~/Briefcase/" + casename + "/" + ddlCaseStages.SelectedItem.Text + "/" + fn;
                        string casename = c.Name.Replace("/", "_") + " " + c.CaseNumber.Replace("/", "_");
                        string path = "../Briefcase/" + c.Type + "/" + c.Category + "/" + casename + "/" + ddlCaseStages.SelectedItem.Text + "/" + fn;
                        string location = Server.MapPath(path);
                        supportingDocuments += path + "`";
                        try
                        {
                            uploadedFile.SaveAs(location);
                            count++;
                        }
                        catch (Exception ex)
                        {
                            ltrMessage.Text += "<div class=\"alert alert-danger alert-dismissible\">" +
                                   "<strong style=\"text-align:center\">Error uploading file</strong>" + ex.Message +
                                   "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                   "<span aria-hidden=\"true\">&times;</span>" +
                                   "</button>" +
                               "</div>";
                            return;
                        }
                    }
                    string query = @"insert into milestones (CaseID,Stage,DateAchieved,Milestone,SupportingDocuments)" +
                                      "values ('" + caseID + "','" + stage + "','" + dateAchieved + "','" + milestone + "','" + supportingDocuments + "');" +
                                      "update casedetails set stage = '" + stage + "' where caseid = '" + caseID + "'";

                    if (new DB().ExecuteQuery(query))
                    {
                        ltrMessage.Text += "<div class=\"alert alert-success alert-dismissible\">" +
                                  "<strong style=\"text-align:center\">Milestone saved. </strong>" + count + " file(s) were uploaded." +
                                  "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                  "<span aria-hidden=\"true\">&times;</span>" +
                                  "</button>" +
                              "</div>";
                    }

                }
                else
                {
                    string query = @"insert into milestones (CaseID,Stage,DateAchieved,Milestone,SupportingDocuments)" +
                                        "values ('" + caseID + "','" + stage + "','" + dateAchieved + "','" + milestone + "','')";

                    if (new DB().ExecuteQuery(query))
                    {
                        ltrMessage.Text += "<div class=\"alert alert-info alert-dismissible\">" +
                                     "<strong style=\"text-align:center\">Milestone saved. </strong>No file was uploaded." +
                                     "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                     "<span aria-hidden=\"true\">&times;</span>" +
                                     "</button>" +
                                 "</div>";
                    }
                }
            }
            catch (Exception ex)
            {
                ltrMessage.Text += "<div class=\"alert alert-danger alert-dismissible\">" +
                                 "<strong style=\"text-align:center\">Error saving milestone. </strong>" + ex.Message +
                                 "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                 "<span aria-hidden=\"true\">&times;</span>" +
                                 "</button>" +
                             "</div>";
            }
            LoadStaff(ddlCases.SelectedItem.Value);
            LoadMilestones(ddlCases.SelectedItem.Value);
            txtMilestone.Text = "";
        }

        protected void btnEncrypt_Click(object sender, EventArgs e)
        {
            string query = "";
            DataTable table = new DB().ReadTable("CaseCategories");
            foreach (DataRow dr in table.Rows)
            {
                query += "update CaseCategories set encryption = '" + AppHandler.Encrypt(dr["Name"].ToString()) + "' where id = " + dr["id"];
            }
            new DB().ExecuteQuery(query);
        }

        protected void btnUpdateMileStone_Click(object sender, EventArgs e)
        {
            if (Session["UserType"] == null)
                Response.Redirect("~/Default.aspx");

            ltrMessage.Text = "";
            string caseID = ddlCases.SelectedItem.Value,
                stage = ddlCaseStages.SelectedItem.Text,
                dateAchieved = Convert.ToDateTime(txtDate.Text).ToString("yyyy-MM-dd hh:mm:ss tt"),
                milestone = txtMilestone.Text.Replace("'", "`");
            if (ddlCases.SelectedIndex == 0 || ddlCaseStages.SelectedIndex == 0 || dateAchieved.Trim() == string.Empty || milestone.Trim() == string.Empty)
            {
                ltrMessage.Text = "<div class=\"alert alert-danger alert-dismissible\">" +
                                 "<strong style=\"text-align:center\">Please select a case & stage, enter date and milesto</strong>" +
                                 "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                 "<span aria-hidden=\"true\">&times;</span>" +
                                 "</button>" +
                             "</div>";
                return;
            }
            try
            {

                if ((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
                {
                    var count = 0;
                    string supportingDocuments = "";
                    Models.Case c = new Models.Case(int.Parse(ddlCases.SelectedItem.Value));

                    foreach (HttpPostedFile uploadedFile in FileUpload1.PostedFiles)
                    {
                        string fn = System.IO.Path.GetFileName(uploadedFile.FileName);
                        //string casename = ddlCases.SelectedItem.Text.Replace("/", "_");
                        //string path = "~/Briefcase/" + casename + "/" + ddlCaseStages.SelectedItem.Text + "/" + fn;
                        string casename = c.Name.Replace("/", "_") + " " + c.CaseNumber.Replace("/", "_");
                        string path = "../Briefcase/" + c.Type + "/" + c.Category + "/" + casename + "/" + ddlCaseStages.SelectedItem.Text + "/" + fn;
                        string location = Server.MapPath(path);
                        supportingDocuments += path + "`";
                        try
                        {
                            uploadedFile.SaveAs(location);
                            count++;
                        }
                        catch (Exception ex)
                        {
                            ltrMessage.Text += "<div class=\"alert alert-danger alert-dismissible\">" +
                                   "<strong style=\"text-align:center\">Error uploading file</strong>" + ex.Message +
                                   "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                   "<span aria-hidden=\"true\">&times;</span>" +
                                   "</button>" +
                               "</div>";
                            return;
                        }
                    }

                    string query = @"update milestones set Stage= '" + ddlCaseStages.SelectedItem.Text + "', DateAchieved ='" + txtDate.Text + "', Milestone = '" + txtMilestone.Text.Replace("'", "`") + "', supportingdocuments=supportingdocuments+'" + supportingDocuments + "' where id = '" + txtMilestoneID.Text + "'";

                    if (new DB().ExecuteQuery(query))
                    {
                        ltrMessage.Text += "<div class=\"alert alert-success alert-dismissible\">" +
                                  "<strong style=\"text-align:center\">Milestone saved. </strong>" + count + " file(s) were uploaded." +
                                  "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                  "<span aria-hidden=\"true\">&times;</span>" +
                                  "</button>" +
                              "</div>";
                    }

                }
                else
                {
                    string query = @"update milestones set Stage= '" + ddlCaseStages.SelectedItem.Text + "', DateAchieved ='" + txtDate.Text + "', Milestone = '" + txtMilestone.Text.Replace("'", "`") + "' where id = '" + txtMilestoneID.Text + "'";


                    if (new DB().ExecuteQuery(query))
                    {
                        ltrMessage.Text += "<div class=\"alert alert-info alert-dismissible\">" +
                                     "<strong style=\"text-align:center\">Milestone saved. </strong>No file was uploaded." +
                                     "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                     "<span aria-hidden=\"true\">&times;</span>" +
                                     "</button>" +
                                 "</div>";
                    }
                }
            }
            catch (Exception ex)
            {
                ltrMessage.Text += "<div class=\"alert alert-danger alert-dismissible\">" +
                                 "<strong style=\"text-align:center\">Error saving milestone. </strong>" + ex.Message +
                                 "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                                 "<span aria-hidden=\"true\">&times;</span>" +
                                 "</button>" +
                             "</div>";
            }
            LoadStaff(ddlCases.SelectedItem.Value);
            LoadMilestones(ddlCases.SelectedItem.Value);
            txtMilestone.Text = "";
        }

        protected void btnInitializeEdit_Click(object sender, EventArgs e)
        {
            DataTable caseDetail = new DB().ReadTable("milestones", "select * from milestones where id =" + txtMilestoneID.Text);
            if (caseDetail.Rows.Count > 0)
            {
                try
                {
                    ddlCaseStages.ClearSelection();
                    ddlCaseStages.Items.FindByText(caseDetail.Rows[0]["Stage"].ToString()).Selected = true;
                }
                catch { }
                txtDate.Text = Convert.ToDateTime(caseDetail.Rows[0]["DateAchieved"]).ToString("yyyy-MM-dd");

                txtMilestone.Text = caseDetail.Rows[0]["milestone"].ToString();
            }
        }

        protected void btnDeleteMilestone_Click(object sender, EventArgs e)
        {
            string query = @"delete from milestones where id = '" + txtMilestoneID.Text + "'";


            if (new DB().ExecuteQuery(query))
            {
                ltrMessage.Text += "<div class=\"alert alert-info alert-dismissible\">" +
                             "<strong style=\"text-align:center\">Milestone saved. </strong>No file was uploaded." +
                             "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">" +
                             "<span aria-hidden=\"true\">&times;</span>" +
                             "</button>" +
                         "</div>";
            }
            LoadStaff(ddlCases.SelectedItem.Value);
            LoadMilestones(ddlCases.SelectedItem.Value);
            txtMilestone.Text = "";
        }
    }
}