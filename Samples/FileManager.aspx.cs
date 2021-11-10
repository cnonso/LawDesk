using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LawDesk.Samples
{
    public partial class FileManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxFileManager1_CustomCallback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            string s = e.Parameter;
            var file = ASPxFileManager1.SelectedFile;
            var fileInfo = new FileInfo(MapPath(file.FullName));

        }
    }
}