<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StaffProfile.aspx.cs" Inherits="LawDesk.Views.StaffProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="content-wrapper">
        <div class="unwrap">
            <div class="bg-cover" style="background-image: url(../img/bg3.jpg)">
                <div class="p-4 text-center text-white">
                    <img class="img-thumbnail rounded-circle thumb128" src="<%Response.Write(staff.ProfilePicUrl); %>" alt="Image">
                    <h3 class="m-0"><%Response.Write(staff.Name); %></h3>
                    <p><%Response.Write(staff.Email); %></p>
                    <p style="display: none">Proin metus justo, commodo in ultrices at, lobortis sit amet dui. Fusce dolor purus, adipiscing a tempus at, gravida vel purus.</p>
                </div>
            </div>
            <div class="text-center bg-gray-dark p-3 mb-4">
                <div class="row">
                    <div class="col-4 br">
                        <h3 class="m-0"><%Response.Write(taskLoad); %></h3>
                        <p class="m-0"><span class="d-none d-md-inline">Cases Assigned</span></p>
                    </div>
                    <div class="col-4 br">
                        <h3 class="m-0"><%Response.Write(completedCases); %></h3>
                        <p class="m-0">Completed</p>
                    </div>
                    <div class="col-4">
                        <h3 class="m-0"><%Response.Write(ongoingCases); %></h3>
                        <p class="m-0">Ongoing</p>
                    </div>
                </div>
            </div>
            <div class="p-3">
                <div class="row">
                    <div class="col-xl-6">
                        <div class="card card-default">
                            <div class="card-header">

                                <div class="card-title">My Court Cases</div>
                                <div style="float: right">
                                    <span class="badge badge-success">Completed</span>
                                    <span class="badge badge-danger">Ongoing</span>
                                </div>
                            </div>
                            <!-- START list group-->
                            <div class="list-group" data-height="305" data-scrollable="">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnSearchCase" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>

                            </div>
                            <!-- END list group-->
                            <!-- START card footer-->
                            <div class="card-footer">
                                <div class="input-group">
                                    <asp:TextBox ID="txtSearchCase" CssClass="form-control form-control-sm" placeholder="Search by case name, number or court" runat="server"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <button class="btn btn-secondary btn-sm" onclick="ClickSearchBtn()" type="button"><i class="fa fa-search"></i></button>
                                    </span>
                                </div>
                                <div style="display: none">
                                    <asp:Button ID="btnSearchCase" OnClick="btnSearchCase_Click" runat="server" Text="Button" />
                                    <script>
                                        function ClickSearchBtn() {
                                            document.getElementById('<%=btnSearchCase.ClientID%>').click();
                                        }
                                    </script>
                                </div>
                            </div>
                            <!-- END card-footer-->
                        </div>
                        <div class="card card-default">
                            <div class="card-header">

                                <div class="card-title">Shared Files</div>
                            </div>
                            <!-- START list group-->
                            <div class="list-group" data-height="305" data-scrollable="">
                                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                       <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnSearchFile" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>

                               
                                <!-- START list group item-->
                                <div style="display: none">
                                    <div class="list-group-item list-group-item-action">
                                        <div class="media">
                                            <img class="align-self-start mx-2 circle thumb32" src="../img/briefcase.jpg" alt="Image">
                                            <div class="media-body text-truncate">
                                                <p class="mb-1">
                                                    <strong class="text-primary">
                                                        <span>Adjournment.pdf</span></strong>
                                                </p>
                                                <p class="mb-1 text-sm">Yetunde Olatunji - Divorce </p>
                                            </div>
                                            <div class="ml-auto">
                                                <small class="text-muted ml-2"><em class="ml-auto fa fa-download fa-fw text-info"></em>
                                                    <br />
                                                    25-06-2020</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item list-group-item-action">
                                        <div class="media">
                                            <img class="align-self-start mx-2 circle thumb32" src="../img/briefcase.jpg" alt="Image">
                                            <div class="media-body text-truncate">
                                                <p class="mb-1">
                                                    <strong class="text-primary">
                                                        <span>Evidence.pdf</span></strong>
                                                </p>
                                                <p class="mb-1 text-sm">Yetunde Olatunji - Divorce </p>
                                            </div>
                                            <div class="ml-auto">
                                                <small class="text-muted ml-2"><em class="ml-auto fa fa-download fa-fw text-info"></em>
                                                    <br />
                                                    25-06-2020</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="list-group-item list-group-item-action">
                                        <div class="media">
                                            <img class="align-self-start mx-2 circle thumb32" src="../img/briefcase.jpg" alt="Image">
                                            <div class="media-body text-truncate">
                                                <p class="mb-1">
                                                    <strong class="text-primary">
                                                        <span>Adjournment2.pdf</span></strong>
                                                </p>
                                                <p class="mb-1 text-sm">Yetunde Olatunji - Divorce </p>
                                            </div>
                                            <div class="ml-auto">
                                                <small class="text-muted ml-2"><em class="ml-auto fa fa-download fa-fw text-info"></em>
                                                    <br />
                                                    25-06-2020</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- END list group-->
                            <!-- START card footer-->
                            <div class="card-footer">
                                <div class="input-group">
                                    <asp:TextBox ID="txtSearchFile" CssClass="form-control form-control-sm" placeholder="Search document by filename, case name, or case number" runat="server"></asp:TextBox>
                                    
                                    <span class="input-group-btn">
                                        <button class="btn btn-secondary btn-sm" onclick="ClickSearchFileBtn()" type="button"><i class="fa fa-search"></i></button>
                                    </span>
                                </div>
                                  <div style="display: none">
                                    <asp:Button ID="btnSearchFile" OnClick="btnSearchFile_Click" runat="server" Text="Button" />
                                    <script>
                                        function ClickSearchFileBtn() {
                                            
                                            document.getElementById('<%=btnSearchFile.ClientID%>').click();
                                        }
                                    </script>
                                </div>
                            </div>
                            <!-- END card-footer-->
                        </div>

                    </div>
                    <div class="col-xl-6">
                        <div class="card card-default">
                            <div class="card-header">
                                <div class="col-md-12">
                                    <h4>Personal Profile<br>
                                        <small>Enter staff's profile here.</small>
                                    </h4>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Literal ID="ltrMessage" runat="server"></asp:Literal>
                                    </div>
                                    <div class="col-md-12" style="display: none">
                                        <asp:TextBox ID="txtStaffID" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="surname">Title</label>
                                        <asp:TextBox ID="txtTitle" CssClass="form-control" placeholder="Barr., Mr., etc" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-8">
                                        <label for="surname">Surname *</label>
                                        <asp:TextBox ID="txtSurname" CssClass="form-control" placeholder="Surname" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-5">
                                        <label for="password">Firstname *</label>
                                        <asp:TextBox ID="txtFirstname" CssClass="form-control required" placeholder="First name" required="required" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-5">
                                        <label for="confirm">Middlename *</label>
                                        <asp:TextBox ID="txtMiddlename" CssClass="form-control required" placeholder="Middlename" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <label for="confirm">Gender*</label>
                                        <asp:DropDownList ID="ddlGender" required="required" CssClass="custom-select  mb-3 required" runat="server">
                                            <asp:ListItem Text="M" Value="Male"></asp:ListItem>
                                            <asp:ListItem Text="F" Value="Female"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Year of Call *</label>
                                        <asp:TextBox ID="txtYearOfCall" required="required" CssClass="form-control" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-5">
                                        <label for="password">Mobile Phone *</label>
                                        <asp:TextBox ID="txtPhoneNo" CssClass="form-control required" placeholder="Phone Number" required="required" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-5">
                                        <label>Work Phone</label>
                                        <asp:TextBox ID="txtWorkMobile" CssClass="form-control required" placeholder="Work Phone" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12">
                                        <label>Address *</label>
                                        <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="form-control required" placeholder="Address" required="required" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 20px">
                                    <div class="col-md-12">
                                        <h4>Next-of-Kin Profile<br>
                                            <small>Enter Next-of-Kin's profile below.</small>
                                        </h4>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Full Name *</label>
                                        <asp:TextBox ID="txtNoKFullname" placeholder="Surname First" required="required" CssClass="form-control" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="col-md-3">
                                        <label>Relationship with NoK</label>
                                        <asp:TextBox ID="txtNoKRelationship" placeholder="e.g Brother, Sister, Father, etc." required="required" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Phone</label>
                                        <asp:TextBox ID="txtNoKPhone" placeholder="" required="required" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 20px">

                                    <div class="col-md-4">
                                        <label>Email</label>
                                        <asp:TextBox ID="txtNoKEmail" TextMode="Email" placeholder="Email" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-8">
                                        <label>Address *</label>
                                        <asp:TextBox ID="txtNoKAddress" placeholder="Firstname" required="required" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 20px">
                                    <div class="col-md-12">
                                        <asp:Button Style="float: right" ID="btnUpdateProfile" OnClick="btnUpdateProfile_Click" CssClass="btn btn-oval btn-info" runat="server" Text="Save Profile" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-default">
                            <div class="card-header">

                                <div class="card-title">Reset Password </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Literal ID="lblPasswordChangeReport" runat="server"></asp:Literal>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtOldPassword" TextMode="Password" placeholder="Current Password" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtNewPassword" placeholder="New Password" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtConfirmPassword" TextMode="Password" placeholder="Confirm Password" CssClass="form-control required" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 20px">
                                    <div class="col-md-12">
                                        <asp:Button Style="float: right" ID="btnResetPass" OnClick="btnResetPass_Click" CssClass="btn btn-oval btn-info" runat="server" Text="Update" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
