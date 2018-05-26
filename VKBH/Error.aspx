<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="VKBH.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NavContent" runat="server">
<div class="text-center"><h1>OOPS ..</h1><h3>An Error Has Occured</h3></div> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div class="text-center text-error">
    <asp:Literal ID="Lit1" Text="You Are Not Allowed To View This Page !!!" runat="server" /> </div>
</asp:Content>
