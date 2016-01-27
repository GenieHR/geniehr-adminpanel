<%@ Page Title="" Language="C#" MasterPageFile="~/Org/OrgTemplate1.Master" AutoEventWireup="true" CodeBehind="Shortlist.aspx.cs" Inherits="adminpanel.Org.Shortlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


    <div class="modal inmodal fade" id="shortlistModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <form method="post" class="form-horizontal" id="shortlistForm" >

            <div class="modal-content">
                
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Shortlist Candidate</h4>
                    <%--<span class="font-bold">Use the screen to assign job to employee</span>--%>
                </div>
                <div class="modal-body ">

                    <div class="row">
                      
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Job Title</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control jobTitleModal" disabled="disabled"  />
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Remarks</label>
                            <div class="col-lg-8">
                                <textarea class="form-control" rows="8" id="Remarks"></textarea>    
                            </div>
                            
                        </div>

                    </div>
                
                </div>
                <div class="modal-footer">
                     <input type="submit" class="btn btn-success" value="Assign" />
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                </div>

            </div>

                         </form>
        </div>
    </div>



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
                            <%--
                            
                                <div class="ibox-tools">
                                    <a href="JobDescription.aspx" class="btn btn-primary btn-xs">Create new JD</a>
                                </div>

                             --%>
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
        var TRHtml = '<tr><td class="project-title"><strong class="jobTitle"></strong></td><td class="project-title"><a href="#" class="candidateName"></a><br /><span class="candidateMobile"></span>, <span class="candidateLocation"></span></td><td><span class="jobLocation"></span></td><td><span class="createdBy"></span></td><td><a class=" btn-white btn-sm shortlistButton" title="Shortlist"  data-toggle="modal" data-target="#shortlistModal"><i class="fa fa-check"></i></a>  <a class=" btn-white btn-sm"  title="Interview"><i class="fa fa-users"></i> </a>  <a class="btn btn-white btn-sm"  title="Disqualify"><i class="fa fa-remove"></i> </a>  <a class="btn btn-white btn-sm"  title="Remove"><i class="fa fa-trash"></i></a></td></tr>';
        var gJDId, gIndex;

        $(document).ready(function () {

            $('.pageTitle').html(localStorage.getItem('org_jdTitle'));
            $('.clientName').html(localStorage.getItem('org_clientName'));

            console.log(localStorage.getItem('org_jdId'));
            
            $.ajax({
                url: '../getCandidatesByJobId/' + localStorage.getItem('org_jdId'),
                type: 'GET',
                success: function (data) {

                    var candidateData = data;

                    $(data).each(function () {
                        $('.project-table tbody').append(TRHtml);
                    });

                    $(candidateData).each(function (i) {

                        var candidateName = $(".candidateName");
                        var jobTitle = $(".jobTitle");
                        var candidateMobile = $(".candidateMobile");
                        var createdBy = $(".createdBy");
                        var candidateLocation = $(".candidateLocation");
                        var jobLocation = $(".jobLocation");
                        var shortlistButton = $(".shortlistButton");

                        $(candidateName[i]).html(data[i].candidateName);
                        $(jobTitle[i]).html(data[i].jobTitle);
                        $(candidateMobile[i]).html(data[i].candidateMobile);
                        $(createdBy[i]).html(data[i].createdBy);
                        $(candidateLocation[i]).html(data[i].candidateLocation);
                        $(jobLocation[i]).html(data[i].jobLocation);

                        $(shortlistButton[i]).on("click", function () { openShortlistModal(data[i].Id, data[i].JobTitle, i) });

                    });

                        
                    $('.sk-spinner-three-bounce').hide();


                }
            });
        });


        function openShortlistModal(jobId, jobTitle, index) {
            gJDId = jobId;
            gIndex = index;
        }


    </script>

</asp:Content>
