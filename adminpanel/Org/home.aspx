<%@ Page Title="" Language="C#" MasterPageFile="~/Org/OrgTemplate1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="adminpanel.Org.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

<h2>Welcome <%= Session["loggedinuserName"] %></h2>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">

</asp:Content>
