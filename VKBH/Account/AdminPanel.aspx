<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true"
    CodeBehind="AdminPanel.aspx.cs" Inherits="VKBH.Account.AdminPanel" %>
<%@ Register Src="StudentsUC.ascx" TagPrefix="uc" TagName="StudentsUC" %>
<%@ Register Src="GroupTypesUC.ascx" TagPrefix="uc" TagName="GroupTypesUC" %>
<%@ Register Src="GroupsUC.ascx" TagPrefix="uc" TagName="GroupsUC" %>

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
                Getting started</h1>
            <p class="lead">
                Overview of the project, its contents, and how to get started with a simple template.</p>
        </div>
    </header>
    <div class="container">
        <!-- Docs nav
    ================================================== -->
        <div class="row">
            <div class="span3 bs-docs-sidebar">
                <%--<ul class="nav nav-list bs-docs-sidenav">
                    <li class="nav-header">List header</li>
                    <li class="active"><a href="#download-bootplus">Download</a></li>
                    <li class=""><a href="#file-structure">File structure</a></li>
                    <li class=""><a href="#contents">What's included</a></li>
                    
                    <li class=""><a href="#html-template">HTML template</a></li>
                    <li class=""><a href="#examples">Examples</a></li>
                </ul>--%>
                <ul class="nav nav-list bs-docs-sidenav">
                    <li class="nav-header">Students & Groups</li>
                    <li id="GroupTypesPanelLink" runat="server" class="">
                        <asp:HyperLink NavigateUrl="~/Account/AdminPanel.aspx?p=gtp" runat="server" Text="Group Types" />
                    </li>
                    <li id="GroupsPanelLink" runat="server" class="">
                        <asp:HyperLink NavigateUrl="~/Account/AdminPanel.aspx?p=gp" runat="server" Text="Groups" />
                    </li>
                    <li id="StudentsPanelLink" runat="server" class="">
                        <asp:HyperLink NavigateUrl="~/Account/AdminPanel.aspx?p=st" runat="server" Text="Students" />
                    </li>
                    <li><a href="#">Assign students to groups</a></li>
                    <li class="divider"></li>
                    <li class="nav-header">Students & Groups</li>
                    <li><a href="#">Manage Students </a></li>
                    <li><a href="#">Manage Groups</a></li>
                    <li><a href="#">Assign students to groups</a></li>
                </ul>
            </div>
            <div class="span9">
                <uc:GroupsUC runat="server" ID="ucGroupsUC" />
                <uc:GroupTypesUC runat="server" ID="ucGroupTypesUC" />
                <uc:StudentsUC runat="server" ID="ucStudentsUC" />
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
