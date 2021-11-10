using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Xml.Linq;
using DevExpress.Web;
//using DevExpress.Web.Demos; 
using System.Web.UI.WebControls;
using System;

namespace LawDesk.Samples
{
    public partial class SampleFileManager : System.Web.UI.Page
    {
        Dictionary<string, string> extensionsDisplayName;

        Dictionary<string, string> ExtensionsDisplayName
        {
            get
            {
                if (extensionsDisplayName == null)
                    extensionsDisplayName = XDocument.Load(MapPath("~/Content/FileManager/ExtensionsDisplayName.xml")).Descendants("Extension").ToDictionary(n => n.Attribute("Extension").Value, n => n.Attribute("DisplayName").Value);
                return extensionsDisplayName;
            }
        }

        FileListView CurrentView
        {
            get
            {
                var view = Session["View"];
                return view == null ? FileListView.Thumbnails : (FileListView)Session["View"];
            }
            set
            {
                FileManager.SettingsFileList.View = value;
                Session["View"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            FileManager.SettingsFileList.View = CurrentView;
            bool isDetailsView = CurrentView.Equals(FileListView.Details);
            SetFileManagerToolbarItemCheckedState("ChangeView-Thumbnails", !isDetailsView);
            SetFileManagerToolbarItemCheckedState("ChangeView-Details", isDetailsView);
        }
        protected void ASPxFileManager_CustomCallback(object source, CallbackEventArgsBase e)
        {
            string s = e.Parameter;
            CurrentView = (FileListView)Enum.Parse(typeof(FileListView), e.Parameter.ToString());
        }
        protected void FileManager_ItemRenaming(object source, FileManagerItemRenameEventArgs e)
        {
            ValidateSiteEdit(e);
        }
        protected void FileManager_ItemMoving(object source, FileManagerItemMoveEventArgs e)
        {
            ValidateSiteEdit(e);
        }
        protected void FileManager_ItemCopying(object source, FileManagerItemCopyEventArgs e)
        {
            ValidateSiteEdit(e);
        }
        protected void FileManager_ItemDeleting(object source, FileManagerItemDeleteEventArgs e)
        {
            ValidateSiteEdit(e);
        }
        protected void PopupControl_WindowCallback(object source, PopupWindowCallbackArgs e)
        {
            //switch (e.Parameter)
            //{
            //    case "Files":
            //        var file = FileManager.SelectedFile;
            //        var fileInfo = new FileInfo(MapPath(file.FullName));

            //        PopupControl.JSProperties["cpHeaderText"] = Path.GetFileNameWithoutExtension(fileInfo.FullName);
            //        Type.Text = ExtensionsDisplayName[file.Extension];
            //        Size.Text = file.Length.ToString("#,#") + " bytes";
            //        Created.Text = fileInfo.CreationTime.ToString("U");
            //        Modified.Text = fileInfo.LastWriteTime.ToString("U");
            //        Accessed.Text = fileInfo.LastAccessTime.ToString("U");
            //        FormLayout.FindItemOrGroupByName("Contains").Visible = false;
            //        SetFileManagerItemInfo(file);
            //        break;
            //    case "Folders":
            //        var folder = FileManager.SelectedFolder;
            //        var path = MapPath(folder.FullName);
            //        var directoryInfo = new DirectoryInfo(path);
            //        var filesInfo = directoryInfo.GetFiles("*", SearchOption.AllDirectories);
            //        long folderSize = 0;
            //        foreach (var info in filesInfo)
            //            folderSize += info.Length;
            //        var filesCount = filesInfo.Length;
            //        var subDirectoriesCount = directoryInfo.GetDirectories("*", SearchOption.AllDirectories).Length;

            //        Type.Text = "Folder";
            //        Size.Text = folderSize.ToString("#,#") + " bytes";
            //        Contains.Text = filesCount + " Files, " + subDirectoriesCount + " Folders";
            //        PopupControl.JSProperties["cpHeaderText"] = folder.Name;
            //        Created.Text = Directory.GetCreationTime(path).ToString("U");
            //        FormLayout.FindItemOrGroupByName("Modified").Visible = false;
            //        FormLayout.FindItemOrGroupByName("Accessed").Visible = false;
            //        SetFileManagerItemInfo(folder);
            //        break;
            //}
        }

        void SetFileManagerItemInfo(FileManagerItem item)
        {
            //PopupControl.JSProperties["cpHeaderText"] += " Properties";
            //Name.Text = item.Name;
            //Location.Text = item.FullName;
            //RelativeLocation.Text = item.RelativeName;
        }
        void SetFileManagerToolbarItemCheckedState(string commandName, bool checkedState)
        {
            var item = FileManager.SettingsToolbar.Items.FindByCommandName(commandName);
            (item as FileManagerToolbarCustomButton).Checked = checkedState;
        }

        void ValidateSiteEdit(FileManagerActionEventArgsBase e)
        {
            //e.Cancel = Utils.IsSiteMode;
            //e.ErrorText = Utils.GetReadOnlyMessageText();
        }
    }
}