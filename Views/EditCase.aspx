<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditCase.aspx.cs" Inherits="LawDesk.Views.EditCase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <link href="../Content/fancyScroll.css" rel="stylesheet" />
    <div class="content-wrapper">
        <div class="content-heading">
            <div>Update Case Detail</div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-default">
                    <div class="card-header"></div>
                    <div class="card-body">

                        <form id="ExampleForm">
                            <div>
                                <h4>Case Details<br>
                                    <small>Update discription of case here</small></h4>
                                <div style="display: none">
                                    <asp:TextBox ID="txtClientID" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="txtCaseID" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="txtOldCaseType" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="txtCategoryID" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="txtCaseNameOriginal" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="txtOldFolderDir" runat="server"></asp:TextBox>
                                </div>
                                <fieldset>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <asp:Literal ID="ltrMessage" runat="server"></asp:Literal>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnSaveCase" EventName="Click" />

                                                </Triggers>
                                            </asp:UpdatePanel>

                                        </div>
                                        <div class="col-md-5">
                                            <label>Client *</label>
                                            <asp:DropDownList ID="ddlClients" CssClass="custom-select  mb-3 required" required="required" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Case Name *</label>
                                            <asp:TextBox ID="txtCaseName" CssClass="form-control" required="required" placeholder="e.g. Mr. Danladi vs Neighbour" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Case Type *</label>
                                            <asp:DropDownList ID="ddlCaseType" CssClass="custom-select  mb-3 required" required="required" AutoPostBack="true" OnSelectedIndexChanged="ddlCaseType_SelectedIndexChanged" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Category *</label>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlCaseCategory" CssClass="custom-select  mb-3 required" AutoPostBack="true" OnSelectedIndexChanged="ddlCaseCategory_SelectedIndexChanged" required="required" runat="server">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlCaseType" EventName="SelectedIndexChanged" />

                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Case Stage *</label>
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlCaseStages" CssClass="custom-select  mb-3 required" runat="server">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlCaseType" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Date Opened *</label>
                                            <asp:TextBox ID="txtDateOpened" required="required" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="col-md-3">
                                            <label>Case Number *</label>
                                            <asp:TextBox ID="txtCaseNumber" Enabled="false" CssClass="form-control" required="required" placeholder="A unique identifier for this case" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Practice Area *</label>
                                            <asp:DropDownList ID="ddlPracticeArea" required="required" CssClass="custom-select  mb-3 required" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div style="display: none">
                                            <asp:Button ID="btnAddnewPracticeArea" OnClick="btnAddnewPracticeArea_Click" runat="server" Text="Button" />
                                        </div>
                                        <div class="col-md-3" style="margin-top: 27px">
                                            <a id="AddNewPracticeAreaToggler" style="cursor: pointer; color: purple; text-decoration: underline; text-decoration-style: dashed;" onclick="DisplayAddNewPracticeAreaControls()">Add New Practice Area</a>
                                            <script>
                                                function DisplayAddNewPracticeAreaControls() {
                                                    document.getElementById('AddNewPracticeAreaToggler').style.display = "none";
                                                    document.getElementById('AddNewPracticeAreaControls').style.display = "block";
                                                }
                                                function HideAddNewPracticeAreaControls() {
                                                    document.getElementById('AddNewPracticeAreaToggler').style.display = "block";
                                                    document.getElementById('AddNewPracticeAreaControls').style.display = "none";
                                                    document.getElementById('NewPracticeAreaErrMsg').style.display = "none";
                                                }
                                                function ValidatenewPracticeArea() {
                                                    if (document.getElementById('txtAddNewPracticeArea').value.trim().length == 0) {
                                                        document.getElementById('NewPracticeAreaErrMsg').style.display = "block";
                                                    }
                                                    else {
                                                        document.getElementById('NewPracticeAreaErrMsg').style.display = "none";
                                                        document.getElementById('<%=btnAddnewPracticeArea.ClientID%>').click();
                                                    }
                                                }
                                            </script>
                                            <div style="display: none" id="AddNewPracticeAreaControls">
                                                <div class="input-group">
                                                    <input class="form-control" placeholder="Practice Area" id="txtAddNewPracticeArea" name="txtAddNewPracticeArea" type="text">
                                                    <div class="input-group-btn">
                                                        <button type="button" onclick="ValidatenewPracticeArea()" class="btn btn-success">✓</button>
                                                    </div>
                                                    <button onclick="HideAddNewPracticeAreaControls()" type="button" class="btn btn-danger">✘</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3" id="NewPracticeAreaErrMsg" style="margin-top: 27px; display: none">
                                            <i style="color: red">Field is required</i>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="client">Administrating Court *</label>
                                            <asp:DropDownList ID="ddlCourts" CssClass="custom-select  mb-3" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-12">
                                            <label>Description *</label>
                                            <asp:TextBox ID="txtDescription" CssClass="form-control required" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <p>(*) Mandatory</p>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Button Style="float: right" ID="btnSaveCase" OnClick="btnSaveCase_Click" CssClass="btn btn-oval btn-info" runat="server" Text="Save Record" />
                                        </div>
                                    </div>


                                </fieldset>



                            </div>
                        </form>
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

