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
    public partial class Litigation : System.Web.UI.Page
    {
        protected string tableBuilder = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadStaff();
        }
        protected void LoadStaff()
        {
            DataTable results = new DB().ReadTable("", "select top 4 * from users where usertype = 'support staff' or usertype = 'lawyer' order by Name");

            if (results.Rows.Count > 0)
            {
                foreach (DataRow dr in results.Rows)
                {
                    string userType = dr["UserType"] + "";
                    if (userType == "Lawyer")
                        userType = "<span class='badge badge-success'>Lawyer</span>";
                    else if (userType == "Support Staff")
                        userType = "<span class='badge badge-warning'>Support Staff</span>";
                    else userType = "<span class='badge badge-info'>" + userType + "</span>";

                    string checkBox = "<input id='" + dr["UserID"] + "' name='Staff' type='checkbox' value = '" + dr["UserID"] + "' />";
                    tableBuilder += "<tr>" +
                               "    <td>" + checkBox + "</td>" +
                               "      <td>" + dr["Name"] + "</td> " +
                               "      <td>" + userType + "</td>" +
                               "      <td>" + dr["TaskLoad"] + "</td>" +
                               "</tr>";
                }
            }
        }

        protected void btnRemoveStaff_Click(object sender, EventArgs e)
        {

        }
    }
}