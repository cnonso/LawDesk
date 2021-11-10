<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleFileManager.aspx.cs" Inherits="LawDesk.Samples.SampleFileManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <script>
            function OnCustomCommand(s, e) {
                switch (e.commandName) {
                    case "ChangeView-Thumbnails":
                        FileManager.PerformCallback("Thumbnails");
                        break;
                    case "ChangeView-Details":
                        FileManager.PerformCallback("Details");
                        break;
                    case "Properties":
                        PopupControl.PerformCallback(FileManager.GetActiveAreaName());
                        break;
                }
            }
            function OnToolbarUpdating(s, e) {
                var enabled = (e.activeAreaName == "Folders" || FileManager.GetSelectedItems().length > 0) && e.activeAreaName != "None";
                FileManager.GetToolbarItemByCommandName("Properties").SetEnabled(enabled);
                FileManager.GetContextMenuItemByCommandName("Properties").SetEnabled(enabled);
            }
            function OnPopupEndCallback(s, e) {
                PopupControl.SetHeaderText(PopupControl.cpHeaderText);
                PopupControl.ShowAtElement(FileManager.GetMainElement());
            }
        </script>
        <div>
            <dx:ASPxFileManager ID="FileManager" ClientInstanceName="FileManager" runat="server" OnCustomCallback="ASPxFileManager_CustomCallback" OnItemRenaming="FileManager_ItemRenaming"
                OnItemMoving="FileManager_ItemMoving" OnItemCopying="FileManager_ItemCopying" OnItemDeleting="FileManager_ItemDeleting">
                <ClientSideEvents CustomCommand="OnCustomCommand" ToolbarUpdating="OnToolbarUpdating" />
                <Settings RootFolder="~/Briefcase" ThumbnailFolder="~\Thumb\"
                    AllowedFileExtensions=".jpg,.jpeg,.gif,.rtf,.txt,.avi,.png,.mp3,.xml,.doc,.pdf" />
                <SettingsEditing AllowRename="true" AllowMove="true" AllowCopy="true" AllowDelete="true" />
                <SettingsUpload Enabled="false" />
                <SettingsToolbar>
                    <Items>
                        <dx:FileManagerToolbarCustomButton CommandName="Properties">
                            <Image IconID="setup_properties_16x16" />
                        </dx:FileManagerToolbarCustomButton>
                        <dx:FileManagerToolbarRefreshButton BeginGroup="false" />
                        <dx:FileManagerToolbarCustomButton Text="Thumbnails View" CommandName="ChangeView-Thumbnails" GroupName="ViewMode">
                            <Image IconID="grid_cards_16x16" />
                        </dx:FileManagerToolbarCustomButton>
                        <dx:FileManagerToolbarCustomButton Text="Details View" CommandName="ChangeView-Details" GroupName="ViewMode">
                            <Image IconID="grid_grid_16x16" />
                        </dx:FileManagerToolbarCustomButton>
                    </Items>
                </SettingsToolbar>
                <SettingsContextMenu Enabled="true">
                    <Items>
                        <dx:FileManagerToolbarMoveButton />
                        <dx:FileManagerToolbarCopyButton />
                        <dx:FileManagerToolbarRenameButton BeginGroup="true" />
                        <dx:FileManagerToolbarDeleteButton />
                        <dx:FileManagerToolbarRefreshButton BeginGroup="false" />
                        <dx:FileManagerToolbarCustomButton Text="Properties" CommandName="Properties" BeginGroup="true">
                            <Image IconID="setup_properties_16x16" />
                        </dx:FileManagerToolbarCustomButton>
                    </Items>
                </SettingsContextMenu>
                <SettingsAdaptivity Enabled="true" />
            </dx:ASPxFileManager> 
        </div>
    </form>
</body>
</html>
