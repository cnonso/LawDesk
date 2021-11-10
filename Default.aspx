<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LawDesk.Default" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Bootstrap Admin App">
    <meta name="keywords" content="app, responsive, jquery, bootstrap, dashboard, admin">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <title>Briefcase NG</title>
    <!-- =============== VENDOR STYLES ===============-->
    <!-- FONT AWESOME-->
    <link rel="stylesheet" href="vendor/@fortawesome/fontawesome-free/css/brands.css">
    <link rel="stylesheet" href="vendor/@fortawesome/fontawesome-free/css/regular.css">
    <link rel="stylesheet" href="vendor/@fortawesome/fontawesome-free/css/solid.css">
    <link rel="stylesheet" href="vendor/@fortawesome/fontawesome-free/css/fontawesome.css">
    <!-- SIMPLE LINE ICONS-->
    <link rel="stylesheet" href="vendor/simple-line-icons/css/simple-line-icons.css">
    <!-- =============== BOOTSTRAP STYLES ===============-->
    <link rel="stylesheet" href="css/bootstrap.css" id="bscss">
    <!-- =============== APP STYLES ===============-->
    <link rel="stylesheet" href="css/app.css" id="maincss">
</head>

<body>
    <style>
        body {
            background-image: url('img/wallpaper.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center center;
            background-size: cover;
        }
    </style>
    <div class="wrapper" style="margin-top: 150px">
        <div class="block-center mt-4 wd-xl">
            <!-- START card-->
            <div class="card card-flat">
                <div class="card-header text-center bg-dark">
                    <a href="#">
                        <img class="block-center rounded" src="img/logo.png" alt="Image"></a>
                </div>
                <div class="card-body">
                    <h4 class="text-center">MAHMUD & CO</h4>
                    <p class="text-center py-2">SIGN IN TO CONTINUE.</p>
                    <form runat="server" class="mb-3" id="loginForm" novalidate>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <div class="form-group">
                            <div class="input-group with-focus">
                                <asp:TextBox ID="UserName" CssClass="form-control border-right-0" type="text" runat="server" placeholder="Username" required="required" EmptyMessage="Username is required." />
                                <div class="input-group-append"><span class="input-group-text text-muted bg-transparent border-left-0"><em class="fa fa-envelope"></em></span></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group with-focus">
                                <asp:TextBox ID="Password" CssClass="form-control border-right-0" type="password" runat="server" placeholder="Password" required="required" EmptyMessage="Password is required." />
                                <div class="input-group-append"><span class="input-group-text text-muted bg-transparent border-left-0"><em class="fa fa-lock"></em></span></div>
                            </div>
                        </div>
                        <div class="clearfix">
                            <div class="checkbox c-checkbox float-left mt-0">
                                <label>
                                    <input type="checkbox" value="" name="remember"><span class="fa fa-check"></span> Remember Me</label>
                            </div>
                            <div class="float-right"><a class="text-muted" href="#">Forgot your password?</a></div>
                        </div>
                        <div class="col-md-12">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <span class="labelentry" style="color: Red">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></span>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="LoginButton" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div style="display: none">
                                <asp:Button ID="LoginButton" runat="server"
                                    CommandName="Login" CssClass="btn btn-block btn-primary mt-3" Text="Log In" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                            </div>
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>
                                    <div class="progress" style="margin-bottom: 30px">
                                        <img src="Images/loading.gif" alt="" />
                                        Authenticating, please wait...
                                    </div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>
                        <button class="btn btn-block btn-primary mt-3" onclick="ClickLoginButton()" type="button">Login</button>
                        <script>
                            function ClickLoginButton() {
                                document.getElementById('<%=LoginButton.ClientID%>').click();
                            }
                        </script>
                    </form>
                    <div style="display: none">
                        <p class="pt-3 text-center">Need to Signup?</p>
                        <a class="btn btn-block btn-secondary" href="#">Register Now</a>
                    </div>
                </div>
            </div>
            <!-- END card-->
            <div class="p-3 text-center" style="color: white" >
                <span class="mr-2">&copy;</span><span>2020</span><span class="mr-2">-</span><span>Briefcase.ng</span>
            </div>
        </div>
    </div>
    <!-- =============== VENDOR SCRIPTS ===============-->
    <!-- MODERNIZR-->
    <script src="vendor/modernizr/modernizr.custom.js"></script>
    <!-- STORAGE API-->
    <script src="vendor/js-storage/js.storage.js"></script>
    <!-- i18next-->
    <script src="vendor/i18next/i18next.js"></script>
    <script src="vendor/i18next-xhr-backend/i18nextXHRBackend.js"></script>
    <!-- JQUERY-->
    <script src="vendor/jquery/dist/jquery.js"></script>
    <!-- BOOTSTRAP-->
    <script src="vendor/popper.js/dist/umd/popper.js"></script>
    <script src="vendor/bootstrap/dist/js/bootstrap.js"></script>
    <!-- PARSLEY-->
    <script src="vendor/parsleyjs/dist/parsley.js"></script>
    <!-- =============== APP SCRIPTS ===============-->
    <script src="js/app.js"></script>
</body>

</html>
