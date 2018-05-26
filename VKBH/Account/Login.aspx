<%@ Page Title="Log In" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="VKBH.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="NavigationContent" runat="server" ContentPlaceHolderID="NavContent">
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                    </span>
                </button>
                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx" CssClass="brand" Text="VKBH" runat="server" />
                <div class="nav-collapse collapse">
                    <ul class="nav">
                        <li><asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" ID="HomeLink">Home</asp:HyperLink> </li>
                    </ul>
                    <div class="navbar-form pull-right" style="padding:10px;">
                     <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                        [ <a href="~/Account/Login.aspx" ID="HeadLoginStatus" runat="server">Log In</a> ]
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Welcome <strong><asp:LoginName ID="HeadLoginName" runat="server" /></strong>&nbsp;!
                        [ <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out" LogoutPageUrl="~/"/> ]
                    </LoggedInTemplate>
                </asp:LoginView>
                    </div>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="container">
        <ul class="breadcrumb">
            <li>
                <asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" Text="Home" />
                <span class="divider">/</span></li>
            <li class="active">Login</li>
        </ul>
        <div class="row">
            <div class="span4 offset4">
                <div class="card">
                    <h3 class="card-heading simple">
                        Please Login</h3>
                    <div class="card-body">
                        <div class="form-signin">
                            <p>
                                Please enter your username and password ..
                            </p>
                            <asp:Login ID="Login1" runat="server" EnableViewState="false" 
                                RenderOuterTable="false" onloggedin="Login1_LoggedIn">
                                <LayoutTemplate>
                                    <asp:TextBox ID="UserName" runat="server" CssClass="input-large" placeholder="Username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                        <br />
                                    <asp:TextBox ID="Password" runat="server" CssClass="input-large" placeholder="Password"
                                        TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                        ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                    <label class="checkbox">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me" /></label>
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup"
                                        CssClass="btn btn-primary" />
                                        <br />
                                        <br />
                                        <span class="failureNotification">
                                        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                    </span>
                                        <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                                        ValidationGroup="LoginUserValidationGroup" />
                                        <br />
                                        <br />
                                </LayoutTemplate>
                            </asp:Login>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /container -->
   <!-- Le javascript
      ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-transition.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-alert.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-modal.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-dropdown.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-scrollspy.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-tab.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-tooltip.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-popover.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-button.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-collapse.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-carousel.js"></script>
    <script type="text/javascript" src="../assets/js/bootstrap-typeahead.js"></script>
</asp:Content>
