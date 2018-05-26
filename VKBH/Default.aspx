<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="VKBH._Default" %>

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
                        <li class="active"><asp:HyperLink NavigateUrl="~/Default.aspx" runat="server" ID="HomeLink">Home</asp:HyperLink> </li>
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
     <div class="hero-unit">
        <div class="container">
            <h1>
                Welcome to the Vocabulary Knowledge Building Helper</h1>
                <br />
            <p>
                I am Hadeel Awad, an PHD student in Applied Linguistics and TESOL in Newcastle University in the United Kingdom. The purpose of my research is to have a deeper understanding of the potential of computer-based materials in facilitating the building of vocabulary knowledge through extensive reading in Syrian classrooms. .</p>
            <p>
                <a href="#" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
        </div>
    </div>
    <div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="span8">
                <div class="card">
                    <h3 class="card-heading simple">
                        Introduction</h3>
                    <div class="card-body">
                        <p>
                            <strong>Do you want to improve your English vocabulary? </strong>
                            </p>
                            <p>
                            <strong>Do you find it difficult to look up words in that very big book called "DICTIONARY" every now and then?</strong>
                            </p>
                            <p>
                            I think you need to try to read, read and read. Enjoy reading to the maaax and don't think of anything
other than the topic in hand.
                            </p>
                    </div>
                </div>
            </div>
            <div class="span4">
                <div class="card hovercard pull-right">
            <img alt="" src="assets/img/author-cover.jpg">
            <div class="avatar">
               <img alt="" src="assets/img/author-avatar.jpg">
            </div>
            <div class="info">
               <div class="title">
                  <a href="http://www.marcellop.com">Hadeel Awad</a>
               </div>
               <div class="desc">Passionate designer</div>
               <div class="desc">Curious developer</div>
               <div class="desc">Tech geek</div>
            </div>
            <div class="bottom">
               <a class="btn btn-block" href="https://twitter.com/aozoralabs">
                  <i class="icon-twitter"></i>
                  Follow on Twitter
               </a>
               <a class="btn btn-block" rel="publisher" href="https://plus.google.com/117689250782136016574">
                  <i class="icon-google-plus"></i>
                  Follow on Google+
               </a>
            </div>
         </div>
            </div>
        </div>
        <footer>
        <p>&copy; Company 2013</p>
      </footer>
    </div>
    <!-- /container -->
    <!-- Le javascript
      ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="assets/js/jquery.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-transition.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-alert.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-modal.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-dropdown.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-scrollspy.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-tab.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-tooltip.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-popover.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-button.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-collapse.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-carousel.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-typeahead.js"></script>
</asp:Content>
