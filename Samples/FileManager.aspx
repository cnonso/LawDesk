<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileManager.aspx.cs" Inherits="LawDesk.Samples.FileManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <script>
                function OnCustomCommand(s, e) {
                    //alert(e.commandName);
                    switch (e.commandName) {
                        case "View":
                            ASPxFileManager1.PerformCallback("View Doc");
                            //alert(e.commandName);
                            break;
                        
                        case "Properties":
                            PopupControl.PerformCallback(ASPxFileManager1.GetActiveAreaName());
                            break;
                    }
                }
            </script>
            <dx:ASPxFileManager ID="ASPxFileManager1" ClientInstanceName="ASPxFileManager1" runat="server" OnCustomCallback="ASPxFileManager1_CustomCallback">
                <Settings RootFolder="~/Briefcase/" ThumbnailFolder="~/Thumb/" />
                <ClientSideEvents CustomCommand="OnCustomCommand"/>
                <SettingsEditing AllowCopy="True" AllowCreate="True" AllowDelete="True" AllowDownload="True" AllowMove="True" AllowRename="True" />
                <SettingsUpload>
                    <AdvancedModeSettings EnableMultiSelect="True">
                    </AdvancedModeSettings>
                </SettingsUpload>
                <SettingsContextMenu Enabled="true">
                    <Items>
                        <dx:FileManagerToolbarMoveButton />
                        <dx:FileManagerToolbarCopyButton />
                        <dx:FileManagerToolbarRenameButton BeginGroup="true" />
                        <dx:FileManagerToolbarDeleteButton />
                        <dx:FileManagerToolbarRefreshButton BeginGroup="false" />
                        <dx:FileManagerToolbarCustomButton Text="View" CommandName="View" BeginGroup="true">
                            <Image IconID="View_16x16" Url="../img/Icons/read.png" />
                        </dx:FileManagerToolbarCustomButton>
                    </Items>
                </SettingsContextMenu>
                <SettingsAdaptivity Enabled="true" />
            </dx:ASPxFileManager>
        </div>
    </form>
</body>
</html>
