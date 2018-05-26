using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VKBH.code;

namespace VKBH.Account
{
    public partial class Test : System.Web.UI.Page
    {
        public static Dictionary<string, int> words;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //SetVisiblePanel(TestPanels.Part3Panel);
                words = new Dictionary<string, int>();
                words.Add("assert", 0);
                words.Add("astonishing ", 0);
                words.Add("boost", 0);
                words.Add("cheerful", 0);
                words.Add("deed", 0);
                words.Add("devote", 0);
                words.Add("discipline", 0);
                words.Add("esteem", 0);
                words.Add("graft", 0);
                words.Add("inherit", 0);
                words.Add("instinctively", 0);
                words.Add("intervention", 0);
                words.Add("longing", 0);
                words.Add("manner", 0);
                words.Add("monk", 0);
                words.Add("mystery", 0);
                words.Add("obscure", 0);
                words.Add("pace", 0);
                words.Add("philosophy", 0);
                words.Add("restaurant", 0);
                words.Add("review", 0);
                words.Add("steak", 0);
                words.Add("therapy", 0);
                words.Add("thrill", 0);
                Label0.Text = words.ElementAt(0).Key;
                for (int i = 0; i <= 23; i++)
                {
                    (Part1Panel.FindControl("Label" + i.ToString()) as Label).Text = words.ElementAt(i).Key;;
                }
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

        protected void GoToPart2Button_Click(object sender, EventArgs e)
        {
            for (int i = 0; i <= 23; i++)
            {
                words[words.ElementAt(i).Key] = (Part1Panel.FindControl("DropDownList" + i.ToString()) as DropDownList).SelectedIndex;
            }
            //SetVisiblePanel(TestPanels.Part2Panel);
        }

        public Dictionary<string, int> GetWords()
        {
            return words;
        }

        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var wordlist = from w in words
                           where w.Value==1
                           select w;
            e.Result = wordlist;
        }

        protected void LinqDataSource2_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var wordlist = from w in words
                           where w.Value == 2
                           select w;
            e.Result = wordlist;
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RadioButtonList rblChoices = e.Item.FindControl("RadioButtonList1") as RadioButtonList;
                var data = (KeyValuePair<string,int>)e.Item.DataItem;
                string ques1 = "I am not familiar with the word/term <span style='font-weight:bold;text-decoration:underline'>"+data.Key+"</span>";
                string ques2 = "I have no idea what <span style='font-weight:bold;text-decoration:underline'>" + data.Key + "</span> means";
                rblChoices.Items.Add(new ListItem(ques1,"1"));
                rblChoices.Items.Add(new ListItem(ques2,"2"));
            }
        }

        
    }
}