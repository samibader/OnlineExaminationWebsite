<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true"
    CodeBehind="StudentPanel.aspx.cs" Inherits="VKBH.Account.StudentPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../assets/css/docs.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavContent" runat="server">
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                    </span>
                </button>
                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx" CssClass="brand" Text="VKBH"
                    runat="server" />
                <div class="nav-collapse collapse">
                    <ul class="nav">
                        <li class="active">
                            <asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" ID="HomeLink">Home</asp:HyperLink>
                        </li>
                    </ul>
                    <div class="navbar-form pull-right" style="padding: 10px;">
                        <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                            <AnonymousTemplate>
                                [ <a href="~/Account/Login.aspx" id="HeadLoginStatus" runat="server">Log In</a>
                                ]
                            </AnonymousTemplate>
                            <LoggedInTemplate>
                                Welcome <strong>
                                    <asp:LoginName ID="HeadLoginName" runat="server" />
                                </strong>&nbsp;! [
                                <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out"
                                    LogoutPageUrl="~/" />
                                ]
                            </LoggedInTemplate>
                        </asp:LoginView>
                    </div>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <header id="overview" class="jumbotron subhead">
        <div class="container">
            <h1>
                Student Panel</h1>
            <p class="lead">
                Here you can find samples of the exams , try it out .</p>
        </div>
    </header>
    <div class="container">
        <!-- Docs nav
    ================================================== -->
        <div class="row">
            
            <div class="span12">
                 <section id="login-form">
                        <div class="page-header">
                            <h1>
                                Available Exams :</h1>
                        </div>
                        <table class="table table-condensed table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                #
                                            </th>
                                            <th>
                                                Exam Type
                                            </th>
                                            <th>
                                                Operations
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                            <td>
                                                1
                                            </td>
                                            <td>
                                                Split-Attention
                                            </td>
                                            <td>
                                                <asp:HyperLink NavigateUrl="~/Account/SAT-Test.aspx?Examid=1" Text="Try Now" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                2
                                            </td>
                                            <td>
                                                Integrated
                                            </td>
                                            <td>
                                                <a href="">Try Now</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                    </table>
                </section>
            </div>
        </div>
    </div>
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
