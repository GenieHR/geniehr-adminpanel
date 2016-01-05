<%@ Page Title="" Language="C#" MasterPageFile="~/Org/OrgManager.Master" AutoEventWireup="true" CodeBehind="ManageJD.aspx.cs" Inherits="adminpanel.Org.ManageJD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInUp">

                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Active JDs</h5>
                            <div class="ibox-tools">
                                <a href="JobDescription.aspx" class="btn btn-primary btn-xs">Create new JD</a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <%--<div class="row m-b-sm m-t-sm">
                                <div class="col-md-1">
                                    <button type="button" id="loading-example-btn" class="btn btn-white btn-sm" ><i class="fa fa-refresh"></i> Refresh</button>
                                </div>
                                <div class="col-md-11">
                                    <div class="input-group"><input type="text" placeholder="Search" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> Go!</button> </span></div>
                                </div>
                            </div>--%>

                            <div class="project-list">

                                <table class="table table-hover">
                                    <tbody>
                                    <tr>
                                        <td class="project-title">
                                            <strong>UniInfo Solutions</strong>
                                        </td>

                                        <td class="project-title">
                                            <a href="project_detail.html">SQL Automation Engineer</a>
                                        </td>

                                        <td class="project-title">
                                            <strong>Mohali</strong>
                                        </td>

                                        <td class="project-completion">
                                                <button type="button" class="btn btn-info btn-xs m-r-sm">1 In Process</button>
                                                <button type="button" class="btn btn-primary btn-xs m-r-sm">12 Shortlisted</button>
                                                <button type="button" class="btn btn-danger btn-xs m-r-sm">6 Open</button>
                                        </td>

                                        
                                        <td class="project-actions">
                                            <a href="#" class="btn btn-white btn-sm"><i class="fa fa-user"></i>  Assign </a>
                                            <a href="#" class="btn btn-white btn-sm"><i class="fa fa-binoculars"></i>  Search </a>

                                        </td>
                                    </tr>
                                        <tr>
                                        <td class="project-title">
                                            <strong>UniInfo Solutions</strong>
                                        </td>

                                        <td class="project-title">
                                            <a href="project_detail.html">SQL Automation Engineer</a>
                                        </td>

                                        <td class="project-title">
                                            <strong>Mohali</strong>
                                        </td>

                                        <td class="project-completion">
                                                <button type="button" class="btn btn-info btn-xs m-r-sm">1 In Process</button>
                                                <button type="button" class="btn btn-primary btn-xs m-r-sm">12 Shortlisted</button>
                                                <button type="button" class="btn btn-danger btn-xs m-r-sm">6 Open</button>
                                        </td>

                                        
                                        <td class="project-actions">
                                            <a href="#" class="btn btn-white btn-sm"><i class="fa fa-user"></i>  Assign </a>
                                            <a href="#" class="btn btn-white btn-sm"><i class="fa fa-binoculars"></i>  Search </a>

                                        </td>
                                    </tr>
                                        <tr>
                                        <td class="project-title">
                                            <strong>UniInfo Solutions</strong>
                                        </td>

                                        <td class="project-title">
                                            <a href="project_detail.html">SQL Automation Engineer</a>
                                        </td>

                                        <td class="project-title">
                                            <strong>Mohali</strong>
                                        </td>

                                        <td class="project-completion">
                                                <button type="button" class="btn btn-info btn-xs m-r-sm">1 In Process</button>
                                                <button type="button" class="btn btn-primary btn-xs m-r-sm">12 Shortlisted</button>
                                                <button type="button" class="btn btn-danger btn-xs m-r-sm">6 Open</button>
                                        </td>

                                        
                                        <td class="project-actions">
                                            <a href="#" class="btn btn-white btn-sm"><i class="fa fa-user"></i>  Assign </a>
                                            <a href="#" class="btn btn-white btn-sm"><i class="fa fa-binoculars"></i>  Search </a>

                                        </td>
                                    </tr>
                                   
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">
</asp:Content>
