<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Litigation.aspx.cs" Inherits="LawDesk.Views.Litigation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-heading">
            <div>Trial<small>Litigation</small></div>
        </div>
        <div class="row">
            <div class="col-xl-4">
                <div class="card card-default">
                    <div class="card-header"></div>
                    <div class="card-body">

                        <div>


                            <div class="row">
                                <div class="col-md-12">
                                    <label><b>Select Case</b></label>
                                    <asp:DropDownList ID="ddlCases" CssClass="custom-select  mb-3 required" runat="server">
                                        <asp:ListItem>Abdulahi Musa vs Neighbour</asp:ListItem>
                                        <asp:ListItem>Okoye Philip - Assault</asp:ListItem>
                                        <asp:ListItem>Michelle Igwe vs Neighbour</asp:ListItem>
                                    </asp:DropDownList>

                                </div>

                                <div class="col-md-12">
                                    <label for="confirm"><b>Assigned Staff</b></label>
                                    <table class="table table-striped my-4 w-100" id="datatable1">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <input type='checkbox' onclick='toggle(this)' /></th>
                                                <th>Name</th>
                                                <th>Staff Type</th>
                                                <th>Work Load</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%Response.Write(tableBuilder); %>
                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="col-md-12" style="margin-top: 20px">
                                    <asp:Button CssClass="btn btn-info btn-oval btn-md" Style="float: right" ID="btnRemoveStaff" OnClick="btnRemoveStaff_Click" runat="server" Text="Remove Staff From List" />
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
                </div>
            </div>

            <div class="col-xl-8">
                <div class="card card-default">
                    <div class="card-header"></div>
                    <div class="card-body">

                        <div>


                            <div class="row">
                                <div class="col-md-8">
                                    <label><b>Milestone</b></label>
                                    <asp:DropDownList ID="DropDownList1" CssClass="custom-select  mb-3 required" runat="server">
                                        <asp:ListItem>Commencement</asp:ListItem>
                                        <asp:ListItem>Trial</asp:ListItem>
                                        <asp:ListItem>Adoption of Addresses</asp:ListItem>
                                        <asp:ListItem>Judgement</asp:ListItem>
                                        <asp:ListItem>Closure</asp:ListItem>
                                    </asp:DropDownList>

                                </div>

                                <div class="col-md-4">
                                    <label for="confirm"><b>Date</b></label>
                                    <asp:TextBox ID="txtDate" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-12">
                                    <label><b>Description</b></label>
                                    <asp:TextBox ID="txtDescription" Rows="4" CssClass="form-control" TextMode="multiline" runat="server"></asp:TextBox>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12" style="margin-top: 20px">
                                    <label><b>Supporting Documents</b></label>
                                </div>
                                <div class="col-md-6" id="supportingDocsDiv">
                                    <input name="SupportingDoc" type="file" /> 

                                    <input name="SupportingDoc" type="file" />

                                    <input name="SupportingDoc" type="file" />

                                    <input name="SupportingDoc" type="file" />
                                </div>
                                 
                            </div>
                            <div class="row">
                                <div class="col-md-6" style="margin-top: 20px">
                                    <a style="cursor: pointer; color:teal" onclick="AddMoreFileInputControls()">Add more files</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" style="margin-top: 20px">
                                    <asp:Button CssClass="btn btn-info btn-oval btn-md" Style="float: right" ID="btnSavemileStone" runat="server" Text="Save Milestone" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var elemID = 0;
        function AddMoreFileInputControls() {
            ++elemID;
            var root = document.getElementById('supportingDocsDiv');

            //File input control
            var inputElem = document.createElement("input");
            inputElem.type = "file";
            inputElem.id = "sd" + elemID; 
            inputElem.name = "SupportingDoc";

            //File input control remover button
            var btnElem = document.createElement("input");
            btnElem.type = "button";
            btnElem.value = "x";
            btnElem.className = "btn btn-danger btn-xs";
            btnElem.id = "rmvBtn" + elemID;
            btnElem.onclick = function () {
                root.removeChild(inputElem);
                root.removeChild(btnElem);
            };

            root.appendChild(inputElem);
            root.appendChild(btnElem); 
        };
        
    </script>
</asp:Content>
