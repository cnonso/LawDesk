<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DocumentManagement.aspx.cs" Inherits="LawDesk.Views.DocumentManagement" %>

<%@ Register Assembly="DevExpress.XtraReports.v19.2.Web.WebForms, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-heading">
            <div>Document Management<small></small></div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <script>
                function OnCustomCommand(s, e) {
                    //alert(e.commandName);
                    switch (e.commandName) {
                        case "View":
                            ASPxFileManager1.PerformCallback("View Doc"); 
                            window.open('../views/DocumentViewer.aspx', 'Document Viewer', 'width=1200,height=800,scrollbars=yes')
                            //alert(e.commandName);
                            break;
                        
                        case "Properties":
                            PopupControl.PerformCallback(ASPxFileManager1.GetActiveAreaName());
                            break;
                    }
                }
            </script>
            <dx:ASPxFileManager ID="ASPxFileManager1" Theme="Aqua" Height="550px" ClientInstanceName="ASPxFileManager1" runat="server" OnCustomCallback="ASPxFileManager1_CustomCallback">
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
            </div>
    </div>
</asp:Content>

