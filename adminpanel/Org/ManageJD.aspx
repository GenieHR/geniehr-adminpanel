<%@ Page Title="" Language="C#" MasterPageFile="~/Org/OrgManager.Master" AutoEventWireup="true" CodeBehind="ManageJD.aspx.cs" Inherits="adminpanel.Org.ManageJD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


    <div class="modal inmodal fade" id="assignJDModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <form method="post" class="form-horizontal" id="assignJDForm" >

            <div class="modal-content">
                
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Assign Employee to JD</h4>
                    <span class="font-bold">Use the screen to assign job to employee</span>
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
                            <label class="col-lg-3 control-label">Employee</label>
                            <div class="col-lg-8">
                                <select class="form-control" id="employeeSelect" required="required">
                                        <option selected="selected" value="0">Loading...</option>
                                 </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">No. of Openings</label>
                            <div class="col-lg-8">
                                <input type="number" class="form-control" id="Openings"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Expiry</label>
                            <div class="col-lg-8">
                                <input type="date" class="form-control"  id="Expiry"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Remarks</label>
                            <div class="col-lg-8">
                                <textarea class="form-control" rows="8" id="Remarks"></textarea>    
                            </div>
                            
                        </div>
<br />
           <div class="text-center"> <strong class="text-primary successText"></strong></div>

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
                    <h1>Manage Jobs</h1>
                </div>
                
            </div>
    

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



    var TRHtml = '<tr><td class="project-title"><strong class="JobShortName"></strong></td><td class="project-title"><a href="showJD.aspx" class="JobTitle"></a><br /><span class="ClientName"></span></td><td class="project-title"><strong class="JobLocation"></strong></td><td class="project-people text-right"></td><td class="project-actions"><a href="#" data-toggle="modal" data-target="#assignJDModal" class="btn btn-white btn-sm assingButton"><i class="fa fa-user"></i> Assign </a><a href="#" class="btn btn-white btn-sm searchButton"><i class="fa fa-binoculars"></i>Search </a></td></tr>';
    var gEmpId = <%= Session["EmpId"] %>;
    
    var jdData, gJDId, gIndex;

    $.ajax({
        url: '../getJD/',
        type: 'GET',
        success: function (data) {
            jdData = data;

            $(data).each(function () {
                $('.project-table tbody').append(TRHtml);
            });
            
            var JobShortName = $(".JobShortName");
            var JobTitle = $(".JobTitle");
            var ClientName = $(".ClientName");
            var JobLocation = $(".JobLocation");
            var assingButton = $(".assingButton");
            var projectpeople = $('.project-people');
            var searchButton = $('.searchButton');

            $(jdData).each(function (i) {
                $(JobShortName[i]).html(jdData[i].JobShortName);
                $(JobTitle[i]).html(jdData[i].JobTitle);
                $(ClientName[i]).html(jdData[i].ClientName);
                $(JobLocation[i]).html(jdData[i].JobLocation);
                $(assingButton[i]).on("click", function () { openAssignModal(jdData[i].Id, jdData[i].JobTitle, i) });
                $(searchButton[i]).on("click", function() { openEmpMan(jdData[i].Id, jdData[i].JobTitle, jdData[i].ClientName);    });


                $(jdData[i].empIdJobId).each(function(p) {$(projectpeople[i]).append('<a title="' + jdData[i].empIdJobId[p].EmpName + '"><img alt="image" class="img-circle" src="../img/pp/' + jdData[i].empIdJobId[p].EmpId + '.JPG"></a>')});
            });

            $('.sk-spinner-three-bounce').hide();
            $('.project-table').show("slow");
        },
        error: function (e) {
            console.log(e.message);
        }
    });

    function openAssignModal(jobId, jobTitle, index) {

        gJDId = jobId;
        gIndex = index;
        setEmpAssignFields(jobTitle);
    }

    function openEmpMan(jobId, jobTitle, clientName) {

        localStorage.setItem('org_jdId', jobId);
        localStorage.setItem('org_jdTitle', jobTitle);
        localStorage.setItem('org_clientName', clientName);

        window.location = "shortlist.aspx";
    }


    function setEmpAssignFields(jobTitle) {
        var empsURL = '../getEmpNotInJD/' + gJDId;

        $(".jobTitleModal").val(jobTitle);

        $('#employeeSelect').find('option:gt(0)').remove();
        $("#employeeSelect").val('0');
        $('#employeeSelect option[value="0"]').text('Select Employee');

        $.getJSON(empsURL, function (items) {
            $.each(items, function (i, item) {
                $('#employeeSelect').append($('<option>', {
                    value: item.EmpId,
                    text: item.EmpName
                }));
            });
        });
    }

    $("#assignJDForm").submit(function (event) {
        event.preventDefault();

        if ($('#employeeSelect').val() == 0) { alert('Select an employee'); return false; }

        var empJdJSON = {
            EmpId:     $('#employeeSelect').val(),
            JDId:      gJDId,
            Openings:  $("#Openings").val(),
            Expiry:    $("#Expiry").val(),
            Remarks:   $("#Remarks").val(),
            CreatedBy: gEmpId
        }
        $.ajax({
            url: '../api/EmpJDs',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var EmpName = $('#employeeSelect option[value=' + data.EmpId + ']').text();
                $(".successText").html(EmpName + ' added succesfully. You can add more employees or click close to exit');
                var projectpeople = $('.project-people');
                $(projectpeople[gIndex]).append('<a title="' + EmpName + '"><img alt="image" class="img-circle" src="../img/pp/' + data.EmpId + '.JPG"></a>');
                var jobt = $(".jobTitleModal").val();
                $("#assignJDForm")[0].reset();
                setEmpAssignFields(jobt);
            },
            data: empJdJSON
        });
    });

</script>
</asp:Content>
