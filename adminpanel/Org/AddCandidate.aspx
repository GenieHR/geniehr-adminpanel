<%@ Page Title="Add Candidate" Language="C#" MasterPageFile="~/Org/OrgTemplate1.Master" AutoEventWireup="true" CodeBehind="AddCandidate.aspx.cs" Inherits="adminpanel.Org.ATS.AddCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet" />

    <link href="../css/plugins/select2/select2.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <br />
    <div class="row">
        <%--<div class="col-sm-12">

        <div class="text-center">

            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-user"></i>&nbsp; Personal </button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-phone" ></i>&nbsp; Contact </button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-mortar-board"></i>&nbsp; Skills & Qualification</button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-building"></i>&nbsp; Employment</button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-pencil"></i>&nbsp; Remarks</button>

        </div>
    </div>--%>


        <div class="col-sm-12">
            <form method="post" id="candidateForm" class="form-horizontal">
                <div class="ibox">
                        <div class="ibox-title">
                            <h5>Add New Candidate</h5>
                        </div>
                        <div class="ibox-content">

                            <div class="hr-line-dashed"></div>
                            <h4 class="text-info">Candidate Skills</h4>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">Skills</label>
                                <div class="col-sm-5">
                                     <select class="form-control" id="skills" multiple="multiple" required="required">
                                         
                                    </select>
                                </div>

                                </div>
                           
                            <div class="hr-line-dashed"></div>
                            <h4 class="text-info">Candidate Details</h4>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">Candidate Name</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" required="required"  id="CandidateName" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Qualification</label>
                                <div class="col-lg-5">
                                    <select class="form-control" id="qQualification">
                                        <option selected="selected" value="0">Loading...</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Degree</label>
                                <div class="col-lg-5">
                                    <select class="form-control" id="qDegree">
                                        <option selected="selected" value="0">Select Qualification First</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">Native Place</label>
                                <div class="col-sm-5">
                                    <input type="text" required="required" class="form-control" id="NativePlace" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Contact No.</label>

                                   <div class="col-sm-5">
                                        <div class="input-group m-b">
                                            <span class="input-group-addon">+91</span>
                                            <input  type="tel" pattern="^\d{10}$" title="Enter a valid mobile number" class="form-control" id="PrimaryMobile"/>
                                        </div>
                                    </div>
                            </div>

                            <div class="form-group">


                             <label class="col-sm-2 control-label">Alternative No.</label>

                                    <div class="col-sm-5">
                                        <div class="input-group m-b">
                                            <span class="input-group-addon">+91</span>
                                            <input type="number" class="form-control" id="AlternateNumber"/>
                                        </div>
                                    </div>
                                    </div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">Email</label>


                                    <div class="col-sm-5">
                                            <input type="email" class="form-control" id="Email"/>
                                            
                                    </div>
                                    </div>
                             <div class="form-group">
                                <label class="col-sm-2 control-label">Total Experience</label>
                                <div class="row">
                                    <div class="col-sm-5">
                                        <div class="input-group m-b">
                                            <input type="number" min="0" class="form-control" value="0" id="TotalExpY"/>
                                            <span class="input-group-addon">Years</span>
                                            <input type="number" min="0" max="11" class="form-control" value="0"  id="TotalExpM"/>
                                            <span class="input-group-addon">Months</span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="hr-line-dashed"></div>
                            <h4 class="text-info">Current Details</h4>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Location</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="CurrentLocation" />
                                </div>

                            </div>

                           <div class="form-group">

                                <label class="col-sm-2 control-label">Company</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="CurrentCompany"  />
                                </div>
                            </div>

                            
                           <div class="form-group">

                                <label class="col-sm-2 control-label">Designation</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="Designation"  />
                                </div>
                            </div>

                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Experience</label>
                                <div class="row">

                                    <div class="col-sm-5">
                                        <div class="input-group m-b">
                                            <input type="number" min="0" class="form-control" id="CurrentExpY" value="0"/>
                                            <span class="input-group-addon">Years</span>
                                            <input type="number" min="0"  max="11" class="form-control" value="0"  id="CurrentExpM"/>
                                            <span class="input-group-addon">Months</span>

                                        </div>
                                    </div>
                                </div>

                            </div>
                            
                            <div class="form-group">

                                <label class="col-sm-2 control-label">Salary</label>
                                <div class="col-sm-5">
                                    <div class="input-group m-b">
                                            <span class="input-group-addon">INR</span>
                                            <input type="number"  class="form-control" id="CurrentSalary"/>
                                        </div>
                                </div>
                            </div>


                            <div class="hr-line-dashed"></div>
                                     <center><input type="submit" id="candidateSubmit" class="btn btn-primary" value="Save Details"/></center>
                            <div class="hr-line-dashed"></div>

                        </div>

                    </div>
    </form>

        </div>




</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">
    <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="../js/plugins/select2/select2.min.js"></script>
    <script>

        var gEmpId = <%= Session["EmpId"] %>;

        var skills;
        var output = [];

        $("#skills").select2();

        $.ajax({
            url: "../api/skills"
        }).done(function(skills) {
            $.each(skills, function(i)
            {
                output.push('<option value="'+ skills[i].id +'">'+ skills[i].skill +'</option>');
            });

            $('#skills').html(output.join(''));
        });
        
        
        $("#candidateForm").submit(function (event) {

            $("#candidateSubmit").prop("disabled", true);
            event.preventDefault();
        
            
            var candidateDetailJSON = {
                "CreatedBy": gEmpId,
                "CandidateName": $("#CandidateName").val(),
                "PrimaryMobile": $("#PrimaryMobile").val(),
                "AlternateNumber": $("#AlternateNumber").val(),
                "Email": $("#Email").val(),
                "CurrentCompany": $("#CurrentCompany").val(),
                "CurrentSalary": $("#CurrentSalary").val(),
                "CurrentExp": parseInt($("#CurrentExpY").val()) +  Math.round($("#CurrentExpM").val()/12),
                "CurrentLocation": $("#CurrentLocation").val(),
                "Designation": $("#Designation").val(),
                "TotalExp": parseInt($("#TotalExpY").val()) + Math.round($("#TotalExpM").val()/12),
                "NativePlace": $("#NativePlace").val(),
                "HighestQualification": $("#qQualification").val(),
                "Degree" : $("#qDegree").val(),
                "SkillList":JSON.stringify($("#skills").val())
            };

            $.ajax({
                type: "POST",
                url: "../putcandidate",
                data: candidateDetailJSON,
                success: function (result) {

                    $("#candidateSubmit").prop("disabled", false);

                    if (result > 0) {

                        sweetAlert("Data Saved!", "The candidate details succesfully added.", "success");
                        $('#candidateForm')[0].reset();
                    }
                    else {
                        sweetAlert("Error!", result, "error");
                    }
                },
                datatype: "json"
            });
        });

        var qualURL = '../getQual/';
        if ( $('#qQualification option').length == 1) {
            $.getJSON(qualURL, function (items) {
                $.each(items, function (i, item) {
                    $('#qQualification').append($('<option>', { 
                        value: item.QualId,
                        text : item.QualName 
                    }));
                });
                $('#qQualification option[value="0"]').text('Select Qualification');
            });
        }
        else
        {
            $("#qQualification").val('0');
        }

        $( "#qQualification" ).change(function() {
        
            if ($('#qQualification').val() != 0) {
                $('#qDegree option[value="0"]').text('Loading Degree...');

                var degreeURL = '../getDegreeByQual/' + $('#qQualification').val();
            
                $('#qDegree option').each(function() {
                    if ( $(this).val() != 0 ) {
                        $(this).remove();
                    }
                });

                if ( $('#qDegree option').length == 1) {
                    $.getJSON(degreeURL, function (items) {
                        $.each(items, function (i, item) {
                            $('#qDegree').append($('<option>', { 
                                value: item.DegreeId,
                                text : item.DegreeName 
                            }));
                        });
                        $('#qDegree option[value="0"]').text('Select Degree');
                    });
                }
                else
                {
                    $("#qDegree").val('0');
                }
            }
            else
            {
                $('#qDegree option').each(function() {
                    if ( $(this).val() != 0 ) {
                        $(this).remove();
                    }
                });

                $('#qDegree option[value="0"]').text('Select Qualification First');
            }

        });

    </script>

</asp:Content>
