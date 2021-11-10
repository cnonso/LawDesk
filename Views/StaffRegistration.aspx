<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StaffRegistration.aspx.cs" Inherits="LawDesk.Views.StaffRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <link href="../Content/fancyScroll.css" rel="stylesheet" />
    <div class="content-wrapper">
        <div class="content-heading">
            <div>Staff Registration</div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card card-default">
                    <div class="card-header"></div>
                    <div class="card-body">

                        <form id="ExampleForm">
                            <div>
                                <h4>Personal Profile<br>
                                    <small>Enter staff's profile here.</small>
                                </h4>
                                <fieldset>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label for="surname">Title</label>
                                            <asp:TextBox ID="txtTitle" placeholder="Barr., Mr., etc" CssClass="form-control" runat="server"></asp:TextBox>

                                        </div>
                                        <div class="col-md-3">
                                            <label for="surname">Surname *</label>
                                            <asp:TextBox ID="txtSurname" placeholder="Surname" required="required" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="password">Firstname *</label>
                                            <asp:TextBox ID="txtFirstname" placeholder="Firstname" required="required" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <label for="confirm">Middlename *</label>
                                            <asp:TextBox ID="txtMiddlename" placeholder="Middlename" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-1">
                                            <label for="confirm">Gender*</label>
                                            <asp:DropDownList ID="ddlGender" required="required" CssClass="custom-select  mb-3 required" runat="server">
                                                <asp:ListItem Text="M" Value="Male"></asp:ListItem>
                                                <asp:ListItem Text="F" Value="Female"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px">
                                        <div class="col-md-3">
                                            <label for="email">Email *</label>
                                            <asp:TextBox ID="txtEmail" placeholder="Email" required="required" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <label for="client">Staff Type *</label>
                                                    <asp:DropDownList ID="ddlStaffType" CssClass="custom-select  mb-3" runat="server">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnAddNewUserType" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div style="display: none">
                                            <asp:Button ID="btnAddNewUserType" OnClick="btnAddNewUserType_Click" runat="server" Text="Button" />
                                        </div>
                                        <div class="col-md-3" style="margin-top: 27px">
                                            <a id="AddNewContactGroupToggler" style="cursor: pointer; color: purple; text-decoration: underline; text-decoration-style: dashed;" onclick="DisplayAddNewContactControls()">Add New Staff Type</a>
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
                                                        document.getElementById('<%=btnAddNewUserType.ClientID%>').click();
                                                    }
                                                }
                                            </script>
                                            <div style="display: none" id="AddNewContactGroupControls">
                                                <div class="input-group">
                                                    <input class="form-control" placeholder="Staff Type" id="txtAddNewContactGroup" name="txtAddNewContactGroup" type="text">
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
                                    </div>
                                    <div class="row" style="margin-top: 20px">
                                        <div class="col-md-2">
                                            <label>Year of Call *</label>
                                            <asp:TextBox ID="txtYearOfCall" placeholder="Year of Call" required="required" CssClass="form-control" runat="server"></asp:TextBox>

                                        </div>
                                        <div class="col-md-2">
                                            <label>Mobile Phone *</label>
                                            <asp:TextBox ID="txtPhone" placeholder="Mobile Phone" required="required" CssClass="form-control" runat="server"></asp:TextBox>

                                        </div>
                                        <div class="col-md-2">
                                            <label>Work Phone</label>
                                            <asp:TextBox ID="txtWorkPhone" placeholder="Work Phone" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>

                                        <div class="col-md-6">
                                            <label>Address *</label>
                                            <asp:TextBox ID="txtAddress" placeholder="Address" required="required" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px">
                                        <div class="col-md-12">
                                            <h4>Next-of-Kin Profile<br>
                                                <small>Enter Next-of-Kin's profile below.</small>
                                            </h4>
                                        </div>
                                        <div class="col-md-8">
                                            <label>Full Name *</label>
                                            <asp:TextBox ID="txtNoKFullname" placeholder="Surname First" required="required" CssClass="form-control" runat="server"></asp:TextBox>

                                        </div>
                                        <div class="col-md-2">
                                            <label>Relationship with NoK</label>
                                            <asp:TextBox ID="txtNoKRelationship" placeholder="" required="required" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Phone</label>
                                            <asp:TextBox ID="txtNoKPhone" placeholder="" required="required" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px">

                                        <div class="col-md-4">
                                            <label>Email</label>
                                            <asp:TextBox ID="txtNoKEmail" placeholder="Email" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-md-8">
                                            <label>Address *</label>
                                            <asp:TextBox ID="txtNoKAddress" placeholder="Firstname" required="required" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px">
                                        <div class="col-md-6">
                                            <p>(*) Mandatory</p>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:Button Style="float: right" ID="btnSaveProfile" OnClick="btnSaveProfile_Click" CssClass="btn btn-oval btn-info" runat="server" Text="Save Profile" />
                                        </div>

                                        <div class="col-md-12">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <asp:Literal ID="ltrMessage" runat="server"></asp:Literal>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnAddNewUserType" EventName="Click" />
                                                    <asp:AsyncPostBackTrigger ControlID="btnSaveProfile" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <div class="col-md-12">
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                <ProgressTemplate>
                                                    <div class="progress">
                                                        <img src="Images/loading.gif" alt="" />&nbsp;Processing, please wait...
                                                    </div>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
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
