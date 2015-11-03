<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Title="Employee Home" MasterPageFile="~/Employees/EmployeeTemplate.Master" Inherits="adminpanel.Employees.home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

         <div class="row  border-bottom white-bg dashboard-header">
             
                    <div class="row">
                        <h2>Welcome <%= Session["loggedinuserName"] %></h2>
                        <small> <a href="profile.aspx">View Profile</a></small>
                    </div>
             <div class="row col-sm-4">
             <%--<ul class="list-group clear-list m-t">
                            <li class="list-group-item fist-item">
                                <span class="pull-right">
                                    09:00 pm
                                </span>
                                <span class="label label-success">1</span> Please contact me
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    10:16 am
                                </span>
                                <span class="label label-info">2</span> Sign a contract
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    08:22 pm
                                </span>
                                <span class="label label-primary">3</span> Open new shop
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    11:06 pm
                                </span>
                                <span class="label label-default">4</span> Call back to Sylvia
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    12:00 am
                                </span>
                                <span class="label label-primary">5</span> Write a letter to Sandra
                            </li>
                        </ul>           --%>  </div>
            </div>


</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="javascriptPart" runat="server">


</asp:Content>