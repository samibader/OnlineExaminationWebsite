<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true"
    CodeBehind="INT-Test.aspx.cs" Inherits="VKBH.Account.INT_Test" %>

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
            <h1 id="ExamTitle" runat="server">
                Split-Attention Test</h1>
            <div class="wizard">
                <a class="current" id="WizardStep1" runat="server"><span class="badge badge-inverse">
                    1</span> Vocabulary Knowledge</a> <a id="WizardStep2" runat="server"><span class="badge badge-inverse">
                        2</span> Knowledge Check 1</a> <a id="WizardStep3" runat="server"><span class="badge badge-inverse">
                            3</span> Reading Text</a> <a id="WizardStep4" runat="server"><span class="badge badge-inverse">
                                4</span> Revisiting the Target Words</a> <a id="WizardStep5" runat="server"><span
                                    class="badge badge-inverse">5</span> Knowledge Check 2</a>
            </div>
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
                        <asp:Repeater ID="Part1Repeater" runat="server" DataSourceID="Exam_VocabularySqlDataSource">
                            <HeaderTemplate>
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
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("RowNumber") %>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label0" Text='<%# Eval("Word") %>' runat="server"></asp:Label><asp:HiddenField
                                            ID="HiddenField1" runat="server" Value='<%# Eval("Id") %>' />
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I don’t know this word."  Value="1" />
                                            <asp:ListItem Text="2.	I have seen or heard this word before, but I am not sure of the meaning."
                                                Value="2" />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking or writing."
                                                Value="3"/>
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing."
                                                Value="4" />
                                        </asp:DropDownList>
                                        <asp:CustomValidator ID="CustomValidator1" ErrorMessage="errormessage" EnableClientScript="true"
                                            ClientValidationFunction="validatePart1" ControlToValidate="DropDownList1" runat="server"
                                            Display="None" SetFocusOnError="True" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody> </table>
                            </FooterTemplate>
                        </asp:Repeater>
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
                                Knowledge Check /1/</h1>
                        </div>
                        <h4>
                            Complete the sentences with words that you have scored as 1</h4>
                        <asp:Repeater ID="Part2Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound"
                            DataSourceID="KnowledgeCheckScore1SqlDataSource">
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
                                        <asp:Label ID="Label0" Text='<%# Eval("Word") %>' runat="server"></asp:Label><asp:HiddenField
                                            ID="HiddenField1" runat="server" Value='<%# Eval("Id") %>' />
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
                        <asp:Repeater ID="Part2Repeater2" runat="server" DataSourceID="KnowledgeCheckScore2SqlDataSource">
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
                                        <asp:Label ID="Label0" Text='<%# Eval("Word") %>' runat="server"></asp:Label><asp:HiddenField
                                            ID="HiddenField1" runat="server" Value='<%# Eval("Id") %>' />
                                    </td>
                                    <td>
                                        <label style="display: inline" for='<%# "inputText"+Eval("Word") %>'>
                                            I think <span style="font-weight: bold; text-decoration: underline">
                                                <%# Eval("Word")%></span> could mean &nbsp;&nbsp;</label>
                                        <%--<input type="text" id='<%# "inputText"+Eval("Word") %>' placeholder="">--%>
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
                        <asp:Button ID="GoToPart3Button" Text="Go To Part /3/" runat="server" CssClass="btn btn-large btn-primary"
                            OnClientClick="javascript:return gotopart3();" 
                            onclick="GoToPart3Button_Click" />
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
                                <asp:Repeater runat="server" ID="ButtonsRepeater" OnItemDataBound="ButtonsRepeater_ItemDataBound">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" Text='<%# Eval("QuestionOrder") %>' OnCommand="ShowQuestion" CommandName='<%# Eval("QuestionOrder") %>' />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <asp:Button ID="GoToPart4Button" CssClass="btn btn-primary" runat="server" 
                            Text="Go to Part /4/" OnClientClick="javascript:return gotopart4();" 
                            onclick="GoToPart4Button_Click" />
                    </section>
                </div>
            </div>
            <div class="row">
                <div class="span6">
                    <section>
                        <div class="page-header">
                            <h1>
                                Reading Text</h1>
                        </div>
                        <p class="text-center">
                            <strong>
                                <asp:Label ID="ReadingTextTitle" runat="server" /></strong></p>
                        <asp:Repeater ID="ReadingTextPartsRepeater" runat="server" DataSourceID="ReadingTextPartsSqlDataSource">
                            <ItemTemplate>
                                <p>
                                    <%# Eval("Text") %>
                                </p>
                            </ItemTemplate>
                        </asp:Repeater>
                    </section>
                </div>
                <div class="span5 offset1">
                    <asp:Repeater ID="QuestionsRepeater" runat="server" 
                        onitemdatabound="QuestionsRepeater_ItemDataBound" 
                        onitemcommand="QuestionsRepeater_ItemCommand">
                        <ItemTemplate>
                           <asp:HiddenField ID="HiddenQuestionID" Value='<%# Eval("Id") %>' runat="server" />
                           <asp:HiddenField ID="HiddenQuestionOrder" Value='<%# Eval("QuestionOrder") %>' runat="server" />
                            <section>
                                <div class="page-header">
                                    <h1>
                                        Question No /<%# Eval("QuestionOrder") %>/</h1>
                                </div>
                                <h4>
                                    <strong>
                                        <%# Eval("QuestionText") %></strong></h4>
                                <p>
                                    <%# Eval("Text") %>
                                </p>
                                 <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="table2" RepeatLayout="OrderedList" ValidationGroup="vg10"  >
                                        </asp:RadioButtonList>
                                        
                                <asp:Button Text="Validate" ID="Button1" runat="server" CssClass="btn btn-info" ValidationGroup="vg10" CommandName="validateAnswer" CommandArgument='<%# Eval("QuestionOrder") %>'/> &nbsp;&nbsp;<div class="text-error">
                                <asp:RequiredFieldValidator ControlToValidate="RadioButtonList1" runat="server" ErrorMessage="Answer Required !!!" ValidationGroup="vg10"></asp:RequiredFieldValidator>
                                <br />
                                <asp:Label Font-Italic="true" ID="ResultLabel" runat="server"></asp:Label>

                                </div>
                            </section>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="Part4Panel" runat="server">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <section id="Section2">
                        <div class="page-header">
                            <h1>
                                Revisiting the Target Words</h1>
                        </div>
                        <h4>
                            Now that you have completed this session, choose one of the four choices to describe your knowledge of the following words.
                            words.</h4>
                        <asp:Repeater ID="Part4Repeater" runat="server" DataSourceID="Exam_VocabularySqlDataSource">
                            <HeaderTemplate>
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
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%# Eval("RowNumber") %>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label0" Text='<%# Eval("Word") %>' runat="server"></asp:Label><asp:HiddenField
                                            ID="HiddenField1" runat="server" Value='<%# Eval("Id") %>' />
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                            <asp:ListItem Text="-- Please Choose --" />
                                            <asp:ListItem Text="1.	I still don’t know anything about this word."  Value="1" />
                                            <asp:ListItem Text="2.	I am still not sure about the meaning of this word even after studying it."
                                                Value="2" />
                                            <asp:ListItem Text="3.	I understand this word when I see it or hear it in a sentence, but I don’t know how to use it in my own speaking and writing."
                                                Value="3" />
                                            <asp:ListItem Text="4.	I know this word and can use it in my own speaking and writing."
                                                Value="4" />
                                        </asp:DropDownList>
                                        <asp:CustomValidator ID="CustomValidator1" ErrorMessage="errormessage" EnableClientScript="true"
                                            ClientValidationFunction="validatePart4" ControlToValidate="DropDownList1" runat="server"
                                            Display="None" SetFocusOnError="True" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody> </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <asp:Button ID="Button2" Text="Go To Part /5/" CssClass="btn btn-large btn-primary"
                            OnClientClick="javascript:return gotopart5();" runat="server" OnClick="GoToPart5Button_Click" />
                    </section>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="Part5Panel" runat="server">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <section id="Section3">
                        <div class="page-header">
                            <h1>
                                Knowledge Check /2/</h1>
                        </div>
                        <h4>
                            Select examples from the words you now give score 3 or 4, but didn’t at the start of the chapter, to complete the sentences.</h4>
                        <ol>
                            <li>I didn’t know that 
                                <asp:DropDownList runat="server" DataSourceID="KnowledgeCheck2SqlDataSource" 
                                    DataTextField="Word" DataValueField="Id">
                                    
                                </asp:DropDownList> meant 
                                <asp:TextBox runat="server" /> before reading this text.</li>
                            <li>I wasn’t sure that I knew the meaning of <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="KnowledgeCheck2SqlDataSource" 
                                    DataTextField="Word" DataValueField="Id">
                                    
                                </asp:DropDownList>, but I am now.</li>
                            <li>I now am confident that I know what <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="KnowledgeCheck2SqlDataSource" 
                                    DataTextField="Word" DataValueField="Id">
                                    
                                </asp:DropDownList> means, but I would like more practice with how to use it in my speaking and writing.</li>
                            <li>I could next use <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="KnowledgeCheck2SqlDataSource" 
                                    DataTextField="Word" DataValueField="Id">
                                    
                                </asp:DropDownList> when I am <asp:TextBox ID="TextBox2" runat="server" />.</li>
                        </ol>
                        <asp:Button ID="FinishButton" Text="Finish Exam" runat="server" CssClass="btn btn-large btn-primary"
                            OnClientClick="javascript:return finish();" 
                            onclick="FinishButton_Click" />
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
        function validatePart1(oSrc, args) {
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
                return confirm('Are you sure you want to submit your answers and go to next part ?');
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

        function gotopart4() {
            var isOk=true;
            for (var i = 0; i < 39; i++) {
                var btn = document.getElementById("MainContent_ButtonsRepeater_Button1_" + i);
                if ($(btn).hasClass("btn-danger"))
                    isOk = false;
            }
            if (!isOk) {
                alert('you have some unanswered questions , please answer all of your questions first');
                return false;
            }
            else
                return confirm('Are you sure you want to submit your answers and go to the next part of exam ?');

        }

        function validatePart4(oSrc, args) {
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

        function gotopart5() {
            Page_ClientValidate();
            if (this.Page_IsValid) {
                return confirm('Are you sure you want to submit your answers and go to next part ?');
            }
            return false;
        }

        function finish() {
            
            
                return confirm('Are you sure you want to submit your answers and finish the exam ?');
            
        }
    </script>
    <asp:SqlDataSource ID="Exam_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT * FROM [Exam] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="ExamId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Exam_VocabularySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT ROW_NUMBER() OVER(ORDER BY Vocabulary.Word) as RowNumber, Vocabulary.Word, Vocabulary.Id FROM Exam_Vocabulary INNER JOIN Vocabulary ON Exam_Vocabulary.VocabularyId = Vocabulary.Id WHERE (Exam_Vocabulary.ExamId = @ExamId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ExamId" QueryStringField="ExamId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="VocabularyKnowledgeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        InsertCommand="INSERT INTO VocabularyKnowledge(StudentExamId, VocabularyId, Answer) VALUES (@StudentExamId, @VocabularyId, @Answer)"
        OnInserting="VocabularyKnowledgeSqlDataSource_Inserting" 
        SelectCommand="SELECT StudentExamId, VocabularyId, Answer FROM VocabularyKnowledge" 
        DeleteCommand="delete from vocabularyknowledge">
        <InsertParameters>
            <asp:Parameter Name="StudentExamId" />
            <asp:Parameter Name="VocabularyId" />
            <asp:Parameter Name="Answer" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="KnowledgeCheckScore1SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        OnSelecting="KnowledgeCheckScore1SqlDataSource_Selecting" SelectCommand="SELECT Vocabulary.Word, Vocabulary.Id FROM Vocabulary INNER JOIN VocabularyKnowledge ON Vocabulary.Id = VocabularyKnowledge.VocabularyId WHERE (VocabularyKnowledge.StudentExamId = @StudentExamId) AND (VocabularyKnowledge.Answer = 1)">
        <SelectParameters>
            <asp:Parameter Name="StudentExamId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="KnowledgeCheckScore2SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        OnSelecting="KnowledgeCheckScore1SqlDataSource_Selecting" SelectCommand="SELECT Vocabulary.Word, Vocabulary.Id FROM Vocabulary INNER JOIN VocabularyKnowledge ON Vocabulary.Id = VocabularyKnowledge.VocabularyId WHERE (VocabularyKnowledge.StudentExamId = @StudentExamId) AND (VocabularyKnowledge.Answer = 2)">
        <SelectParameters>
            <asp:Parameter Name="StudentExamId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ReadingTextSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT ReadingText.Id, ReadingText.Title FROM Exam_ReadingText INNER JOIN ReadingText ON Exam_ReadingText.ReadingTextId = ReadingText.Id WHERE (Exam_ReadingText.ExamId = @ExamId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ExamId" QueryStringField="ExamId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ReadingTextPartsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        OnSelecting="ReadingTextPartsSqlDataSource_Selecting" SelectCommand="SELECT * FROM [ReadingTextPart] WHERE ([ReadingTextId] = @ReadingTextId)">
        <SelectParameters>
            <asp:Parameter Name="ReadingTextId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ExamQuestionsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        SelectCommand="SELECT ROW_NUMBER() OVER(Order by newid()) as RowNumber, Question.*, QuestionType.QuestionText FROM Exam_ReadingText INNER JOIN Exam ON Exam_ReadingText.ExamId = Exam.Id INNER JOIN ReadingTextPart INNER JOIN ReadingText ON ReadingTextPart.ReadingTextId = ReadingText.Id ON Exam_ReadingText.ReadingTextId = ReadingText.Id INNER JOIN Question ON ReadingTextPart.Id = Question.ReadingTextPartId INNER JOIN QuestionType ON Question.QuestionTypeId = QuestionType.Id
Where Exam.Id=@ExamId
">
        <SelectParameters>
            <asp:QueryStringParameter Name="ExamId" QueryStringField="ExamId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="StudentReadingAnswerSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        InsertCommand="INSERT INTO StudentReadingAnswer(StudentExamId, QuestionId, StudentAnswer, QuestionOrder) VALUES (@StudentExamId, @QuestionId, null, @QuestionOrder)"
        OnInserting="StudentReadingAnswerSqlDataSource_Inserting" SelectCommand="SELECT StudentReadingAnswer.StudentAnswer, StudentReadingAnswer.QuestionOrder, Question.*, QuestionType.* FROM StudentReadingAnswer INNER JOIN Question ON StudentReadingAnswer.QuestionId = Question.Id INNER JOIN QuestionType ON Question.QuestionTypeId = QuestionType.Id WHERE (StudentReadingAnswer.StudentExamId = @StudentExamId)
order by StudentReadingAnswer.QuestionOrder" 
        OnSelecting="StudentReadingAnswerSqlDataSource_Selecting" 
        onupdating="StudentReadingAnswerSqlDataSource_Updating" 
        
        UpdateCommand="UPDATE StudentReadingAnswer SET StudentAnswer = @StudentAnswer WHERE (StudentExamId = @StudentExamId) AND (QuestionId = @QuestionId) AND (QuestionOrder = @QuestionOrder)" 
        DeleteCommand="DELETE FROM StudentReadingAnswer WHERE (StudentExamId = @StudentExamId)" 
        ondeleting="StudentReadingAnswerSqlDataSource_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="StudentExamId" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="StudentExamId" />
            <asp:Parameter Name="QuestionId" />
            <asp:Parameter Name="QuestionOrder" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="StudentExamId" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="StudentAnswer" />
            <asp:Parameter Name="StudentExamId" />
            <asp:Parameter Name="QuestionId" />
            <asp:Parameter Name="QuestionOrder" />
        </UpdateParameters>
    </asp:SqlDataSource>

     <asp:SqlDataSource ID="VocabularyKnowledge2SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
        InsertCommand="INSERT INTO VocabularyKnowledge2(StudentExamId, VocabularyId, Answer) VALUES (@StudentExamId, @VocabularyId, @Answer)"
        OnInserting="VocabularyKnowledge2SqlDataSource_Inserting" 
        SelectCommand="SELECT StudentExamId, VocabularyId, Answer FROM VocabularyKnowledge2" 
        DeleteCommand="delete from vocabularyknowledge2">
        <InsertParameters>
            <asp:Parameter Name="StudentExamId" />
            <asp:Parameter Name="VocabularyId" />
            <asp:Parameter Name="Answer" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="KnowledgeCheck2SqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT Vocabulary.Word, Vocabulary.Id FROM Vocabulary INNER JOIN VocabularyKnowledge2 ON Vocabulary.Id = VocabularyKnowledge2.VocabularyId WHERE (VocabularyKnowledge2.StudentExamId = @StudentExamId) AND ((VocabularyKnowledge2.Answer = 3)OR(VocabularyKnowledge2.Answer = 4)) AND (Vocabulary.Id  IN
( 
SELECT Vocabulary.Id FROM Vocabulary INNER JOIN VocabularyKnowledge ON Vocabulary.Id = VocabularyKnowledge.VocabularyId WHERE (VocabularyKnowledge.StudentExamId = @StudentExamId) AND (VocabularyKnowledge.Answer &lt;&gt; 3) AND (VocabularyKnowledge.Answer &lt;&gt; 4)

))" onselecting="KnowledgeCheck2SqlDataSource_Selecting">
        <SelectParameters>
            <asp:Parameter Name="StudentExamId" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
