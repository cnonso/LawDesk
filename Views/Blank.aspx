<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Blank.aspx.cs" Inherits="LawDesk.Views.Blank" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-wrapper">
                <div class="content-heading">
                    <div>Page title<small>Subtitle</small></div>
                </div>
                <div class="row">
                    <div class="col-xl-12">
                        <p>A row with content</p>
                        <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server">
                            <Views>
                                <WeekView Enabled="false"></WeekView>
                                <FullWeekView Enabled="true">
                                </FullWeekView>
                            </Views>

                        </dxwschs:ASPxScheduler>
                    </div>
                </div>
            </div>
</asp:Content>
