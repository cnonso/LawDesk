<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ClientRegistration.aspx.cs" Inherits="LawDesk.Views.ClientRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <link href="../Content/fancyScroll.css" rel="stylesheet" />
    <div class="content-wrapper">
        <div class="content-heading">
            <div>Registration</div>

            <div class="col-md-3" style="display:none">
                <div class="input-group">
                    <asp:TextBox ID="txtSearchClientID" CssClass="form-control" placeholder="Search existing Client ID" runat="server"></asp:TextBox>
                    <span class="input-group-btn">
                        <span style="cursor: pointer" class="btn btn-info" onclick="SearchButtonClick()"><i class="fa fa-search"></i></span>
                    </span>
                </div>
                <div style="display: none">
                    <script>
                        function SearchButtonClick() {
                            document.getElementById('<%=btnSearch.ClientID%>').click();
                        }
                    </script>
                    <asp:Button ID="btnSearch" OnClick="btnSearch_Click" runat="server" Text="Search" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-default">
                    <div class="card-header"></div>
                    <div class="card-body">

                        <form id="ExampleForm">
                            <div>
                                <h4>Profile<br>
                                    <small>Enter client's profile here.</small>
                                </h4>
                                <fieldset>
                                    <div class="row">
                                        <div class="col-md-12">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <asp:Literal ID="ltrMessage" runat="server"></asp:Literal>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnAddNewContactGroup" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnSaveProfile" EventName="Click" />

                                                </Triggers>
                                            </asp:UpdatePanel> 
                                           
                                        </div>
                                        <div class="col-md-2">
                                            <label for="surname">Client ID.</label>
                                            <asp:TextBox ID="txtClientID" Enabled="false" CssClass="form-control" placeholder="For existing clients" runat="server"></asp:TextBox>

                                        </div>
                                        <div class="col-md-4">
                                            <label for="surname">Surname *</label>
                                            <asp:TextBox ID="txtSurname" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="password">Firstname *</label>
                                            <asp:TextBox ID="txtFirstname" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="confirm">Middlename *</label>
                                            <asp:TextBox ID="txtMiddlename" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px">
                                        <div class="col-md-3">
                                            <label for="email">Email *</label>
                                            <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-2">

                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <div class="form-group">
                                                        <label for="client">Client Group *</label>
                                                        <asp:DropDownList ID="ddlClientGroup" CssClass="custom-select  mb-3" runat="server">
                                                            
                                                        </asp:DropDownList>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnAddNewContactGroup" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel> 
                                        </div>
                                        <div style="display:none">
                                            <asp:Button ID="btnAddNewContactGroup" OnClick="btnAddNewContactGroup_Click" runat="server" Text="Button" />
                                        </div>
                                        <div class="col-md-3" style="margin-top: 27px">
                                            <a id="AddNewContactGroupToggler" style="cursor: pointer; color: purple; text-decoration: underline; text-decoration-style: dashed;" onclick="DisplayAddNewContactControls()">Add New Contact Group</a>
                                            <script>
                                                function DisplayAddNewContactControls() {
                                                    document.getElementById('AddNewContactGroupToggler').style.display = "none";
                                                    document.getElementById('AddNewContactGroupControls').style.display = "block";
                                                }
                                                function HideAddNewContactControls() {
                                                    document.getElementById('AddNewContactGroupToggler').style.display = "block";
                                                    document.getElementById('AddNewContactGroupControls').style.display = "none";
                                                    document.getElementById('NewContactGroupErrMsg').style.display = "none";
                                                }
                                                function ValidatenewContactGroup() {
                                                    if (document.getElementById('txtAddNewContactGroup').value.trim().length == 0) {
                                                        document.getElementById('NewContactGroupErrMsg').style.display = "block";
                                                    }
                                                    else {
                                                        document.getElementById('NewContactGroupErrMsg').style.display = "none";
                                                        document.getElementById('<%=btnAddNewContactGroup.ClientID%>').click();
                                                    }
                                                }
                                            </script>
                                            <div style="display: none" id="AddNewContactGroupControls">
                                                <div class="input-group">
                                                    <input class="form-control" placeholder="Group Name" id="txtAddNewContactGroup" name="txtAddNewContactGroup" type="text">
                                                    <div class="input-group-btn">
                                                        <button type="button" onclick="ValidatenewContactGroup()" class="btn btn-success">✓</button>
                                                    </div>
                                                    <button onclick="HideAddNewContactControls()" type="button" class="btn btn-danger">✘</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2" id="NewContactGroupErrMsg" style="margin-top: 27px; display: none">
                                            <i style="color: red">Field is required</i>
                                        </div>
                                        <div class="col-md-2">
                                            <label title=" Securely share documents, invoices, and messages to your client. They will receive a welcome email with login instructions.
                                                Your client will only have access to items that you explicitely share.">
                                                Enable Client Portal *</label>
                                            <label title=" Securely share documents, invoices, and messages to your client. They will receive a welcome email with login instructions.
                                                Your client will only have access to items that you explicitely share."
                                                class="switch" style="margin-top: 15px">
                                                <input type="checkbox" value="1" name="chkBxClientPortal" checked="checked"><span></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px">

                                        <div class="col-md-2">
                                            <label>Mobile Phone *</label>
                                            <asp:TextBox ID="txtMobilePhone" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Work Phone</label>
                                            <asp:TextBox ID="txtWorkPhone" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Home Phone</label>
                                            <asp:TextBox ID="txtHomePhone" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label>Address *</label>
                                            <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 20px">
                                        <div class="col-md-6">
                                            <p>(*) Mandatory</p>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Button Style="float: right" ID="btnSaveProfile" OnClick="btnSaveProfile_Click" CssClass="btn btn-oval btn-info" runat="server" Text="Save Profile" />
                                        </div>
                                    </div>
                                </fieldset>
                                <h4 style="display:none">Case Details<br>
                                    <small>Enter discription of case here</small></h4>
                                <fieldset style="display:none">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Case Name *</label>
                                            <asp:TextBox ID="txtCaseName" CssClass="form-control" placeholder="e.g. Mr. Danladi vs Neighbour" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Case Type *</label>
                                            <asp:DropDownList ID="ddlCaseType" CssClass="custom-select  mb-3 required" AutoPostBack="true" OnSelectedIndexChanged="ddlCaseType_SelectedIndexChanged" runat="server">
                                                <asp:ListItem Text="Litigation"></asp:ListItem>
                                                <asp:ListItem Text="Commercial"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Case Stage *</label>
                                            <asp:DropDownList ID="ddlCaseStages" CssClass="custom-select  mb-3 required" runat="server">
                                                <asp:ListItem Text="Commencement"></asp:ListItem>
                                                <asp:ListItem Text="Trial"></asp:ListItem>
                                                <asp:ListItem Text="Adoption of Addresses"></asp:ListItem>
                                                <asp:ListItem Text="Judgement"></asp:ListItem>
                                                <asp:ListItem Text="Closure"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Date Opened *</label>
                                            <asp:TextBox ID="txtDateOpened" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">

                                        <div class="col-md-3">
                                            <label>Case Number *</label>
                                            <asp:TextBox ID="txtCaseNumber" CssClass="form-control" placeholder="A unique identifier for this case" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Practice Area *</label>
                                            <asp:DropDownList ID="ddlPracticeArea" CssClass="custom-select  mb-3 required" runat="server"> 
                                            </asp:DropDownList>
                                        </div>
                                         <div style="display:none">
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
                                                    <input class="form-control" placeholder="Pratice Area" id="txtAddNewPracticeArea" name="txtAddNewPracticeArea" type="text">
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

