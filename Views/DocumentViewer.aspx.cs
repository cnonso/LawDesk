using DevExpress.Web.ASPxRichEdit;
using DevExpress.XtraRichEdit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk.Views
{
    public partial class DocumentViewer : System.Web.UI.Page
    {
        protected string alertType = "alert alert-info", alertMessage = "PRESS F5 TO REFRESH IF CONTENT IS BLANK";
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.Sleep(5000); //Delay for 5 seconds so that  Session["file"] state must have completed
            if (Session["file"] != null)
            {
                var filePath = Session["file"];
                string ext = Session["ext"].ToString();
                if (ext == ".docx" || ext == ".doc")
                {
                    ASPxRichEdit1.Open(Server.MapPath(filePath.ToString()), DocumentFormat.OpenXml);
                    sprSht.Visible = false;
                    ASPxRichEdit1.Visible = true;
                } 
                else if (ext == ".xlsx" || ext == ".xls")
                {
                    sprSht.Open(Server.MapPath(filePath.ToString()), DevExpress.Spreadsheet.DocumentFormat.Xlsx);
                    ASPxRichEdit1.Visible = false;
                    sprSht.Visible = true;
                }
                else if (ext == ".pdf")
                {
                    string path = filePath.ToString();
                    Response.Redirect(filePath.ToString());
                    ASPxRichEdit1.Visible = false;
                    sprSht.Visible = false;
                }
                else
                {
                    alertType = "alert alert-danger";
                    alertMessage = "UNABLE TO VIEW DOCUMENT OF THIS TYPE. DOWNLOAD INSTEAD";
                    ASPxRichEdit1.Visible = false;
                    sprSht.Visible = false;
                }
            }
        }
    }
}