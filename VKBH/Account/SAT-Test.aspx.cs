using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VKBH.code;
using System.Data;

namespace VKBH.Account
{
    public partial class SAT_Test : System.Web.UI.Page
    {
        int ExamId;
        int StudentExamId = 1;
        int VocabularyId;
        int Answer;
        int ReadingTextId;
        int QuestionId;
        int QuestionOrder;
        DataView StudentExamReading;
        string StudentAnswer;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataView dv = (DataView)Exam_SqlDataSource.Select(DataSourceSelectArguments.Empty);
                if (dv != null)
                    if (dv.Table.Rows.Count > 0)
                    {
                        ExamId = Int32.Parse(dv.Table.Rows[0]["Id"].ToString());
                        ExamTitle.InnerText = dv.Table.Rows[0]["Title"].ToString();
                    }
                    else
                        Response.Redirect("~/Error.aspx");
                else
                    Response.Redirect("~/Error.aspx");

                SetVisiblePanel(TestPanels.Part1Panel);
                ActivateWizardStep(1);
                
            }
        }

        private void SetVisiblePanel(TestPanels panel)
        {
            foreach (string pname in Enum.GetNames(typeof(TestPanels)))
            {
                if (pname == panel.ToString())
                {
                    (Master.FindControl("MainContent").FindControl(pname) as Panel).Visible = true;
                    //(Master.FindControl("MainContent").FindControl(pname + "link") as System.Web.UI.HtmlControls.HtmlGenericControl).Attributes["class"] = "active";
                }
                else
                {
                    (Master.FindControl("MainContent").FindControl(pname) as Panel).Visible = false;
                    //(Master.FindControl("MainContent").FindControl(pname + "link") as System.Web.UI.HtmlControls.HtmlGenericControl).Attributes["class"] = "";
                }
            }
        }

        public void ActivateWizardStep(int stepno)
        {
            for (int i = 1; i < 6; i++)
            {
                if (i == stepno)
                    (Master.FindControl("MainContent").FindControl("WizardStep" + i) as System.Web.UI.HtmlControls.HtmlAnchor).Attributes["class"] = "current";
                else
                    (Master.FindControl("MainContent").FindControl("WizardStep" + i) as System.Web.UI.HtmlControls.HtmlAnchor).Attributes["class"] = "";
            }
        }

        protected void GoToPart2Button_Click(object sender, EventArgs e)
        {
            VocabularyKnowledgeSqlDataSource.Delete();
            foreach (RepeaterItem item in Part1Repeater.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    VocabularyId = Int32.Parse((item.FindControl("HiddenField1") as HiddenField).Value);
                    Answer = Int32.Parse((item.FindControl("DropDownList1") as DropDownList).SelectedValue);

                    VocabularyKnowledgeSqlDataSource.Insert();
                }
            }
            SetVisiblePanel(TestPanels.Part2Panel);
            ActivateWizardStep(2);
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RadioButtonList rblChoices = e.Item.FindControl("RadioButtonList1") as RadioButtonList;
                DataRowView data = (DataRowView)e.Item.DataItem;
                string ques1 = "I am not familiar with the word/term <span style='font-weight:bold;text-decoration:underline'>" + data.Row["Word"].ToString() + "</span>";
                string ques2 = "I have no idea what <span style='font-weight:bold;text-decoration:underline'>" + data.Row["Word"].ToString() + "</span> means";
                rblChoices.Items.Add(new ListItem(ques1, "1"));
                rblChoices.Items.Add(new ListItem(ques2, "2"));
            }
        }

        protected void VocabularyKnowledgeSqlDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@StudentExamId"].Value = StudentExamId;
            e.Command.Parameters["@VocabularyId"].Value = VocabularyId;
            e.Command.Parameters["@Answer"].Value = Answer;
        }

        protected void KnowledgeCheckScore1SqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@StudentExamId"].Value = StudentExamId;
        }

        protected void ReadingTextPartsSqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@ReadingTextId"].Value = ReadingTextId;
        }

        protected void StudentReadingAnswerSqlDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@StudentExamId"].Value = StudentExamId;
            e.Command.Parameters["@QuestionId"].Value = QuestionId;
            e.Command.Parameters["@QuestionOrder"].Value = QuestionOrder;
        }

        protected void StudentReadingAnswerSqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@StudentExamId"].Value = StudentExamId;
        }

        protected void ButtonsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btn = e.Item.FindControl("Button1") as Button;
                DataRowView data = (DataRowView)e.Item.DataItem;
                if (data.Row["StudentAnswer"] == DBNull.Value)
                    btn.CssClass = "btn btn-danger";
                else
                    btn.CssClass = "btn btn-info";
            }
        }

        protected void ShowQuestion(object sender, CommandEventArgs e)
        {
            int questionNo = Int32.Parse(e.CommandName);
            questionNo--;
            StudentExamReading = (DataView)StudentReadingAnswerSqlDataSource.Select(DataSourceSelectArguments.Empty);


            if (StudentExamReading == null)
            {
                DataView dv = (DataView)ExamQuestionsSqlDataSource.Select(DataSourceSelectArguments.Empty);
                foreach (DataRow row in dv.Table.Rows)
                {
                    QuestionOrder = Int32.Parse(row["RowNumber"].ToString());
                    QuestionId = Int32.Parse(row["Id"].ToString());
                    StudentReadingAnswerSqlDataSource.Insert();
                }
                StudentExamReading = (DataView)StudentReadingAnswerSqlDataSource.Select(DataSourceSelectArguments.Empty);
            }

            ButtonsRepeater.DataSource = StudentExamReading;
            ButtonsRepeater.DataBind();
            QuestionsRepeater.DataSource = StudentExamReading;
            QuestionsRepeater.DataBind();
            for (int i = 0; i < QuestionsRepeater.Items.Count; i++)
            {
                if(i==questionNo)
                    QuestionsRepeater.Items[i].Visible = true;
                else
                    QuestionsRepeater.Items[i].Visible = false;
            }
        }
        protected void ShowQuestion(int questionNo)
        {
            questionNo--;
            StudentExamReading = (DataView)StudentReadingAnswerSqlDataSource.Select(DataSourceSelectArguments.Empty);


            if (StudentExamReading == null)
            {
                DataView dv = (DataView)ExamQuestionsSqlDataSource.Select(DataSourceSelectArguments.Empty);
                foreach (DataRow row in dv.Table.Rows)
                {
                    QuestionOrder = Int32.Parse(row["RowNumber"].ToString());
                    QuestionId = Int32.Parse(row["Id"].ToString());
                    StudentReadingAnswerSqlDataSource.Insert();
                }
                StudentExamReading = (DataView)StudentReadingAnswerSqlDataSource.Select(DataSourceSelectArguments.Empty);
            }

            ButtonsRepeater.DataSource = StudentExamReading;
            ButtonsRepeater.DataBind();
            QuestionsRepeater.DataSource = StudentExamReading;
            QuestionsRepeater.DataBind();
            for (int i = 0; i < QuestionsRepeater.Items.Count; i++)
            {
                if (i == questionNo)
                    QuestionsRepeater.Items[i].Visible = true;
                else
                    QuestionsRepeater.Items[i].Visible = false;
            }
        }

        protected void QuestionsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RadioButtonList rblChoices = e.Item.FindControl("RadioButtonList1") as RadioButtonList;
                DataRowView data = (DataRowView)e.Item.DataItem;
                string optionA = data.Row["OptionA"].ToString();
                string optionB = data.Row["OptionB"].ToString();
                string optionC = data.Row["OptionC"].ToString();
                string optionD = data.Row["OptionD"].ToString();
                string studentAnswer = data.Row["StudentAnswer"].ToString();
                
                    rblChoices.Items.Add(new ListItem(optionA, "a"));
                    rblChoices.Items.Add(new ListItem(optionB, "b"));
                    rblChoices.Items.Add(new ListItem(optionC, "c"));
                    if (optionD != "")
                        rblChoices.Items.Add(new ListItem(optionD, "d"));
                    rblChoices.SelectedIndex = -1;
                    if (studentAnswer != "")
                    {
                        switch (studentAnswer)
                        {
                            case "a":
                                rblChoices.SelectedIndex = 0;
                                break;
                            case "b":
                                rblChoices.SelectedIndex = 1;
                                break;
                            case "c":
                                rblChoices.SelectedIndex = 2;
                                break;
                            case "d":
                                rblChoices.SelectedIndex = 3;
                                break;
                            default:
                                break;
                        }
                    }
                
                
            }
        }

        protected void QuestionsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "validateAnswer")
            {
                RadioButtonList rblChoices = e.Item.FindControl("RadioButtonList1") as RadioButtonList;
                //DataRowView data = (DataRowView)e.Item.DataItem;
                Label ResultLabel = e.Item.FindControl("ResultLabel") as Label;
                QuestionId = Int32.Parse((e.Item.FindControl("HiddenQuestionID") as HiddenField).Value);
                QuestionOrder = Int32.Parse((e.Item.FindControl("HiddenQuestionOrder") as HiddenField).Value);
                StudentAnswer = rblChoices.SelectedItem.Value;
                StudentReadingAnswerSqlDataSource.Update();
                //QuestionId = Int32.Parse(data.Row["OptionA"].ToString());
                //QuestionOrder = Int32.Parse(data.Row["OptionA"].ToString());
                //Answer
                //QuestionsRepeater.DataSource = (DataView)StudentReadingAnswerSqlDataSource.Select(DataSourceSelectArguments.Empty);
                //QuestionsRepeater.DataBind();
                ShowQuestion(e.Item.ItemIndex+1);
            }
        }

        protected void StudentReadingAnswerSqlDataSource_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@StudentExamId"].Value = StudentExamId;
            e.Command.Parameters["@QuestionId"].Value = QuestionId;
            e.Command.Parameters["@QuestionOrder"].Value = QuestionOrder;
            e.Command.Parameters["@StudentAnswer"].Value = StudentAnswer;
        }

        protected void GoToPart3Button_Click(object sender, EventArgs e)
        {
            DataView dv = (DataView)ReadingTextSqlDataSource.Select(DataSourceSelectArguments.Empty);

            ReadingTextTitle.Text = dv.Table.Rows[0]["Title"].ToString();
            ReadingTextId = Int32.Parse(dv.Table.Rows[0]["Id"].ToString());

            StudentReadingAnswerSqlDataSource.Delete();

            StudentExamReading = (DataView)StudentReadingAnswerSqlDataSource.Select(DataSourceSelectArguments.Empty);


            if (StudentExamReading.Table.Rows.Count == 0)
            {
                dv = (DataView)ExamQuestionsSqlDataSource.Select(DataSourceSelectArguments.Empty);
                foreach (DataRow row in dv.Table.Rows)
                {
                    QuestionOrder = Int32.Parse(row["RowNumber"].ToString());
                    QuestionId = Int32.Parse(row["Id"].ToString());
                    StudentReadingAnswerSqlDataSource.Insert();
                }
                StudentExamReading = (DataView)StudentReadingAnswerSqlDataSource.Select(DataSourceSelectArguments.Empty);
            }

            ButtonsRepeater.DataSource = StudentExamReading;
            ButtonsRepeater.DataBind();
            QuestionsRepeater.DataSource = StudentExamReading;
            QuestionsRepeater.DataBind();
            ShowQuestion(1);
            ActivateWizardStep(3);
            SetVisiblePanel(TestPanels.Part3Panel);     
        }

        protected void GoToPart5Button_Click(object sender, EventArgs e)
        {
            VocabularyKnowledge2SqlDataSource.Delete();
            foreach (RepeaterItem item in Part4Repeater.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    VocabularyId = Int32.Parse((item.FindControl("HiddenField1") as HiddenField).Value);
                    Answer = Int32.Parse((item.FindControl("DropDownList1") as DropDownList).SelectedValue);

                    VocabularyKnowledge2SqlDataSource.Insert();
                }
            }
            SetVisiblePanel(TestPanels.Part5Panel);
            ActivateWizardStep(5);
        }

        protected void VocabularyKnowledge2SqlDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@StudentExamId"].Value = StudentExamId;
            e.Command.Parameters["@VocabularyId"].Value = VocabularyId;
            e.Command.Parameters["@Answer"].Value = Answer;
        }

        protected void GoToPart4Button_Click(object sender, EventArgs e)
        {
            SetVisiblePanel(TestPanels.Part4Panel);
            ActivateWizardStep(4);
        }

        protected void FinishButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentPanel.aspx");
        }

        protected void KnowledgeCheck2SqlDataSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@StudentExamId"].Value = StudentExamId;
        }

        protected void StudentReadingAnswerSqlDataSource_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@StudentExamId"].Value = StudentExamId;
        }
    }
}