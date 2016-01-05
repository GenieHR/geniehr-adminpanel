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
                    <h4 class="modal-title">Assign JD to Employee</h4>
                    <small class="font-bold">Use the screen to assign a <strong class="jdTitle"></strong> to employee</small>
                </div>
                <div class="modal-body ">


                    <div class="row">
                      
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Employee</label>
                            <div class="col-lg-8">
                                <select class="form-control" id="employeeSelect">
                                        <option selected="selected" value="0">Loading...</option>
                                    </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">No. of Openings</label>
                            <div class="col-lg-8">
                                <input type="number" class="form-control"  id="Openings"/>
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



    var TRHtml = '<tr><td class="project-title"><strong class="JobShortName"></strong></td><td class="project-title"><a href="showJD.aspx" class="JobTitle"></a><br /><span class="ClientName"></span></td><td class="project-title"><strong class="JobLocation"></strong></td><td class="project-people text-right"></td><td class="project-actions"><a href="#" class="btn btn-white btn-sm assingButton"><i class="fa fa-user"></i> Assign </a><a href="#" class="btn btn-white btn-sm"><i class="fa fa-binoculars"></i>  Search </a></td></tr>';
    
    var jdData;

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

            JobShortName.each(function (i) {
                $(JobShortName[i]).html(jdData[i].JobShortName);
                $(JobTitle[i]).html(jdData[i].JobTitle);
                $(ClientName[i]).html(jdData[i].ClientName);
                $(JobLocation[i]).html(jdData[i].JobLocation);
                $(assingButton[i]).on("click", function () { alertfn(jdData[i].JobTitle) });
            });

            $('.project-people').each(function (i) { $(this).append('<a title="' + i + '"><img alt="image" class="img-circle" src="../img/pp/6.JPG"></a><a href=""><img alt="image" class="img-circle" src="../img/pp/7.JPG"></a><a href=""><img alt="image" class="img-circle" src="../img/pp/5.JPG"></a>'); })

            $('.sk-spinner-three-bounce').hide();
            $('.project-table').show("slow");
        },
        error: function (e) {
            console.log(e.message);
        }
    });

    function alertfn(abc) {

        $('#assignJDModal').modal('toggle');
    }
   
</script>
</asp:Content>
