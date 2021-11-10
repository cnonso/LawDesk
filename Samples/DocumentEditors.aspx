<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentEditors.aspx.cs" Inherits="LawDesk.Samples.DocumentEditors" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <dx:ASPxRichEdit runat="server" ID="rEdit1" AutoSaveMode="On"  Width="100%" WorkDirectory="~\Briefcase"></dx:ASPxRichEdit>
            <dx:ASPxSpreadsheet ID="sprSht" runat="server" Width="100%"  WorkDirectory="~/Briefcase"></dx:ASPxSpreadsheet>
        </div>
    </form>
</body>
</html>
