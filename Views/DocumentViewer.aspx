<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentViewer.aspx.cs" Inherits="LawDesk.Views.DocumentViewer" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraReports.v19.2.Web.WebForms, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Bootstrap Admin App">
    <meta name="keywords" content="app, responsive, jquery, bootstrap, dashboard, admin">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <title>Briefcase NG</title>
    <!-- =============== VENDOR STYLES ===============-->
    <!-- FONT AWESOME-->
    <link rel="stylesheet" href="../vendor/@fortawesome/fontawesome-free/css/brands.css">
    <link rel="stylesheet" href="../vendor/@fortawesome/fontawesome-free/css/regular.css">
    <link rel="stylesheet" href="../vendor/@fortawesome/fontawesome-free/css/solid.css">
    <link rel="stylesheet" href="../vendor/@fortawesome/fontawesome-free/css/fontawesome.css">
    <!-- SIMPLE LINE ICONS-->
    <link rel="stylesheet" href="../vendor/simple-line-icons/css/simple-line-icons.css">
    <!-- ANIMATE.CSS-->
    <link rel="stylesheet" href="../vendor/animate.css/animate.css">
    <!-- WHIRL (spinners)-->
    <link rel="stylesheet" href="../vendor/whirl/dist/whirl.css">
    <!-- =============== PAGE VENDOR STYLES ===============-->
    <!-- XEDITABLE-->
    <link rel="stylesheet" href="../vendor/x-editable/dist/bootstrap3-editable/css/bootstrap-editable.css">
    <!-- Datatables-->
    <link rel="stylesheet" href="../vendor/datatables.net-bs4/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="../vendor/datatables.net-keytable-bs/css/keyTable.bootstrap.css">
    <link rel="stylesheet" href="../vendor/datatables.net-responsive-bs/css/responsive.bootstrap.css">

    <!-- =============== BOOTSTRAP STYLES ===============-->
    <link rel="stylesheet" href="../css/bootstrap.css" id="bscss">
    <!-- =============== APP STYLES ===============-->
    <link rel="stylesheet" href="../css/app.css" id="maincss">
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-12">
                 <div class="<%Response.Write(alertType); %>" >
                            <strong style="text-align:center"><%Response.Write(alertMessage); %></strong>
                        </div>
            </div>
        </div>
        <div> 
            <dx:ASPxRichEdit ID="ASPxRichEdit1" runat="server" WorkDirectory="~\Briefcase" Width="100%" Height="700px"></dx:ASPxRichEdit>
            <dx:ASPxSpreadsheet  ID="sprSht"  runat="server" WorkDirectory="~/App_Data/WorkDirectory"  Width="100%" Height="700px"></dx:ASPxSpreadsheet>
        </div>
    </form>
</body>
</html>
