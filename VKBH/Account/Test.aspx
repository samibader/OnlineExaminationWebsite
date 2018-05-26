<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true"
    CodeBehind="Test.aspx.cs" Inherits="VKBH.Account.Test" %>

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
    <asp:Panel ID="Part1Panel" runat="server">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <section id="login-form">
                        <div class="page-header">
                            <h1>
                                Assessing your Vocabulary Knowledge</h1>
                        </div>
                        <h4>
                            Please choose one of the four choices to assess your knowledge of the following
                            words.</h4>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>
                                        #
                                    </th>
                                    <th>
                                        Word
                                    </th>
                                    <th>
                                        Choice
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        1
                                    </td>
                                    <td>
                                        <asp:Label ID="Label0" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList0" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                        <asp:CustomValidator ID="CustomValidator1" ErrorMessage="errormessage" EnableClientScript="true"
                                            ClientValidationFunction="validateDate" ControlToValidate="DropDownList0" runat="server"
                                            Display="None" SetFocusOnError="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        2
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                        <asp:CustomValidator ID="CustomValidator2" ErrorMessage="errormessage" EnableClientScript="true"
                                            ClientValidationFunction="validateDate" ControlToValidate="DropDownList1" runat="server"
                                            Display="None" SetFocusOnError="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        3
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList2" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        4
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList3" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        5
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList4" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        6
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList5" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        7
                                    </td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList6" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        8
                                    </td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList7" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        9
                                    </td>
                                    <td>
                                        <asp:Label ID="Label8" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList8" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        10
                                    </td>
                                    <td>
                                        <asp:Label ID="Label9" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList9" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        11
                                    </td>
                                    <td>
                                        <asp:Label ID="Label10" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList10" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        12
                                    </td>
                                    <td>
                                        <asp:Label ID="Label11" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList11" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        13
                                    </td>
                                    <td>
                                        <asp:Label ID="Label12" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList12" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        14
                                    </td>
                                    <td>
                                        <asp:Label ID="Label13" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList13" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        15
                                    </td>
                                    <td>
                                        <asp:Label ID="Label14" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList14" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        16
                                    </td>
                                    <td>
                                        <asp:Label ID="Label15" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList15" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        17
                                    </td>
                                    <td>
                                        <asp:Label ID="Label16" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList16" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        18
                                    </td>
                                    <td>
                                        <asp:Label ID="Label17" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList17" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        19
                                    </td>
                                    <td>
                                        <asp:Label ID="Label18" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList18" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        20
                                    </td>
                                    <td>
                                        <asp:Label ID="Label19" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList19" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        21
                                    </td>
                                    <td>
                                        <asp:Label ID="Label20" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList20" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        22
                                    </td>
                                    <td>
                                        <asp:Label ID="Label21" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList21" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        23
                                    </td>
                                    <td>
                                        <asp:Label ID="Label22" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList22" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        24
                                    </td>
                                    <td>
                                        <asp:Label ID="Label23" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList23" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word." />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning." />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing." />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing." />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <asp:Button ID="GoToPart2Button" Text="Go To Part /2/" CssClass="btn btn-large btn-primary"
                            OnClientClick="javascript:return gotopart2();" runat="server" OnClick="GoToPart2Button_Click" />
                    </section>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="Part2Panel" runat="server">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <section id="Section1">
                        <div class="page-header">
                            <h1>
                                Assessing your Vocabulary Knowledge Part /2/</h1>
                        </div>
                        <h4>
                            Complete the sentences with words that you have scored as 1</h4>
                        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="VKBH.Account.Test"
                            EntityTypeName="" TableName="words" OnSelecting="LinqDataSource1_Selecting">
                        </asp:LinqDataSource>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="LinqDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
                            <HeaderTemplate>
                                <table class="table table-condensed table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                Word
                                            </th>
                                            <th>
                                                Answer
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("Key") %>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="table2">
                                        </asp:RadioButtonList>
                                        <asp:CustomValidator ID="CustomValidator1" ErrorMessage="errormessage" EnableClientScript="true"
                                            ClientValidationFunction="part2_validateRadio" ControlToValidate="RadioButtonList1"
                                            runat="server" Display="None" SetFocusOnError="True" ValidateEmptyText="true" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody> </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <hr />
                        <h4>
                            Fill in the first blank with a word that you have scored as 2</h4>
                        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="VKBH.Account.Test"
                            EntityTypeName="" TableName="words" OnSelecting="LinqDataSource2_Selecting">
                        </asp:LinqDataSource>
                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="LinqDataSource2">
                            <HeaderTemplate>
                                <table class="table table-condensed table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                Word
                                            </th>
                                            <th>
                                                Answer
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("Key") %>
                                    </td>
                                    <td>
                                        <label style="display: inline" for='<%# "inputText"+Eval("Key") %>'>
                                            I think <span style="font-weight: bold; text-decoration: underline">
                                                <%# Eval("Key") %></span> could mean &nbsp;&nbsp;</label>
                                        <%--<input type="text" id='<%# "inputText"+Eval("Key") %>' placeholder="">--%>
                                        <asp:TextBox ID="TextBox1" runat="server" />
                                        <asp:CustomValidator ID="CustomValidator1" ErrorMessage="errormessage" EnableClientScript="true"
                                            ClientValidationFunction="part2_validateTextBox" ControlToValidate="TextBox1"
                                            runat="server" Display="None" SetFocusOnError="True" ValidateEmptyText="true" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody> </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <asp:Button ID="GoToPart3Button" Text="text" runat="server" CssClass="btn btn-large btn-primary"
                            OnClientClick="javascript:return gotopart3();" />
                    </section>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="Part3Panel" runat="server">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <section>
                            <div class="btn-toolbar">
    <div class="btn-group">
    <asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" Text="1" />
    <asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" Text="2" />
    <asp:Button ID="Button3" CssClass="btn btn-danger" runat="server" Text="3" />
    <asp:Button ID="Button4" CssClass="btn btn-danger" runat="server" Text="4" />
    <asp:Button ID="Button5" CssClass="btn btn-danger" runat="server" Text="5" />
    <asp:Button ID="Button6" CssClass="btn btn-danger" runat="server" Text="6" />
    <asp:Button ID="Button7" CssClass="btn btn-danger" runat="server" Text="7" />
    <asp:Button ID="Button8" CssClass="btn btn-danger" runat="server" Text="8" />
    <asp:Button ID="Button9" CssClass="btn btn-danger" runat="server" Text="9" />
    <asp:Button ID="Button10" CssClass="btn btn-danger" runat="server" Text="10" />
    <asp:Button ID="Button11" CssClass="btn btn-danger" runat="server" Text="11" />
    <asp:Button ID="Button12" CssClass="btn btn-danger" runat="server" Text="12" />
    <asp:Button ID="Button13" CssClass="btn btn-danger" runat="server" Text="13" />
    <asp:Button ID="Button14" CssClass="btn btn-danger" runat="server" Text="14" />
    <asp:Button ID="Button15" CssClass="btn btn-danger" runat="server" Text="15" />
    <asp:Button ID="Button16" CssClass="btn btn-danger" runat="server" Text="16" />
    <asp:Button ID="Button17" CssClass="btn btn-danger" runat="server" Text="17" />
    <asp:Button ID="Button18" CssClass="btn btn-danger" runat="server" Text="18" />
    <asp:Button ID="Button19" CssClass="btn btn-danger" runat="server" Text="19" />
    <asp:Button ID="Button20" CssClass="btn btn-danger" runat="server" Text="20" />
    <asp:Button ID="Button21" CssClass="btn btn-danger" runat="server" Text="21" />
    <asp:Button ID="Button22" CssClass="btn btn-danger" runat="server" Text="22" />
    <asp:Button ID="Button23" CssClass="btn btn-danger" runat="server" Text="23" />
    <asp:Button ID="Button24" CssClass="btn btn-danger" runat="server" Text="24" />
    <asp:Button ID="Button25" CssClass="btn btn-danger" runat="server" Text="25" />
    <asp:Button ID="Button26" CssClass="btn btn-danger" runat="server" Text="26" />
    <asp:Button ID="Button27" CssClass="btn btn-danger" runat="server" Text="27" />
    <asp:Button ID="Button28" CssClass="btn btn-danger" runat="server" Text="28" />
    <asp:Button ID="Button29" CssClass="btn btn-danger" runat="server" Text="29" />
    <asp:Button ID="Button30" CssClass="btn btn-danger" runat="server" Text="30" />
    <asp:Button ID="Button31" CssClass="btn btn-danger" runat="server" Text="31" />
    <asp:Button ID="Button32" CssClass="btn btn-danger" runat="server" Text="32" />
    <asp:Button ID="Button33" CssClass="btn btn-danger" runat="server" Text="33" />
    <asp:Button ID="Button34" CssClass="btn btn-danger" runat="server" Text="34" />
    <asp:Button ID="Button35" CssClass="btn btn-danger" runat="server" Text="35" />
    <asp:Button ID="Button36" CssClass="btn btn-danger" runat="server" Text="36" />
    <asp:Button ID="Button37" CssClass="btn btn-danger" runat="server" Text="37" />
    <asp:Button ID="Button38" CssClass="btn btn-danger" runat="server" Text="38" />
    <asp:Button ID="Button39" CssClass="btn btn-danger" runat="server" Text="39" />
    <asp:Button ID="Button40" CssClass="btn btn-danger" runat="server" Text="40" />
    </div>
    
    </div>
    <asp:Button ID="GoToPart4Button" CssClass="btn btn-primary" runat="server" Text="Go to Part /4/" />
                    </section>
                </div>
            </div>
            <div class="row">
                <div class="span5">
                    <section>
                        <div class="page-header">
                            <h1>
                                Reading Text</h1>
                        </div>
                        <p class="text-center">
                            Why Are You Happy?</p>
                        <p>
                            Are you happy? It is a simple question, one that you can instinctively answer with
                            an easy “yes” or “no”. However, for some obscure reason the question “What is happiness?”
                            is more difficult to answer. So too is the question that follows: How do we achieve
                            it?</p>
                        <p>
                            Well, defining happiness is not quite as simple as it might seem. Go into any mall
                            these days and you’ll find many people shopping at a frantic pace, believing that
                            happiness is the thrill of buying a new pair of shoes or the latest high-tech device.
                            Indeed, the idea of happiness has been a topic of much thought and discussion within
                            the fields of philosophy, religion, and science for the past 2500 years.</p>
                        <p>
                            A follower of Confucius, the famous Chinese philosopher, would say that happiness
                            is the joy obtained from learning about humanity through social relationships and
                            good deeds. Those good deeds, however, do not include going to the grocery store
                            because your mother has told you to, or treating yourself to a steak at a restaurant
                            after a hard day’s work.
                        </p>
                        <p>
                            In fact, a Buddhist would say that happiness is the reverse of consumerism, because
                            happiness consists of self-discipline and a life without longing. Another perspective
                            comes from scientists who have demonstrated that 50 percent of happiness is a result
                            of the genes we inherit from our parents rather than the jeans we purchase at the
                            mall.</p>
                        <p>
                            So, who is right, the shopper, the philosopher, the monk, or the scientist? Perhaps
                            the answer lies in the field of psychology or, more specifically, positive psychology.
                            In 1998, Martin Seligman, a psychologist at the University of Pennsylvania, gave
                            a speech at the American Psychological Association in which he said that rather
                            than devoting attention to unhappiness, psychology needed to change direction and
                            focus instead on people for whom everything was going well.
                        </p>
                        <p>
                            Seligman said psychologists had a reasonably good understanding of depression, but
                            they knew almost nothing about the mysteries of a happy life. He argued that if
                            psychologists could isolate what those were, then people might be able to learn
                            how to make themselves more satisfied with and cheerful about their lives. This
                            was the beginning of positive psychology.</p>
                        <p>
                            Since then, research on happiness has come up with some astonishing facts. If we
                            go back to the mall, shopping can indeed be a source of happiness, but it is significantly
                            less so once your basic needs have been met. The best kind of “retail therapy” is
                            to shop for someone else. This is consistent with the Chinese teachings of 2,500
                            years ago that assert that happiness lies in acting within social networks, rather
                            than for our individual benefit only.</p>
                        <p>
                            Again, current research agrees. In 2002, a University of Illinois study found that
                            students with the highest level of happiness and the fewest signs of depression
                            were those with strong friendship and family networks. Religion facilitates happiness
                            in a similar manner. Once again, a review of a large number of research studies
                            on the links between religion and happiness has concluded that there is a positive
                            correlation between religious commitment and higher levels of perceived well-being
                            and self-esteem.</p>
                        <p>
                            Grafting modern research onto Confucian philosophy, we can go back to our original
                            question and say that happiness is a very personal combination of genetics, actions,
                            and beliefs. In the future, it may become a standard practice for therapists to
                            suggest interventions that boost happiness levels-including thanking people, writing
                            letters to old friends, and hanging out with family. Who knew that learning to feel
                            good could feel so good?
                        </p>
                    </section>
                </div>
                <div class="span6 offset1">
                    <section>
                        <div class="page-header">
                            <h1>
                                Questions</h1>
                        </div>
                        <h4>
                            <strong>• Choose one of the target words in a, b, or c to define the following terms.</strong></h4>
                        <ol>
                            <li>
                                <p>
                                    Something occurring because of a natural tendency to behave in a particular way or a natural ability to know something that is not learned is something occurring:</p>
                                
                                <label class="radio">
                                <input type="radio" name="Radios1" value="option1" />
                                instinctively </label>
                                <label class="radio" >
                                <input type="radio" name="Radios1" value="option2" />
                                happily </label>
                                <label class="radio" >
                                <input type="radio" name="Radios1" value="option3" />
                                obscurely </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 A place where you can buy and eat a meal is a:</p>
                                
                                <label class="radio">
                                <input type="radio" name="Radios2" value="option1" />
                                grocery </label>
                                <label class="radio" >
                                <input type="radio" name="Radios2" value="option2" />
                                work </label>
                                <label class="radio" >
                                <input type="radio" name="Radios2" value="option3" />
                                restaurant </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 The way in which something is done or happens is:</p>
                                
                                <label class="radio">
                                <input type="radio" name="Radios3" value="option1" />
                                manner </label>
                                <label class="radio" >
                                <input type="radio" name="Radios3" value="option2" />
                                review </label>
                                <label class="radio" >
                                <input type="radio" name="Radios3" value="option3" />
                                esteem </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 An event, situation, etc., that people do not understand or cannot explain because they do not know enough about it is:</p>
                                
                                <label class="radio">
                                <input type="radio" name="Radios4" value="option1" />
                                depression </label>
                                <label class="radio" >
                                <input type="radio" name="Radios4" value="option2" />
                                mystery </label>
                                <label class="radio" >
                                <input type="radio" name="Radios4" value="option3" />
                                understanding </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 To add something very different to something, so that it becomes part of it is to:</p>
                                <label class="radio">
                                <input type="radio" name="Radios5" value="option1" />
                                boost </label>
                                <label class="radio" >
                                <input type="radio" name="Radios5" value="option2" />
                                graft </label>
                                <label class="radio" >
                                <input type="radio" name="Radios5" value="option3" />
                                suggest </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 Something a person does, especially something that is very good or bad is:</p>
                                <label class="radio">
                                <input type="radio" name="Radios6" value="option1" />
                                joy </label>
                                <label class="radio" >
                                <input type="radio" name="Radios6" value="option2" />
                                relationships </label>
                                <label class="radio" >
                                <input type="radio" name="Radios6" value="option3" />
                                deed </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 The study of the nature and meaning of existence, truth, good, and evil is:</p>
                                <label class="radio">
                                <input type="radio" name="Radios7" value="option1" />
                                science </label>
                                <label class="radio" >
                                <input type="radio" name="Radios7" value="option2" />
                                philosophy </label>
                                <label class="radio" >
                                <input type="radio" name="Radios7" value="option3" />
                                hi-tech </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 The speed at which something happens or is done is:</p>
                                <label class="radio">
                                <input type="radio" name="Radios8" value="option1" />
                                thrill </label>
                                <label class="radio" >
                                <input type="radio" name="Radios8" value="option2" />
                                pace </label>
                                <label class="radio" >
                                <input type="radio" name="Radios8" value="option3" />
                                happiness </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 Treatment that helps someone feel better or grow stronger is:</p>
                                <label class="radio">
                                <input type="radio" name="Radios9" value="option1" />
                                shopping </label>
                                <label class="radio" >
                                <input type="radio" name="Radios9" value="option2" />
                                therapy </label>
                                <label class="radio" >
                                <input type="radio" name="Radios9" value="option3" />
                                benefit </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 To use all or most of your time and effort in order to do something or help someone is to:</p>
                                <label class="radio">
                                <input type="radio" name="Radios10" value="option1" />
                                change </label>
                                <label class="radio" >
                                <input type="radio" name="Radios10" value="option2" />
                                focus </label>
                                <label class="radio" >
                                <input type="radio" name="Radios10" value="option3" />
                                devote </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 To be born with the same character or physical appearance as your parents is to:</p>
                                <label class="radio">
                                <input type="radio" name="Radios11" value="option1" />
                                consist of </label>
                                <label class="radio" >
                                <input type="radio" name="Radios11" value="option2" />
                                inherit </label>
                                <label class="radio" >
                                <input type="radio" name="Radios11" value="option3" />
                                purchase </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 A feeling of respect for someone, or a good opinion of someone is:</p>
                                <label class="radio">
                                <input type="radio" name="Radios12" value="option1" />
                                manner </label>
                                <label class="radio" >
                                <input type="radio" name="Radios12" value="option2" />
                                esteem </label>
                                <label class="radio" >
                                <input type="radio" name="Radios12" value="option3" />
                                review </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 A large, thick piece of good-quality red meat is:</p>
                                <label class="radio">
                                <input type="radio" name="Radios13" value="option1" />
                                steak </label>
                                <label class="radio" >
                                <input type="radio" name="Radios13" value="option2" />
                                grocery </label>
                                <label class="radio" >
                                <input type="radio" name="Radios13" value="option3" />
                                chicken breast </label>
                                <hr />
                            </li>
                            <li>
                            <p>
                                 A member of an all-male religious group that lives apart from other people is a:</p>
                                <label class="radio">
                                <input type="radio" name="Radios14" value="option1" />
                                philosopher </label>
                                <label class="radio" >
                                <input type="radio" name="Radios14" value="option2" />
                                scientist </label>
                                <label class="radio" >
                                <input type="radio" name="Radios14" value="option3" />
                                monk </label>
                                <hr />
                            </li>
                        </ol>
                    </section>
                </div>
            </div>
        </div>
    </asp:Panel>
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
    <script type="text/javascript">
        function validateDate(oSrc, args) {
            if (args.Value == "-- Please Choose --") {
                args.IsValid = false;
                //alert(oSrc);
                $(oSrc).closest('tr').addClass('error');
                //$(oSrc).closest('tr').focus();
                //alert('Some questions are not answered , please check .. ');
                return;
            }
            else {
                args.IsValid = true;
                //alert(oSrc);
                $(oSrc).closest('tr').removeClass('error');
                //return confirm('are you sure ?');
                return true;
            }
        }

        function part2_validateRadio(oSrc, args) {
            var rbl = document.getElementById(oSrc.controltovalidate);
            var check = $(rbl).find("input:checked").length > 0 ? true : false;
            if (check) {
                args.isValid = true;
                $(oSrc).closest('tr').removeClass('error');
                return true;
            }
            else {
                args.IsValid = false;
                $(oSrc).closest('tr').addClass('error');
                return;
            }
        }

        function part2_validateTextBox(oSrc, args) {
            var rbl = document.getElementById(oSrc.controltovalidate);
            var check = $(rbl).val().length > 0 ? true : false;
            if (check) {
                args.isValid = true;
                $(oSrc).closest('tr').removeClass('error');
                return true;
            }
            else {
                args.IsValid = false;
                $(oSrc).closest('tr').addClass('error');
                return;
            }
        }

        function gotopart2() {
            Page_ClientValidate();
            if (this.Page_IsValid) {
                return confirm('Are you sure you want to submit your answers and go to part /2/ ?');
            }
            return false;
        }
        function gotopart3() {
            Page_ClientValidate();
            if (this.Page_IsValid) {
                return confirm('Are you sure you want to submit your answers and go to the next part of exam ?');
            }
            return false;
        }
    </script>
</asp:Content>
