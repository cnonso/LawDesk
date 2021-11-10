<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StaffListing.aspx.cs" Inherits="LawDesk.Views.StaffListing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Content/fancyScroll.css" rel="stylesheet" />
    <div class="content-wrapper">
        <div class="content-heading">
            <div>Staff Directory</div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-default">
                    <div class="card-header"></div>
                    <div class="card-body">
                        <table class="table table-striped my-4 w-100" id="datatable1">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Staff Type</th>
                                    <th>Total Assigned Tasks</th>
                                    <th>Current Work Load</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%Response.Write(tableBuilder); %>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-body" style="display: none">
                        <button id="subm" type="button" onclick="alert('Submitted')" class="btn btn-oval btn-primary" style="float: right">Save and Continue</button>
                    </div>
                </div>
            </div>
            <script>
                function toggle(source) {
                    members = document.getElementsByName('Staff');
                    for (var i = 0, n = members.length; i < n; i++) {
                        members[i].checked = source.checked;
                    }
                };
            </script>

        </div>
    </div>
</asp:Content>
