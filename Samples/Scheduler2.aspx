<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Scheduler2.aspx.cs" Inherits="LawDesk.Samples.Scheduler2" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register TagPrefix="cc1" Namespace="DevExpress.XtraScheduler" Assembly="DevExpress.XtraScheduler.v19.2.Core, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" AppointmentDataSourceID="SqlDataSource1" ClientIDMode="AutoID" Start="2020-07-11" ResourceDataSourceID="SqlDataSource2">
                <Views>
                    <WeekView Enabled="false"></WeekView>
                    <FullWeekView Enabled="true">
                    </FullWeekView>
                </Views>

                <Storage>
                    <Appointments AutoRetrieveId="True">
                        <Mappings AppointmentId="UniqueID" AllDay="AllDay" Status="Status" Label="Label" Description="Description" End="EndDate" Location="Location" RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo" ResourceId="ResourceID" Start="StartDate" Subject="Subject" Type="Type"></Mappings>
                    </Appointments>
                    <Resources>
                        <Mappings ResourceId="ResourceID" Caption="ResourceName" Color="Color" Image="Image"></Mappings>
                    </Resources>
                </Storage>
            </dxwschs:ASPxScheduler>
            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT * FROM [Resources]"></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' DeleteCommand="DELETE FROM [Appointments] WHERE [UniqueID] = @UniqueID" InsertCommand="INSERT INTO [Appointments] ([Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField1]) VALUES (@Type, @StartDate, @EndDate, @AllDay, @Subject, @Location, @Description, @Status, @Label, @ResourceID, @ResourceIDs, @ReminderInfo, @RecurrenceInfo, @CustomField1)" SelectCommand="SELECT * FROM [Appointments]" UpdateCommand="UPDATE [Appointments] SET [Type] = @Type, [StartDate] = @StartDate, [EndDate] = @EndDate, [AllDay] = @AllDay, [Subject] = @Subject, [Location] = @Location, [Description] = @Description, [Status] = @Status, [Label] = @Label, [ResourceID] = @ResourceID, [ResourceIDs] = @ResourceIDs, [ReminderInfo] = @ReminderInfo, [RecurrenceInfo] = @RecurrenceInfo, [CustomField1] = @CustomField1 WHERE [UniqueID] = @UniqueID">
                <DeleteParameters>
                    <asp:Parameter Name="UniqueID" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Type" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="StartDate" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="EndDate" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="AllDay" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Location" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Status" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Label" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="ResourceID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="ResourceIDs" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ReminderInfo" Type="String"></asp:Parameter>
                    <asp:Parameter Name="RecurrenceInfo" Type="String"></asp:Parameter>
                    <asp:Parameter Name="CustomField1" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Type" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="StartDate" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="EndDate" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="AllDay" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Location" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Status" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Label" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="ResourceID" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="ResourceIDs" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ReminderInfo" Type="String"></asp:Parameter>
                    <asp:Parameter Name="RecurrenceInfo" Type="String"></asp:Parameter>
                    <asp:Parameter Name="CustomField1" Type="String"></asp:Parameter>
                    <asp:Parameter Name="UniqueID" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
