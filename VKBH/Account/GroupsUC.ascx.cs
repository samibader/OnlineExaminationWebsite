using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VKBH.Account
{
    public partial class GroupsUC : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void gp_AddGroupBTN_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(3000);
            GroupsDS.Insert();
            GroupsGridView.DataBind();
        }

        protected void GroupsDS_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Id"].Value = Guid.NewGuid();
            e.Command.Parameters["@TypeId"].Value = Guid.Parse(gp_GroupTypesDDL.SelectedValue);
            e.Command.Parameters["@Name"].Value = gp_GroupNameTB.Text;
            e.Command.Parameters["@Description"].Value = gp_GroupDescriptionTB.Text;
        }

        protected void GroupsGridView_DataBound(object sender, EventArgs e)
        {
            if (GroupsGridView.Rows.Count > 0)
                GroupsGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void GroupsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.NewValues["TypeId"] = (GroupsGridView.Rows[e.RowIndex].Cells[1].FindControl("ddl1") as DropDownList).SelectedValue;
        }

        protected void GroupsGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddl1 = e.Row.Cells[1].FindControl("ddl1") as DropDownList;
                    Label label1 = e.Row.Cells[1].FindControl("Label1") as Label;
                    ddl1.SelectedIndex = ddl1.Items.IndexOf(ddl1.Items.FindByValue(label1.Text));
                }
            }
        }

    }
}