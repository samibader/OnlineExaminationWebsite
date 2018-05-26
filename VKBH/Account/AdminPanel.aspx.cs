using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VKBH.code;
using System.Web.Security;

namespace VKBH.Account
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["p"] != null)
            {
                switch (Request.QueryString["p"].ToString())
                {
                    case "gtp":
                        SetVisiblePanel(AdminPanels.ucGroupTypesUC);
                        break;
                    case "gp":
                        SetVisiblePanel(AdminPanels.ucGroupsUC);
                        break;
                    case "st":
                        SetVisiblePanel(AdminPanels.ucStudentsUC);
                        break;
                    default:
                        break;
                }
            }
            else
                SetVisiblePanel(AdminPanels.ucGroupTypesUC);
        }
        private void SetVisiblePanel(AdminPanels panel)
        {
            foreach (string pname in Enum.GetNames(typeof(AdminPanels)))
            {
                if (pname == panel.ToString())
                {
                    (Master.FindControl("MainContent").FindControl(pname) as UserControl).Visible = true;
                    //(Master.FindControl("MainContent").FindControl(pname + "link") as System.Web.UI.HtmlControls.HtmlGenericControl).Attributes["class"] = "active";
                }
                else
                {
                    (Master.FindControl("MainContent").FindControl(pname) as UserControl).Visible = false;
                    //(Master.FindControl("MainContent").FindControl(pname + "link") as System.Web.UI.HtmlControls.HtmlGenericControl).Attributes["class"] = "";
                }
            }
        }

        
       
        
    }
}