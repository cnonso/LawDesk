<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="LawDesk.Views.Appointments" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register TagPrefix="cc1" Namespace="DevExpress.XtraScheduler" Assembly="DevExpress.XtraScheduler.v19.2.Core, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-heading">
            <div>Appointments<small></small></div>
        </div>
        <div class="row">
            <div class="col-xl-12"> 
                <dxwschs:ASPxScheduler Theme="Aqua" Width="100%" ID="ASPxScheduler1" runat="server" AppointmentDataSourceID="SqlDataSource1" ClientIDMode="AutoID" Start="2021-02-01" ResourceDataSourceID="SqlDataSource2">
                    <Views>
                        <WeekView Enabled="true"></WeekView>
                        <FullWeekView Enabled="false"></FullWeekView>
                        <WorkWeekView Enabled="true"></WorkWeekView>
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
        </div>
    </div>
</asp:Content>
