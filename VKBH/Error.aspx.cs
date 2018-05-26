using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VKBH
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["ErrorId"]!=null)
                switch (Int32.Parse(Request.QueryString["ErrorId"]))
                {
                    case 1:
                        Lit1.Text = "You have already taken this exam !!";
                        break;
                    default:
                        break;
                }
        }
    }
}