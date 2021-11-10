<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="LawDesk.Samples.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxFileManager ID="ASPxFileManager1" runat="server">
                <Settings RootFolder="~/" ThumbnailFolder="~/Thumb/" />
            </dx:ASPxFileManager>
            <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Button" />
        </div>
    </form>
</body>
</html>
