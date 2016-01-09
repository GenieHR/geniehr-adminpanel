<%@ Page Title="" Language="C#" MasterPageFile="~/Org/OrgTemplate1.Master" AutoEventWireup="true" CodeBehind="Shortlist.aspx.cs" Inherits="adminpanel.Org.Shortlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h1 class="pageTitle"></h1>
                    <h3 class="clientName"></h3>
                </div>
                
            </div>
    <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInUp">

                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Candidates matching skills</h5>
                            <%--<div class="ibox-tools">
                                <a href="JobDescription.aspx" class="btn btn-primary btn-xs">Create new JD</a>
                            </div>--%>
                        </div>
                        <div class="ibox-content">

                            <div class="sk-spinner sk-spinner-three-bounce">

                                    <div class="sk-bounce1"></div>
                                    <div class="sk-bounce2"></div>
                                    <div class="sk-bounce3"></div>

                                </div>

                            <div class="project-list">
                                <div class="tableclass">
                                <table class="table table-hover project-table" >
                                    <tbody>
                                    
                                    </tbody>
                                </table>
                                    </div>
                            </div>

                        </div>
                        </div>
                    </div>
                </div>
        </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">
    <script>

        $(document).ready(function () {
            $('.pageTitle').html(localStorage.getItem('org_jdTitle'));
            $('.clientName').html(localStorage.getItem('org_clientName'));


            
            $.ajax({
                url: '../getCandidatesByJobId/' + localStorage.getItem('org_jdId'),
                type: 'GET',
                success: function (data) {  }
            });
        });

    </script>

</asp:Content>
