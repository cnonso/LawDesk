using LawDesk.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["error"] != null)
                    FailureText.Text = "Access denied, you must login first";
            }
            UserName.Focus();
            DeleteTempFiles();
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            //System.Data.DataTable users = new DB().ReadTable("Users");

            User user = new User(UserName.Text, Password.Text);
            //Staff user = new Staff(UserName.Text, UserName.Text, Password.Text);

            if (user.ExecutionError.Length > 0)
                FailureText.Text = "Error! Your Internet connection is very poor.";
            else if (user.Exists)
            {
                user = new User(UserName.Text);
                if (user.UserType == "admin")
                {
                    System.IO.File.WriteAllText(Server.MapPath("~/Sessions/username.sess"), user.Username);
                    user.UpdateLogin();
                    Session["username"] = user.Username; 
                    Session["UserType"] = user.UserType;
                    Session["StaffID"] = user.ID; 
                    Session.Timeout = 1440;
                     Response.Redirect("~/Views/Dashboard.aspx");
                }
                else
                {
                    if (int.Parse(user.RoleID) > 1) 
                    {
                        System.IO.File.WriteAllText(Server.MapPath("~/Sessions/staff.sess"), user.Username);
                        DateTime dt = DateTime.Now;
                        dt.AddHours(24);
                        Response.Cookies["users"]["sales"] = user.Username;
                        Response.Cookies["users"].Expires = dt;
                        Response.Cookies["users"]["time"] = DateTime.Now.Ticks.ToString();
                        user.UpdateLogin();
                        Session["username"] = user.Username; 
                        Session["UserType"] = user.UserType;
                        Session["StaffID"] = user.ID; 
                        Session.Timeout = 1440;
                        
                        Response.Redirect("~/Views/Personnel/Default.aspx");
                    }

                    else
                        FailureText.Text = "Access denied! You are not a registered user.";
                }
            }
            else
                FailureText.Text = "Invalid username or password. ";
        }

        private void DeleteTempFiles()
        {
            string tempPath = "Temp/";
            System.IO.FileInfo[] files = new System.IO.DirectoryInfo(Server.MapPath(tempPath)).GetFiles();
            if (files.Length > 0)
            {
                foreach (System.IO.FileInfo fi in files)
                {
                    long interval = (DateTime.Now.Ticks - fi.CreationTime.Ticks) / 10000000;
                    if (interval / 3600 > 1)
                        fi.Delete();
                }
            }
        }

    }
}