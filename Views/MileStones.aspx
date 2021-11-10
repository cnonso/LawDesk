<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MileStones.aspx.cs" Inherits="LawDesk.Views.MileStones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-heading">
            <div class="row">
                <div class="col-xl-4">
                    <div>Milestones</div>
                </div>
                <div class="col-xl-8"> 
                    <asp:DropDownList ID="ddlCases" CssClass="custom-select  mb-3 required" AutoPostBack="true" OnSelectedIndexChanged="ddlCases_SelectedIndexChanged" runat="server">
                        
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        
        <!-- START timeline-->
        <!-- ul.timeline-alt-->
        <ul class="timeline"> 
            <%Response.Write(milesones); %>
            </ul>
        <!-- ul.timeline-alt-->
        <ul class="timeline" style="display:none">  
            <li class="timeline-separator" data-datetime="Today"></li>
            <!-- END timeline separator-->
            <!-- START timeline item-->
            <li>
                <div class="timeline-badge purple"><em class="fa fa-gavel"></em></div>
                <div class="timeline-card">
                    <div class="popover left">
                        <h4 class="popover-header">Judgement</h4>
                        <div class="arrow"></div>
                        <div class="popover-body">
                            <p>
                                Team Lead: Jenifa K.E.<br>
                                <small>The adjournment for adoption of final written addresses followed after lead lawyers to Michelle announced that the second and third respondents were closing their defence in the case.</small>
                            </p>
                        </div>
                    </div>
                </div>
            </li>
            <!-- END timeline item-->

            <li class="timeline-separator" data-datetime="Yesterday"></li>
            <!-- START timeline item-->
            <li>
                <div class="timeline-badge info"><em class="far fa-file-alt"></em></div>
                <div class="timeline-card">
                    <div class="popover left">
                        <h4 class="popover-header">Adoption of Addresses</h4>
                        <div class="arrow"></div>
                        <div class="popover-body">
                            <p>
                                Team Lead: Jenifa K.E.<br>
                                <small>The adjournment for adoption of final written addresses followed after lead lawyers to Michelle announced that the second and third respondents were closing their defence in the case.</small>
                            </p>
                        </div>
                    </div>
                </div>
            </li>
            <!-- END timeline item-->
            <!-- START timeline item-->
            <li class="timeline-inverted">
                <div class="timeline-card"></div>
                <div class="timeline-card">
                    <div class="popover right">
                        <h4 class="popover-header">Adoption of Addresses</h4>
                        <div class="arrow"></div>
                        <div class="popover-body">
                            <p>
                                Team Lead: Jenifa K.E.<br>
                                <small>The adjournment for adoption of final written addresses followed after lead lawyers to Michelle announced that the second and third respondents were closing their defence in the case.</small>
                            </p>
                            <div class="btn-group">
                                <div class="dropdown-toggle" data-toggle="dropdown" data-play="fadeIn"><em class="fa fa-paperclip"></em></div>
                                <div class="dropdown-menu text-left">
                                    <div class="dropdown-item"><em class="fa fa-download mr-2"></em>Download</div>
                                    <div class="dropdown-item"><em class="fa fa-share mr-2"></em>Send to</div>
                                    <div class="divider"></div>
                                    <div class="dropdown-item"><em class="fa fa-times mr-2"></em>Delete</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <!-- END timeline item-->
            <!-- START timeline separator-->
            <li class="timeline-separator" data-datetime="2020-06-01"></li>
            <!-- END timeline separator-->
            <!-- START timeline item-->
            <li>
                <div class="timeline-badge warning"><em class="fa fa-tasks"></em></div>
                <div class="timeline-card">
                    <div class="popover left">
                        <h4 class="popover-header">Trial</h4>
                        <div class="arrow"></div>
                        <div class="popover-body">
                            <p>
                                Team Lead: Jenifa K.E.<br>
                                <small>The three-judge panel affirmed the trial court’s judgment that Michelle should receive nothing on its breach of contract claims against Olakunle C.</small>
                            </p>
                        </div>
                    </div>
                </div>
            </li>
            <!-- END timeline item-->
            <!-- START timeline item-->
            <li class="timeline-inverted">
                <div class="timeline-card">
                    <div class="popover right">
                        <h4 class="popover-header">Trial</h4>
                        <div class="arrow"></div>
                        <div class="popover-body">
                            <p>Sed posuere consectetur est at lobortis. Aenean eu leo quam. Pellentesque ornare sem lacinia quam.</p>
                            <div class="btn-group">
                                <div class="dropdown-toggle" data-toggle="dropdown" data-play="fadeIn"><em class="fa fa-paperclip"></em></div>
                                <div class="dropdown-menu text-left">
                                    <div class="dropdown-item"><em class="fa fa-download mr-2"></em>Download</div>
                                    <div class="dropdown-item"><em class="fa fa-share mr-2"></em>Send to</div>
                                    <div class="divider"></div>
                                    <div class="dropdown-item"><em class="fa fa-times mr-2"></em>Delete</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <!-- END timeline item-->
            <!-- START timeline item-->
            <li>
                <div class="timeline-badge warning"><em class="fa fa-tasks"></em></div>
                <div class="timeline-card">
                    <div class="popover left">
                        <h4 class="popover-header">Trial</h4>
                        <div class="arrow"></div>
                        <div class="popover-body">
                            <p>Sed posuere consectetur est at lobortis. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.</p>
                        </div>
                    </div>
                </div>
            </li>
            <!-- END timeline item-->
            <!-- START timeline item-->
            <li>
                <div class="timeline-card">
                    <div class="popover left">
                        <h4 class="popover-header">Trial</h4>
                        <div class="arrow"></div>
                        <div class="popover-body">
                            <p>Sed posuere consectetur est at lobortis. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.</p>
                        </div>
                    </div>
                </div>
            </li>
            <!-- END timeline item-->
            <!-- START timeline separator-->
            <li class="timeline-separator" data-datetime="2020-05-21"></li>
            <!-- END timeline separator-->
            <!-- START timeline item-->
            <li class="timeline-inverted">
                <div class="timeline-badge success"><em class="fa fa-clock"></em></div>
                <div class="timeline-card">
                    <div class="popover right">
                        <h4 class="popover-header">Commencement</h4>
                        <div class="arrow"></div>
                        <div class="popover-body">
                            <p>The case between the complainant and defendant was officially registered and a team of lawyers and support staff were assigned. Jenifa K. is the Team Lead.</p>
                        </div>
                    </div>
                </div>
            </li>
            <!-- END timeline item-->
            <!-- START timeline item-->
            <li class="timeline-end"><a class="timeline-badge" href="#"><em class="fa fa-plus"></em></a></li>
            <!-- END timeline item-->
        </ul>
        <!-- END timeline-->
    </div>
</asp:Content>

