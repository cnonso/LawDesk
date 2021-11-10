<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="LawDesk.Views.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-heading">
            <div>Dashboard<small data-localize="dashboard.WELCOME"></small></div>
            <!-- START Language list-->
            <div class="ml-auto">
                <div class="btn-group">
                    <button class="btn btn-secondary dropdown-toggle dropdown-toggle-nocaret" type="button" data-toggle="dropdown">English</button>
                    <div class="dropdown-menu dropdown-menu-right-forced animated fadeInUpShort" role="menu"><a class="dropdown-item" href="#" data-set-lang="en">English</a><a class="dropdown-item" href="#" data-set-lang="es">Spanish</a></div>
                </div>
            </div>
            <!-- END Language list-->
        </div>
        <!-- START cards box-->
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <!-- START card-->
                <div class="card flex-row align-items-center align-items-stretch border-0">
                    <div class="col-4 d-flex align-items-center bg-primary-dark justify-content-center rounded-left"><em class="fas fa-users fa-3x"></em></div>
                    <div class="col-8 py-3 bg-primary rounded-right">
                        <div class="h2 mt-0">170</div>
                        <div class="text-uppercase"><span style="cursor: pointer">Registered Clients</span></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <!-- START card-->
                <div class="card flex-row align-items-center align-items-stretch border-0">
                    <div class="col-4 d-flex align-items-center bg-purple-dark justify-content-center rounded-left"><em class="fas fa-balance-scale fa-3x"></em></div>
                    <div class="col-8 py-3 bg-purple rounded-right">
                        <div class="h2 mt-0">17</div>
                        <div class="text-uppercase"><span style="cursor: pointer">Pending Matters</span></div> 
                    </div>
                </div>
            </div>
               <div class="col-xl-3 col-md-6">
                <!-- START card-->
                <div class="card flex-row align-items-center align-items-stretch border-0">
                    <div class="col-4 d-flex align-items-center bg-success-dark justify-content-center rounded-left"><em class="fas fa-user-tie fa-3x"></em></div>
                    <div class="col-8 py-3 bg-success rounded-right">
                        <div class="h2 mt-0">12</div>
                        <div class="text-uppercase"><span style="cursor: pointer">Lawyers in attendance</span></div> 
                    </div>
                </div>
            </div>
            
               <div class="col-xl-3 col-md-6">
                <!-- START card-->
                <div class="card flex-row align-items-center align-items-stretch border-0">
                    <div class="col-4 d-flex align-items-center bg-warning-dark justify-content-center rounded-left"><em class="fas fa-user-cog fa-3x"></em></div>
                    <div class="col-8 py-3 bg-warning rounded-right">
                        <div class="h2 mt-0">5</div>
                        <div class="text-uppercasee"><span style="cursor: pointer">Support staff in attendance</span></div> 
                    </div>
                </div>
            </div>

           
         
        </div>
        <!-- END cards box-->
        <div class="row">
            <!-- START dashboard main content-->
            <div class="col-xl-9">
                <!-- START chart-->
                <div class="row">
                    <div class="col-xl-12">
                        <!-- START card-->
                        <div class="card card-default card-demo" id="cardChart9">
                            <div class="card-header">
                                <a class="float-right" href="#" data-tool="card-refresh" data-toggle="tooltip" title="Refresh card"><em class="fas fa-sync"></em></a><a class="float-right" href="#" data-tool="card-collapse" data-toggle="tooltip" title="Collapse card"><em class="fa fa-minus"></em></a>
                                <div class="card-title">Number of Cases</div>
                            </div>
                            <div class="card-wrapper">
                                <div class="card-body">
                                    <div class="chart-spline flot-chart"></div>
                                </div>
                            </div>
                        </div>
                        <!-- END card-->
                    </div>
                </div>
                <!-- END chart-->
                <div class="row" style="display: none">
                    <div class="col-xl-12">
                        <div class="card border-0">
                            <div class="row row-flush">
                                <div class="col-lg-2 col-md-3 col-6 bg-info py-4 d-flex align-items-center justify-content-center rounded-left"><em class="wi wi-day-sunny fa-4x"></em></div>
                                <div class="col-lg-2 col-md-3 col-6 py-2 br d-flex align-items-center justify-content-center">
                                    <div>
                                        <div class="h1 m-0 text-bold">32&deg;</div>
                                        <div class="text-uppercase">Clear</div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-md-3 d-none d-md-block py-2 text-center br">
                                    <div class="text-info text-sm">10 AM</div>
                                    <div class="text-muted text-md"><em class="wi wi-day-cloudy"></em></div>
                                    <div class="text-info"><span class="text-muted">20%</span></div>
                                    <div class="text-muted">27&deg;</div>
                                </div>
                                <div class="col-lg-2 col-md-3 d-none d-md-block py-2 text-center br">
                                    <div class="text-info text-sm">11 AM</div>
                                    <div class="text-muted text-md"><em class="wi wi-day-cloudy"></em></div>
                                    <div class="text-info"><span class="text-muted">30%</span></div>
                                    <div class="text-muted">28&deg;</div>
                                </div>
                                <div class="col-lg-2 py-2 text-center br d-none d-lg-block">
                                    <div class="text-info text-sm">12 PM</div>
                                    <div class="text-muted text-md"><em class="wi wi-day-cloudy"></em></div>
                                    <div class="text-info"><span class="text-muted">20%</span></div>
                                    <div class="text-muted">30&deg;</div>
                                </div>
                                <div class="col-lg-2 py-2 text-center d-none d-lg-block">
                                    <div class="text-info text-sm">1 PM</div>
                                    <div class="text-muted text-md"><em class="wi wi-day-sunny-overcast"></em></div>
                                    <div class="text-info"><span class="text-muted">0%</span></div>
                                    <div class="text-muted">30&deg;</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4" style="display: none">
                        <!-- START card-->
                        <div class="card border-0">
                            <div class="card-body">
                                <div class="d-flex">
                                    <h3 class="text-muted mt-0">300</h3>
                                    <em class="ml-auto text-muted fa fa-coffee fa-2x"></em>
                                </div>
                                <div class="py-4" data-sparkline="" data-type="line" data-height="80" data-width="100%" data-line-width="2" data-line-color="#7266ba" data-spot-color="#888" data-min-spot-color="#7266ba" data-max-spot-color="#7266ba" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="3" data-values="1,3,4,7,5,9,4,4,7,5,9,6,4" data-resize="true"></div>
                                <p><small class="text-muted">Actual progress</small></p>
                                <div class="progress progress-xs mb-3">
                                    <div class="progress-bar bg-info progress-bar-striped" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%"><span class="sr-only">80% Complete</span></div>
                                </div>
                            </div>
                        </div>
                        <!-- END card-->
                    </div>
                    <div class="col-xl-6">
                        <div class="card card-default">
                            <div class="card-header">
                                
                                <div class="card-title">Upcoming Court Cases</div>
                            </div>
                            <!-- START list group-->
                            <div class="list-group" data-height="280" data-scrollable="">
                                <!-- START list group item-->
                                <div class="list-group-item list-group-item-action">
                                    <div class="media">
                                        <img class="align-self-start mx-2 circle thumb32" src="../img/briefcase.jpg" alt="Image">
                                        <div class="media-body text-truncate">
                                            <p class="mb-1"><strong class="text-primary"><span class="circle bg-success circle-lg text-left"></span><span>Yetunde Olatunji - Divorce</span></strong></p>
                                            <p class="mb-1 text-sm">Federal High Court, Central Business District, Abuja</p>
                                        </div>
                                        <div class="ml-auto"><small class="text-muted ml-2">25-06-2020</small></div>
                                    </div>
                                </div>
                                <!-- END list group item-->
                                <!-- START list group item-->
                                <div class="list-group-item list-group-item-action">
                                    <div class="media">
                                        <img class="align-self-start mx-2 circle thumb32" src="../img/briefcase.jpg" alt="Image">
                                        <div class="media-body text-truncate">
                                            <p class="mb-1"><strong class="text-primary"><span class="circle bg-success circle-lg text-left"></span><span>Tersoo John - Theft</span></strong></p>
                                            <p class="mb-1 text-sm">High Court of the Federal Capital Territory</p>
                                        </div>
                                        <div class="ml-auto"><small class="text-muted ml-2">25-06-2020</small></div>
                                    </div>
                                </div>
                                <!-- END list group item-->
                                <!-- START list group item-->
                                <div class="list-group-item list-group-item-action">
                                    <div class="media">
                                        <img class="align-self-start mx-2 circle thumb32" src="../img/briefcase.jpg" alt="Image">
                                        <div class="media-body text-truncate">
                                            <p class="mb-1"><strong class="text-primary"><span class="circle bg-danger circle-lg text-left"></span><span>Abdulahi Musa vs Neighbour</span></strong></p>
                                            <p class="mb-1 text-sm">Federal High Court, Central Business District, Abuja</p>
                                        </div>
                                        <div class="ml-auto"><small class="text-muted ml-2">25-06-2020</small></div>
                                    </div>
                                </div>
                                <!-- END list group item-->
                                <!-- START list group item-->
                                <div class="list-group-item list-group-item-action">
                                    <div class="media">
                                        <img class="align-self-start mx-2 circle thumb32" src="../img/briefcase.jpg" alt="Image">
                                        <div class="media-body text-truncate">
                                            <p class="mb-1"><strong class="text-primary"><span class="circle bg-danger circle-lg text-left"></span><span>Okoye Philip - Assault</span></strong></p>
                                            <p class="mb-1 text-sm">Supreme Court Complex, Abuja, Nigeria</p>
                                        </div>
                                        <div class="ml-auto"><small class="text-muted ml-2">25-06-2020</small></div>
                                    </div>
                                </div>
                                <!-- END list group item-->
                                <!-- START list group item-->
                                <div class="list-group-item list-group-item-action">
                                    <div class="media">
                                        <img class="align-self-start mx-2 circle thumb32" src="../img/briefcase.jpg" alt="Image">
                                        <div class="media-body text-truncate">
                                            <p class="mb-1"><strong class="text-primary"><span class="circle bg-danger circle-lg text-left"></span><span>Michelle Igwe vs Neighbour</span></strong></p>
                                            <p class="mb-1 text-sm">Supreme Court Complex, Abuja, Nigeria</p>
                                        </div>
                                        <div class="ml-auto"><small class="text-muted ml-2">25-06-2020</small></div>
                                    </div>
                                </div>
                                <!-- END list group item-->
                            </div>
                            <!-- END list group-->
                            <!-- START card footer-->
                            <div class="card-footer">
                                <div class="input-group">
                                    <input class="form-control form-control-sm" type="text" placeholder="Search case .."><span class="input-group-btn">
                                        <button class="btn btn-secondary btn-sm" type="submit"><i class="fa fa-search"></i></button>
                                    </span>
                                </div>
                            </div>
                            <!-- END card-footer-->
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="card card-default">
                            <div class="card-header">
                                <div class="px-2 float-right badge badge-danger">Offline</div>
                                <div class="px-2 mr-2 float-right badge badge-success">Online</div>
                                <div class="card-title">Staff Workload</div>
                            </div>
                            <!-- START list group-->
                            <div class="list-group" data-height="280" data-scrollable="">
                                <!-- START list group item-->
                                <div class="list-group-item list-group-item-action">
                                    <div class="media">
                                        <img class="align-self-start mx-2 circle thumb32" src="../img/user/02.jpg" alt="Image">
                                        <div class="media-body text-truncate">
                                            <p class="mb-1"><strong class="text-primary"><span class="circle bg-success circle-lg text-left"></span><span>Jenifa Eyo</span></strong></p>
                                            <p class="mb-1 text-sm">Yetunde Olatunji - Divorce, Abdulahi Musa vs Neighbour</p>
                                        </div>
                                        <div class="ml-auto"><small class="text-muted ml-2">2 cases</small></div>
                                    </div>
                                </div>
                                <!-- END list group item-->
                                <!-- START list group item-->
                                <div class="list-group-item list-group-item-action">
                                    <div class="media">
                                        <img class="align-self-start mx-2 circle thumb32" src="../img/user/03.jpg" alt="Image">
                                        <div class="media-body text-truncate">
                                            <p class="mb-1"><strong class="text-primary"><span class="circle bg-success circle-lg text-left"></span><span>Faith Okpethere</span></strong></p>
                                            <p class="mb-1 text-sm">Tersoo John - Theft, Yetunde Olatunji - Divorce, Abdulahi Musa vs Neighbour,</p>
                                        </div>
                                        <div class="ml-auto"><small class="text-muted ml-2">3 cases</small></div>
                                    </div>
                                </div>
                                <!-- END list group item-->
                                <!-- START list group item-->
                                <div class="list-group-item list-group-item-action">
                                    <div class="media">
                                        <img class="align-self-start mx-2 circle thumb32" src="../img/user/09.jpg" alt="Image">
                                        <div class="media-body text-truncate">
                                            <p class="mb-1"><strong class="text-primary"><span class="circle bg-danger circle-lg text-left"></span><span>Frank Egwu</span></strong></p>
                                            <p class="mb-1 text-sm">Tersoo John - Theft, Yetunde Olatunji - Divorce, Abdulahi Musa vs Neighbour</p>
                                        </div>
                                        <div class="ml-auto"><small class="text-muted ml-2">4 cases</small></div>
                                    </div>
                                </div>
                                <!-- END list group item-->
                                <!-- START list group item-->
                                <div class="list-group-item list-group-item-action">
                                    <div class="media">
                                        <img class="align-self-start mx-2 circle thumb32" src="../img/user/12.jpg" alt="Image">
                                        <div class="media-body text-truncate">
                                            <p class="mb-1"><strong class="text-primary"><span class="circle bg-danger circle-lg text-left"></span><span>Funmilayo Ojo</span></strong></p>
                                            <p class="mb-1 text-sm">Abdulahi Musa vs Neighbour</p>
                                        </div>
                                        <div class="ml-auto"><small class="text-muted ml-2">1 case</small></div>
                                    </div>
                                </div>
                                <!-- END list group item-->
                                <!-- START list group item-->
                                <div class="list-group-item list-group-item-action">
                                    <div class="media">
                                        <img class="align-self-start mx-2 circle thumb32" src="../img/user/10.jpg" alt="Image">
                                        <div class="media-body text-truncate">
                                            <p class="mb-1"><strong class="text-primary"><span class="circle bg-danger circle-lg text-left"></span><span>Ken Atusue</span></strong></p>
                                            <p class="mb-1 text-sm">Abdulahi Musa vs Neighbour, Tersoo John - Theft.</p>
                                        </div>
                                        <div class="ml-auto"><small class="text-muted ml-2">2 cases</small></div>
                                    </div>
                                </div>
                                <!-- END list group item-->
                            </div>
                            <!-- END list group-->
                            <!-- START card footer-->
                            <div class="card-footer">
                                <div class="input-group">
                                    <input class="form-control form-control-sm" type="text" placeholder="Search staff .."><span class="input-group-btn">
                                        <button class="btn btn-secondary btn-sm" type="submit"><i class="fa fa-search"></i></button>
                                    </span>
                                </div>
                            </div>
                            <!-- END card-footer-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- END dashboard main content-->
            <!-- START dashboard sidebar-->
            <aside class="col-xl-3">
                <!-- START loader widget-->
                <div class="card card-default">
                    <div class="card-body">
                        <a class="text-muted float-right" href="#"><em class="fa fa-arrow-right"></em></a>
                        <div class="text-info">Percentage of Concluded Matters</div>
                        <div class="text-center py-4">
                            <div class="easypie-chart easypie-chart-lg" data-easypiechart data-percent="70" data-animate="{&quot;duration&quot;: &quot;800&quot;, &quot;enabled&quot;: &quot;true&quot;}" data-bar-color="#23b7e5" data-track-color="rgba(200,200,200,0.4)" data-scale-color="false" data-line-width="10" data-line-cap="round" data-size="145"><span>70%</span></div>
                        </div>
                        <div class="text-center" style="display:none" data-sparkline="" data-bar-color="#23b7e5" data-height="30" data-bar-width="5" data-bar-spacing="2" data-values="5,4,8,7,8,5,4,6,5,5,9,4,6,3,4,7,5,4,7"></div>
                    </div>
                    <div class="card-footer">
                        <p class="text-muted text-danger"><em class="fa fa-file-o fa-fw"></em><span>Ongoing Court cases</span><span class="text-dark"> 4</span></p>
                         <p class="text-muted text-info"><em class="fa fa-file-o fa-fw"></em><span>Concluded Court cases</span><span class="text-dark"> 13</span></p>
                    </div>
                </div>
                <!-- END loader widget-->
                <!-- START messages and activity-->
                <div class="card card-default">
                    <div class="card-header">
                        <div class="card-title">Recent activities</div>
                    </div>
                    <!-- START list group-->
                    <div class="list-group">
                        <!-- START list group item-->
                        <div class="list-group-item">
                            <div class="media">
                                <div class="align-self-start mr-2"><span class="fa-stack"><em class="fa fa-circle fa-stack-2x text-purple"></em><em class="fas fa-gavel fa-stack-1x fa-inverse text-white"></em></span></div>
                                <div class="media-body text-truncate">
                                    <p class="mb-1"><a class="text-purple m-0" href="../views/milestones.aspx">JUDGEMENT</a></p>
                                    <p class="m-0"><small>Michelle Igwe vs Neighbour<em></em></small></p>
                                </div>
                                <div class="ml-auto"><small class="text-muted ml-2">10/04/2020 09:00 am</small></div>
                            </div>
                        </div>
                        <!-- END list group item-->
                        <!-- START list group item-->
                        <div class="list-group-item">
                            <div class="media">
                                <div class="align-self-start mr-2"><span class="fa-stack"><em class="fa fa-circle fa-stack-2x text-info"></em><em class="far fa-file-alt fa-stack-1x fa-inverse text-white"></em></span></div>
                                <div class="media-body text-truncate">
                                    <p class="mb-1"><a class="text-info m-0" href="../views/milestones.aspx">ADOPTION OF ADDRESSES</a></p>
                                    <p class="m-0"><small>Tersoo John - Theft<em></em></small></p>
                                </div>
                                <div class="ml-auto"><small class="text-muted ml-2">10/04/2020 09:00 am</small></div>
                            </div>
                        </div>
                        <!-- END list group item-->
                        <!-- START list group item-->
                        <div class="list-group-item">
                            <div class="media">
                                <div class="align-self-start mr-2"><span class="fa-stack"><em class="fa fa-circle fa-stack-2x text-danger"></em><em class="fa fa-exclamation fa-stack-1x fa-inverse text-white"></em></span></div>
                                <div class="media-body text-truncate">
                                    <p class="mb-1"><a class="text-danger m-0" href="../views/milestones.aspx">CLOSURE</a></p>
                                    <p class="m-0"><small>Abdulahi Musa vs Neighbour<em></em></small></p>
                                </div>
                                <div class="ml-auto"><small class="text-muted ml-2">10/04/2020 09:00 am</small></div>
                            </div>
                        </div>
                        <!-- END list group item-->
                        <!-- START list group item-->
                        <div class="list-group-item">
                            <div class="media">
                                <div class="align-self-start mr-2"><span class="fa-stack"><em class="fa fa-circle fa-stack-2x text-success"></em><em class="far fa-clock fa-stack-1x fa-inverse text-white"></em></span></div>
                                <div class="media-body text-truncate">
                                    <p class="mb-1"><a class="text-success m-0" href="../views/milestones.aspx">COMMENCEMENT</a></p>
                                    <p class="m-0"><small>Yetunde Olatunji - Divorce<em></em></small></p>
                                </div>
                                <div class="ml-auto"><small class="text-muted ml-2">10/04/2020 09:00 am</small></div>
                            </div>
                        </div>
                        <!-- END list group item-->
                        <!-- START list group item-->
                        <div class="list-group-item">
                            <div class="media">
                                <div class="align-self-start mr-2"><span class="fa-stack"><em class="fa fa-circle fa-stack-2x text-warning"></em><em class="fa fa-tasks fa-stack-1x fa-inverse text-white"></em></span></div>
                                <div class="media-body text-truncate">
                                    <p class="mb-1"><a class="text-warning m-0" href="../views/milestones.aspx">TRIAL</a></p>
                                    <p class="m-0"><small>Okoye Philip - Assault<em></em></small></p>
                                </div>
                                <div class="ml-auto"><small class="text-muted ml-2">10/04/2020 09:00 am</small></div>
                            </div>
                        </div>
                        <!-- END list group item-->
                    </div>
                    <!-- END list group-->
                    <!-- START card footer-->
                    <div class="card-footer"><a class="text-sm" href="#">Load more</a></div>
                    <!-- END card-footer-->
                </div>
                <!-- END messages and activity-->
            </aside>
            <!-- END dashboard sidebar-->
        </div>
    </div>
</asp:Content>
