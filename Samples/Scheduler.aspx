<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Scheduler.aspx.cs" Inherits="LawDesk.Samples.Scheduler" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server">
                <Views>
                    <WeekView Enabled="false"></WeekView>
                    <FullWeekView Enabled="true">
                    </FullWeekView>
                </Views>

            </dxwschs:ASPxScheduler>
        </div>
    </form>
</body>
</html>
