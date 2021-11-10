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
    public partial class ClientDirectory : System.Web.UI.Page
    {
        protected string tableBuilder = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null)
                Response.Redirect("~/Default.aspx");
            if (Session["UserType"].ToString().ToLower() != "admin")
                Response.Redirect("~/Default.aspx");
            LoadClients();
        }
        protected void LoadClients()
        {
            DataTable results = new DB().ReadTable("", "select * from clients order by surName, firstname, middlename");

            if (results.Rows.Count > 0)
            {
                int n = 0;
                foreach (DataRow dr in results.Rows)
                {
                    ++n;                     
                    tableBuilder += "<tr>" +
                               "    <td>" + n + "</td>" +
                               "      <td>" + dr["SurName"]+" " + dr["FirstName"]+" " + dr["Middlename"] + "</td> " +
                               "      <td>" + dr["Email"] + "</td>" +
                               "      <td>" + dr["contactgroup"] + "</td>" +
                               "      <td>" + dr["MobilePhoneNo"] + " " + dr["WorkPhoneNo"] + " " + dr["HomePhoneNo"] + "</td> " +
                               "      <td>" + dr["Address"] + "</td>" +
                               "</tr>";
                }
            }
        }
    }
}