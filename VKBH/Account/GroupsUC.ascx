<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GroupsUC.ascx.cs" Inherits="VKBH.Account.GroupsUC" %>
<asp:SqlDataSource ID="GroupTypesDS" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                        SelectCommand="SELECT * FROM [GroupType]" DeleteCommand="DELETE FROM [GroupType] WHERE [Id] = @Id"
                        InsertCommand="INSERT INTO [GroupType] ([Id], [Type], [Description]) VALUES (@Id, @Type, @Description)"
                        UpdateCommand="UPDATE [GroupType] SET [Type] = @Type, [Description] = @Description WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Object" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Id" Type="Object" />
                            <asp:Parameter Name="Type" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Type" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Id" Type="Object" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
<asp:SqlDataSource ID="GroupsDS" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                            DeleteCommand="DELETE FROM [Group] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Group] ([Id], [TypeId], [Name], [Description]) VALUES (@Id, @TypeId, @Name, @Description)"
                            OnInserting="GroupsDS_Inserting" 
                            SelectCommand="SELECT [Group].Id, [Group].TypeId, [Group].Name, [Group].Description, GroupType.Type FROM [Group] INNER JOIN GroupType ON [Group].TypeId = GroupType.Id" 
                            UpdateCommand="UPDATE [Group] SET [TypeId] = @TypeId, [Name] = @Name, [Description] = @Description WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" DbType="Guid" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter DbType="Guid" Name="Id" />
                                <asp:Parameter DbType="Guid" Name="TypeId" />
                                <asp:Parameter DbType="String" Name="Name" />
                                <asp:Parameter DbType="String" Name="Description" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="TypeId" DbType="Guid" />
                                <asp:Parameter Name="Name" DbType="String" />
                                <asp:Parameter Name="Description" DbType="String" />
                                <asp:Parameter Name="Id" DbType="Guid" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
<asp:Panel ID="GroupsPanel" runat="server" Visible="true">
                    
                    <section>
                        
                        <div class="page-header">
                            <h1>
                                Groups</h1>
                                
                        </div>
                         <asp:UpdateProgress ID="GroupsUpdateProgress" runat="server" DynamicLayout="true">
                            <ProgressTemplate>
                                <img src="../assets/img/ajax-loader.gif" /> saving ...</ProgressTemplate>
                        </asp:UpdateProgress>
                        <div class="tabbable">
              <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#lA">View Groups</a></li>
                <li class=""><a data-toggle="tab" href="#lB">Add Group</a></li>
              </ul>
              <div class="tab-content">
                <div id="lA" class="tab-pane active">
                  <asp:UpdatePanel ID="GroupsUpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:GridView runat="server" CssClass="table table-hover table-bordered table-striped"
                            ID="GroupsGridView" DataSourceID="GroupsDS" GridLines="None" AutoGenerateColumns="False"
                            OnDataBound="GroupsGridView_DataBound" DataKeyNames="Id" 
                            onrowupdating="GroupsGridView_RowUpdating" 
                                    onrowdatabound="GroupsGridView_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Group Name" />
                                <asp:TemplateField HeaderText="Group Type">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" Text='<%# Eval("Type") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" Text='<%# Eval("TypeId") %>' runat="server" Visible="false" />
                                        <asp:DropDownList ID="ddl1" runat="server" AppendDataBoundItems="true" DataSourceID="GroupTypesDS" DataTextField="Type" DataValueField="Id">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:BoundField DataField="Description" HeaderText="Description" />
                                <asp:CommandField ShowEditButton="True" EditText="&lt;i class='icon-pencil'&gt;&lt;/i&gt; Edit"
                                    CancelText="&lt;i class='icon-remove'&gt;&lt;/i&gt; Cancel" UpdateText="&lt;i class='icon-refresh'&gt;&lt;/i&gt; Update" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete" Text="&lt;i class='icon-trash'&gt;&lt;/i&gt; Delete"
                                            OnClientClick="return confirm('Are you sure you want to delete this group?');" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Id" Visible="false" />
                            </Columns>
                        </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="gp_AddGroupBTN" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                </div>
                <div id="lB" class="tab-pane">
                  <div class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">
                                    Group Name :</label>
                                <div class="controls">
                                    <asp:TextBox ID="gp_GroupNameTB" runat="server" placeholder="input group name" ValidationGroup="gp" />
                                    <asp:RequiredFieldValidator ID="gp_GroupNameRFV" runat="server" ErrorMessage="Group Name Required !" ValidationGroup="gp"
                                        ControlToValidate="gp_GroupNameTB" CssClass="help-inline" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    Group Type :</label>
                                <div class="controls">
                                    <asp:DropDownList ID="gp_GroupTypesDDL" AppendDataBoundItems="true" runat="server"
                                        DataSourceID="GroupTypesDS" DataTextField="Type" DataValueField="Id" ValidationGroup="gp">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">
                                    Description :</label>
                                <div class="controls">
                                    <asp:TextBox ID="gp_GroupDescriptionTB" runat="server" TextMode="MultiLine" ValidationGroup="gp"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Button ID="gp_AddGroupBTN" runat="server" Text="Add Group" CssClass="btn btn-primary" OnClick="gp_AddGroupBTN_Click" ValidationGroup="gp"></asp:Button>&nbsp;&nbsp;
                                    
                                        <br />
                                        <br />
                                            
                                </div>
                            </div>
                        </div>
                </div>
              </div>
            </div>
                     
                        <br />
                        <br />
                    </section>
                </asp:Panel>
<asp:Panel ID="AddGroupPanel" runat="server" Visible="false">
</asp:Panel>
