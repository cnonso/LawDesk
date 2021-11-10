using DevExpress.XtraRichEdit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk.Samples
{
    public partial class DocumentEditors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string filePath = @"\Briefcase\Nonso.docx";
            rEdit1.Open(Server.MapPath(filePath), DocumentFormat.OpenXml);
            string filePath2 = @"\Briefcase\Book1.xlsx";
            sprSht.Open(Server.MapPath(filePath2));
        }

    }
}