<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ClientDirectory.aspx.cs" Inherits="LawDesk.Views.ClientDirectory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-heading">
            <div>Client Directory</div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="container-fluid">
                    <!-- DATATABLE DEMO 1-->
                    <div class="card">
                        <div class="card-header">
                        </div>
                        <div class="card-body">
                            <table class="table table-striped my-4 w-100" id="datatable1">
                                <thead>
                                    <tr>
                                        <th data-priority="1">#</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Client Group</th>
                                        <th class="sort-numeric">Phone Number(s)</th>
                                        <th class="sort-alpha" data-priority="2">Address</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%Response.Write(tableBuilder); %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- DATATABLE DEMO 2-->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
