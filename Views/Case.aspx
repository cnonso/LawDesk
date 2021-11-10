<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Case.aspx.cs" Inherits="LawDesk.Views.Case" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="content-wrapper">
        <div class="content-heading">
            <div><% Response.Write(LawDesk.Models.AppHandler.Decrypt(Request.QueryString["q"])); %><small><% Response.Write(LawDesk.Models.AppHandler.Decrypt(Request.QueryString["z"])); %></small></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:Literal ID="ltrMessage" runat="server"></asp:Literal>
            </div>
            <div class="col-xl-4">
                <div class="card card-default">
                    <div class="card-header"></div>
                    <div class="card-body">
                        <div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label><b>Select Case</b></label>
                                    <asp:DropDownList ID="ddlCases" required="required" OnSelectedIndexChanged="ddlCases_SelectedIndexChanged" AutoPostBack="true" CssClass="custom-select  mb-3 required" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-12">
                                    <label for="confirm"><b>Assigned Staff</b></label>
                                    <table class="table table-striped my-4 w-100" id="datatable1">
                                        <thead>
                                            <tr>
                                                <th>#</th>
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
                            </div>
                            <script>
                                function toggle(source) {
                                    members = document.getElementsByName('Staff');
                                    for (var i = 0, n = members.length; i < n; i++) {
                                        members[i].checked = source.checked;
                                    }
                                };
                                function editMileStone(id, stage, dateAchieved, mileStone) {
                                    //alert(dateAchieved);
                                    document.getElementById('save').style.display = "none";
                                    document.getElementById('update').style.display = "block";
                                    document.getElementById('caption').innerHTML = "UPDATE MILESTONE";
                                    document.getElementById('<%=txtMilestoneID.ClientID%>').value = id;
                                    <%--$("<%=ddlCaseStages.ClientID%>").val(stage).change();--%>
                                    var ddl = document.getElementById('<%=ddlCaseStages.ClientID%>');
                                    var opts = ddl.options.length;
                                   
                                    var index = 0;
                                    for (var i = 0; i < opts; i++) {
                                        if (ddl.options[i].value == stage) {
                                            ddl.options[i].selected = true;
                                            index = i;
                                            break;
                                        }
                                    }; 
                                    document.getElementById('<%=txtDate.ClientID%>').value = dateAchieved;
                                    document.getElementById('<%=txtMilestone.ClientID%>').value = mileStone; 
                                };
                                function CancelUpdating() {
                                    document.getElementById('save').style.display = "block";
                                    document.getElementById('update').style.display = "none";
                                    document.getElementById('caption').innerHTML = "NEW MILESTONE";
                                    document.getElementById('<%=txtMilestoneID.ClientID%>').value = "";
                                    document.getElementById('<%=txtDate.ClientID%>').value = "";
                                    document.getElementById('<%=txtMilestone.ClientID%>').value = "";
                                };


                                document.getElementById('<%=txtDate.ClientID%>').setAttribute("required","required");
                                document.getElementById('<%=txtMilestone.ClientID%>').setAttribute("required", "required");
                                document.getElementById('<%=ddlCaseStages.ClientID%>').setAttribute("required", "required");

                                function removeMileStone(id) {
                                    document.getElementById('<%=txtMilestoneID.ClientID%>').value = id;
                                    var result = confirm("Are sure you want to delete this milestone? This process is irreversible.");
                                    if (result) {
                                        document.getElementById('<%=txtDate.ClientID%>').removeAttribute("required");
                                        document.getElementById('<%=txtMilestone.ClientID%>').removeAttribute("required");
                                        document.getElementById('<%=ddlCaseStages.ClientID%>').removeAttribute("required"); 
                                        document.getElementById('<%=btnDeleteMilestone.ClientID%>').click();
                                    }
                                }
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
                                <div class="col-md-12" style="display: none">
                                    <asp:TextBox ID="txtMilestoneID" runat="server"></asp:TextBox>
                                    <asp:Button ID="btnInitializeEdit" OnClick="btnInitializeEdit_Click" runat="server" Text="Initialize Edit" />
                                    <asp:Button ID="btnDeleteMilestone" OnClick="btnDeleteMilestone_Click" runat="server" Text="Delete MileStone" />
                                </div>
                                <div class="col-md-12">
                                    <label><b>EXISTING MILESTONES</b></label>
                                    <table class="table table-striped my-4 w-100" id="datatable3">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Stage</th>
                                                <th>MileStone</th>
                                                <th>Date Achieved</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%Response.Write(milestonesTableBuilder); %>
                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="col-md-12" style="margin-top: 20px">
                                    <label><b id="caption">NEW MILESTONE</b></label>
                                </div>

                                <div class="col-md-8">
                                    <label><b>Stage</b></label>
                                    <asp:DropDownList ID="ddlCaseStages" required="required" CssClass="custom-select  mb-3 required" runat="server">
                                    </asp:DropDownList>
                                </div>

                                <div class="col-md-4">
                                    <label for="confirm"><b>Date</b></label>
                                    <asp:TextBox ID="txtDate" required="required" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>

                                </div>

                                <div class="col-md-12">
                                    <label><b>Description</b></label>
                                    <asp:TextBox ID="txtMilestone" required="required" CssClass="form-control" TextMode="multiline" runat="server"></asp:TextBox>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" style="margin-top: 20px">
                                    <label><b>Supporting Documents</b></label>
                                </div>
                                <div class="col-md-6" id="supportingDocsDiv">
                                    <asp:FileUpload ID="FileUpload1" AllowMultiple="true" runat="server" />
                                    <div style="display: none">
                                        <input name="SupportingDoc" type="file" />

                                        <input name="SupportingDoc" type="file" />

                                        <input name="SupportingDoc" type="file" />

                                        <input name="SupportingDoc" type="file" />
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="display: none">
                                <div class="col-md-6" style="margin-top: 20px">
                                    <a style="cursor: pointer; color: teal" onclick="AddMoreFileInputControls()">Add more files</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12" style="margin-top: 20px">
                                    <div id="save">
                                        <asp:Button CssClass="btn btn-info btn-oval btn-md" Style="float: right" OnClick="btnSavemileStone_Click" ID="btnSavemileStone" runat="server" Text="Save Milestone" />
                                    </div>
                                    <div id="update" style="display: none">
                                        <asp:Button CssClass="btn btn-warning btn-oval btn-md" Style="float: right" OnClick="btnUpdateMileStone_Click" ID="btnUpdateMileStone" runat="server" Text="Update Record" />
                                        <p class="btn btn-dark btn-oval btn-md" style="float: right" onclick="CancelUpdating()">Cancel</p>
                                    </div>
                                </div>
                                <div class="col-md-12" style="margin-top: 20px; display: none">
                                    <asp:Button CssClass="btn btn-info btn-oval btn-md" Style="float: right" ID="btnEncrypt" OnClick="btnEncrypt_Click" runat="server" Text="Encrypt" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12" style="display: none">
                <table class="table">
                    <tr>
                        <td>Litigation</td>
                        <td>
                            <asp:Label ID="Litigation" runat="server" Text="Litigation"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Commercial Case</td>
                        <td>
                            <asp:Label ID="CommercialCase" runat="server" Text="Commercial Case"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Trial</td>
                        <td>
                            <asp:Label ID="Trial" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Appeal</td>
                        <td>
                            <asp:Label ID="Appeal" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Arbitration</td>
                        <td>
                            <asp:Label ID="Arbitration" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Agreement Drafting</td>
                        <td>
                            <asp:Label ID="AgreementDrafting" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Contract Drafting</td>
                        <td>
                            <asp:Label ID="ContractDrafting" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
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

