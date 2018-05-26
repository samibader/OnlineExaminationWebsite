using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace VKBH.Account
{
    public partial class StudentsUC : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddStudentBTN_Click(object sender, EventArgs e)
        {
            MembershipCreateStatus createStatus;
            MembershipUser newUser = Membership.CreateUser(st_UsernameTB.Text, st_PasswordTB.Text, st_EmailTB.Text, "Default Question", "Default Answer", true, out createStatus);
            switch (createStatus)
            {
                case MembershipCreateStatus.Success:
                    AddStudentResultLB.Text = "<i class='icon-ok'></i>  The student account was successfully created!";
                    break;
                case MembershipCreateStatus.DuplicateUserName:
                    AddStudentResultLB.Text = "<i class='icon-remove'></i>  There already exists a student with this username.";
                    break;
                case MembershipCreateStatus.DuplicateEmail:
                    AddStudentResultLB.Text = "<i class='icon-remove'></i>  There already exists a student with this email address.";
                    break;
                case MembershipCreateStatus.InvalidEmail:
                    AddStudentResultLB.Text = "<i class='icon-remove'></i>  The email address you provided in invalid.";
                    break;
                case MembershipCreateStatus.InvalidAnswer:
                    AddStudentResultLB.Text = "<i class='icon-remove'></i>  The security answer was invalid.";
                    break;
                case MembershipCreateStatus.InvalidPassword:
                    AddStudentResultLB.Text = "<i class='icon-remove'></i>  The password you provided is invalid. It must be seven characters long and have at least one non-alphanumeric character.";
                    break;
                default:
                    AddStudentResultLB.Text = "<i class='icon-remove'></i>  There was an unknown error; the user account was NOT created.";
                    break;
            }
            if (createStatus == MembershipCreateStatus.Success)
            {
                StudentsDS.Insert();
                StudentsGridView.DataBind();
            }
        }

        protected void StudentsDS_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Id"].Value = Guid.Parse(Membership.GetUser(st_UsernameTB.Text).ProviderUserKey.ToString());
            e.Command.Parameters["@FirstName"].Value = st_FirstNameTB.Text;
            e.Command.Parameters["@LastName"].Value = st_LastNameTB.Text;
            e.Command.Parameters["@GroupId"].Value = Guid.Parse(st_GroupDDL.SelectedValue);
        }

        protected void StudentsGridView_DataBound(object sender, EventArgs e)
        {
            if (StudentsGridView.Rows.Count > 0)
                StudentsGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void StudentsDS_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            //AddStudentTab.Attributes["class"] = "tab-pane active";
            //AddStudentTabHeader.Attributes["class"] = "";
            //ViewStudentsTab.Attributes["class"] = "tab-pane";
            //ViewStudentsTabHeader.Attributes["class"] = "";
        }
    }
}