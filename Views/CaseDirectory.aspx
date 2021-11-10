<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CaseDirectory.aspx.cs" Inherits="LawDesk.Views.CaseDirectory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-heading">
            <div>Case List</div>
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
                                        <th>Case Name</th>
                                        <th>Case Number</th> 
                                        <th>Type</th>
                                        <th>Category</th>
                                        <th>Stage</th>
                                        <th>Date Opened</th>
                                        <th>Action</th>
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