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
    public partial class CaseDirectory : System.Web.UI.Page
    {
        protected string tableBuilder = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null)
                Response.Redirect("~/Default.aspx");
            if (Session["UserType"].ToString().ToLower() != "admin")
                Response.Redirect("~/Default.aspx");
            LoadCases();
        }
        protected void LoadCases()
        {
            DataTable results = new DB().ReadTable("", "select * from casedetails order by Name");

            if (results.Rows.Count > 0)
            {
                int n = 0;
                foreach (DataRow dr in results.Rows)
                {
                    ++n;
                    string dateOpened = "";

                    try { dateOpened = Convert.ToDateTime(dr["DateOpened"]).ToShortDateString(); }
                    catch { }
                    string edit = "<a style='color:teal' href=\"../views/EditCase.aspx?cid=" + AppHandler.Encrypt(dr["CaseID"].ToString()) + "\" target=\"blank\">Edit</a>";
                    string view = "<a style='color:teal' href=\"../views/Case.aspx?z=" + AppHandler.Encrypt(dr["type"].ToString()) + "&q=" + AppHandler.Encrypt(dr["category"].ToString()) + "&c=" + AppHandler.Encrypt(dr["CaseID"].ToString()) + "\">View</a>";
                    tableBuilder += "<tr>" +
                               "    <td>" + n + "</td>" +
                               "      <td>" + dr["Name"] + "</td> " +
                               "      <td>" + dr["CaseNumber"] + "</td>" +
                               "      <td>" + dr["Type"] + "</td>" +
                               "      <td>" + dr["Category"] + "</td> " +
                               "      <td>" + dr["Stage"] + "</td>" +
                               "      <td>" + dateOpened + "</td>" +
                               "      <td>" + edit + " | " + view + "</td>" +
                               "</tr>";
                }
            }
        }
    }
}