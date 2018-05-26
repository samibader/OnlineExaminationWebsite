<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentsUC.ascx.cs" Inherits="VKBH.Account.StudentsUC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:SqlDataSource ID="GroupsDS" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
    SelectCommand="SELECT [Group].Name +' ('+GroupType.Type+')' as groupname , [Group].Id, [Group].Description  FROM [Group] INNER JOIN GroupType ON [Group].TypeId = GroupType.Id"></asp:SqlDataSource>
<asp:SqlDataSource ID="StudentsDS" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
    DeleteCommand="DELETE FROM [Student] WHERE [Id] = @Id" 
    InsertCommand="INSERT INTO [Student] ([Id], [FirstName], [LastName], [GroupId]) VALUES (@Id, @FirstName, @LastName, @GroupId)" 
    SelectCommand="SELECT * FROM [Student]" 
    
    UpdateCommand="UPDATE [Student] SET [FirstName] = @FirstName, [LastName] = @LastName, [GroupId] = @GroupId WHERE [Id] = @Id" 
    oninserting="StudentsDS_Inserting" oninserted="StudentsDS_Inserted">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Object" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Id" DbType="Guid" />
        <asp:Parameter Name="FirstName" DbType="String" />
        <asp:Parameter Name="LastName" DbType="String" />
        <asp:Parameter Name="GroupId" DbType="Guid" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="FirstName" Type="String" />
        <asp:Parameter Name="LastName" Type="String" />
        <asp:Parameter Name="GroupId" Type="Object" />
        <asp:Parameter Name="Id" Type="Object" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:Panel ID="StudentsPanel" runat="server" Visible="true">
                    <section>
                        <div class="page-header">
                            <h1>
                                Students</h1>
                        </div>
                        <asp:UpdateProgress ID="GroupsUpdateProgress" runat="server" DynamicLayout="true">
                            <ProgressTemplate>
                                <img src="../assets/img/ajax-loader.gif" /> saving ...</ProgressTemplate>
                        </asp:UpdateProgress>
                        <asp:UpdatePanel ID="GroupsUpdatePanel" runat="server">
                <ContentTemplate>
                    <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0"><asp:TabPanel ID="TabPanel1" runat="server" HeaderText="View Students">
                            <ContentTemplate>
                             <asp:GridView ID="StudentsGridView" DataSourceID="StudentsDS" runat="server" 
                        AllowPaging="True" AllowSorting="True" CssClass="table table-hover table-bordered table-striped" GridLines="None" DataKeyNames="Id"
                        ondatabound="StudentsGridView_DataBound" >
                        <EmptyDataTemplate>
                            There are no Students ..
                        </EmptyDataTemplate>
                    </asp:GridView>
                            </ContentTemplate>
                        </asp:TabPanel><asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Add Student">
                            <ContentTemplate>
                             <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">
                                    First Name :</label>
                                <div class="controls">
                                    <asp:TextBox ID="st_FirstNameTB" runat="server" placeholder="Enter student first name" ValidationGroup="st" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Student First Name Required !" ValidationGroup="st"
                                        ControlToValidate="st_FirstNameTB" CssClass="help-inline" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    Last Name :</label>
                                <div class="controls">
                                    <asp:TextBox ID="st_LastNameTB" runat="server" placeholder="Enter student last name" ValidationGroup="st" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Student Last Name Required !" ValidationGroup="st"
                                        ControlToValidate="st_LastNameTB" CssClass="help-inline" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    Group :</label>
                                <div class="controls">
                                    <asp:DropDownList ID="st_GroupDDL" runat="server" AppendDataBoundItems="true" DataSourceID="GroupsDS" DataTextField="groupname" DataValueField="Id" ValidationGroup="st"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Group Required !" ValidationGroup="st"
                                        ControlToValidate="st_GroupDDL" CssClass="help-inline" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    Email :</label>
                                <div class="controls">
                                    <asp:TextBox ID="st_EmailTB" runat="server" placeholder="Enter student email" ValidationGroup="st" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Student Email Required !" ValidationGroup="st"
                                        ControlToValidate="st_EmailTB" CssClass="help-inline" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                            ID="RegularExpressionValidator1" runat="server" 
                                        ErrorMessage="Email is invalid !" ControlToValidate="st_EmailTB" 
                                        CssClass="help-inline" ForeColor="Red" Display="Dynamic" ValidationGroup="st" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    Username :</label>
                                <div class="controls">
                                    <asp:TextBox ID="st_UsernameTB" runat="server" placeholder="Enter username" ValidationGroup="st" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Student Username Required !" ValidationGroup="st"
                                        ControlToValidate="st_UsernameTB" CssClass="help-inline" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    Password :</label>
                                <div class="controls">
                                    <asp:TextBox ID="st_PasswordTB" runat="server" placeholder="Enter password" ValidationGroup="st" TextMode="Password"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password Required !" ValidationGroup="st"
                                        ControlToValidate="st_PasswordTB" CssClass="help-inline" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                   Confirm Password :</label>
                                <div class="controls">
                                    <asp:TextBox ID="st_ConfirmPasswordTB" runat="server" placeholder="Enter password confirmation" ValidationGroup="st" TextMode="Password" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password Confirmation Required !" ValidationGroup="st"
                                        ControlToValidate="st_ConfirmPasswordTB" CssClass="help-inline" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ErrorMessage="Password and Confirm must match !" ValidationGroup="st" 
                                        CssClass="help-inline" ForeColor="Red" ControlToCompare="st_PasswordTB" 
                                        ControlToValidate="st_ConfirmPasswordTB"></asp:CompareValidator>
                                        <br />
                                    <br />
                                    <asp:Button ID="AddStudentBTN" runat="server" Text="Add Student" 
                                        CssClass="btn btn-primary" ValidationGroup="st" onclick="AddStudentBTN_Click"></asp:Button>
                                        <br />
                                        <br />
                                </div>
                            </div>
                        </div>
                        <asp:Label ID="AddStudentResultLB" Text="" runat="server" />
                             </ContentTemplate>
                        </asp:TabPanel></asp:TabContainer>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                        <br />
                        <br />
                    </section>
                </asp:Panel>