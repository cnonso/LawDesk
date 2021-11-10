using DevExpress.Web;
using DevExpress.Web.ASPxRichEdit;
using DevExpress.XtraRichEdit;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk.Views
{
    public partial class DocumentManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null)
                Response.Redirect("~/Default.aspx");
            if (Session["UserType"].ToString().ToLower() != "admin")
                Response.Redirect("~/Default.aspx");

        }
        private void InitializeFileManager()
        {
            ASPxFileManager fm = new ASPxFileManager();
            FileManagerToolbarMoveButton moveButton = new FileManagerToolbarMoveButton();
            moveButton.BeginGroup = false;

            FileManagerToolbarCustomButton customButton = new FileManagerToolbarCustomButton();
            customButton.CommandName = "Properties";
            customButton.BeginGroup = true;
            customButton.Image.IconID = "setup_properties_16x16";

            //FileManager.SettingsContextMenu.Items.Add(moveButton);
            //FileManager.SettingsContextMenu.Items.Add(customButton);
        }

        protected void ASPxFileManager1_CustomCallback(object sender, CallbackEventArgsBase e)
        {
            string s = e.Parameter;
            var file = ASPxFileManager1.SelectedFile;
            Session["file"] = file;
            var fileInfo = new FileInfo(MapPath(file.FullName));

            string ext = file.Extension;
            Session["ext"] = ext;

            ASPxRichEdit richEdit = new ASPxRichEdit();
            if (ext == ".docx" || ext == ".doc")
                richEdit.Open(Server.MapPath(file.ToString()), DocumentFormat.OpenXml);

            //docViewer.Controls.Add(richEdit);

            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('~/views/DocumentViewer.aspx','_blank')", true);

            //Response.Write("<script>window.open('~/views/DocumentViewer.aspx','Document Viewer','width=1200,height=700,scrollbars=yes')</script>");
            //Page_Load(sender, e);
            //if(file.Extension == ".docx"||file.Extension == ".doc")
            //ASPxRichEdit1.Open(Server.MapPath(file.ToString()), DocumentFormat.OpenXml);
        }
    }
}