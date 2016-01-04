<%@ Page Title="New JD" Language="C#" MasterPageFile="~/Org/OrgManager.Master"  AutoEventWireup="true" CodeBehind="JobDescription.aspx.cs" Inherits="adminpanel.Org.JobDescription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet" />

    <link href="../css/plugins/select2/select2.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h1>New Job Description</h1>
                </div>
                
            </div>

    <div class="col-sm-12">
            <form method="post" id="candidateForm" class="form-horizontal">
                <div class="ibox">
                        <div class="ibox-title">
                            <h5>New Job Description</h5>
                        </div>
                        <div class="ibox-content">

                            <div class="hr-line-dashed"></div>
                            <h4 class="text-info">Job Details</h4>
                            <div class="hr-line-dashed"></div>
                            
                            <div class="form-group">

                                <label class="col-sm-2 control-label">Job Title</label>
                                <div class="col-sm-5">
                                    <input type="text" required="required" class="form-control" id="JobTitle" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Short Name</label>
                                <div class="col-sm-5">
                                    <input type="text" required="required" class="form-control" id="ShortName" />
                                </div>
                            </div>
                            
                             <div class="form-group">
                                <label class="col-lg-2 control-label">Cleint</label>
                                <div class="col-lg-5">
                                    <select class="form-control" id="JobClient">
                                        <option selected="selected" value="0">Loading...</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">Job Location</label>
                                <div class="col-sm-5">
                                    <input type="text" required="required" class="form-control" id="JobLocation" />
                                </div>
                            </div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">No. of Openings</label>
                                <div class="col-sm-5">
                                    <input type="number" required="required" min="1" class="form-control" id="JobOpenings" />
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <h4 class="text-info">Job Requirements</h4>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">Skills</label>

                                <div class="col-sm-5">
                                     <select class="form-control" id="skills" multiple="multiple" required="required">
                                    </select>
                                </div>

                             </div>
                            <div class="form-group">

                                <label class="col-sm-2 control-label">Certifications</label>

                                <div class="col-sm-5">
                                     <select class="form-control" id="certification" multiple="multiple">
                                    </select>
                                </div>

                             </div>
                            
                            <div class="form-group">

                                <label class="col-sm-2 control-label">Qualification</label>

                                <div class="col-sm-5">
                                     <select class="form-control" id="degree" multiple="multiple">
                                    </select>
                                </div>

                             </div> 

                            <div class="form-group">
                                <label class="col-sm-2 control-label"> Experience (Yrs)</label>
                                <div class="row">
                                    <div class="col-sm-5">
                                           <div class="input-group m-b">
                                            <span class="input-group-addon">From</span>
                                            <input class="form-control" type="number" min="0"  id="ExpFrom" required="required"/>
                                            <span class="input-group-addon">To</span>
                                            <input class="form-control" type="number" min="0"  id="ExpTo" required="required"/>
                                            <span class="input-group-addon">Years</span>

                                        </div>
                                    </div>
                                </div>

                            </div>
                              <div class="form-group">
                                <label class="col-sm-2 control-label"> Relevent Exp (Yrs)</label>
                                <div class="row">
                                    <div class="col-sm-5">
                                           <div class="input-group m-b">
                                            <span class="input-group-addon">From</span>
                                            <input class="form-control" type="number" min="0"  id="RExpFrom" />
                                            <span class="input-group-addon">To</span>
                                            <input class="form-control" type="number" min="0"  id="RExpTo" />
                                            <span class="input-group-addon">Years</span>

                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="hr-line-dashed"></div>
                            <h4 class="text-info">Salary & Packages</h4>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">Salary</label>
                                 <div class="row">
                                    <div class="col-sm-5">
                                           <div class="input-group m-b">
                                            
                                            <input class="form-control" type="number" min="0" id="Salary" required="required"/>
                                            <span class="input-group-addon">per month</span>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">Benifits (<a href="#" id="AddBenefitLink" onclick="addRowToBenefitTable()" >Add</a>)</label>
                                    <div class="col-sm-5">
<table class="table table-bordered table-hover" id="benefitTable">
    <thead>
        <tr>
            <td><strong>Benefit</strong></td>
            <td><strong>Benefit Remarks</strong></td>
            <td  class="text-center"><strong><span class="fa fa-remove"></span></strong></td>

        </tr>
    </thead>
<tbody>
    
    
</tbody>
</table>
                                    </div>
                                </div>
                           </div>
                    </div>
                </form>



    </div>
    <button onclick="getAllBenefitVals()" >Click to set val</button>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">
     <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="../js/plugins/select2/select2.min.js"></script>

    <script>

        

        var gEmpId = <%= Session["EmpId"] %>;

        var skills;
        var benefitHTML    =  '<select class="benefitSelect"><option value="0">Select Benefit</option>';
        var benefitRemHTML = '<input class="benefitRemarks" />'

        var output = [];
        var certOutput = [];
        var degOutput = [];

        var qualURL = '../getorgclients/' + gEmpId;

        if ( $('#JobClient option').length == 1) {
            $.getJSON(qualURL, function (items) {
                $.each(items, function (i, item) {
                    $('#JobClient').append($('<option>', { 
                        value: item.ClientId,
                        text : item.ClientName 
                    }));
                });
                $('#JobClient option[value="0"]').text('Select Client');
            });
        }
        else
        {
            $("#JobClient").val('0');
        }

        
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


        $("#certification").select2();

        $.ajax({
            url: "../getCertifications"
        }).done(function(certification) {
            
            $.each(certification, function(i)
            {
                certOutput.push('<option value="'+ certification[i].Id +'">'+ certification[i].CertificationName +'</option>');
            });

            $('#certification').html(certOutput.join(''));
        });


        $("#degree").select2();

        $.ajax({
            url: "../getDegreeByQual/0" //0 to return all the degrees

        }).done(function(degree) {
            
            $.each(degree, function(i)
            {
                degOutput.push('<option value="'+ degree[i].DegreeId +'">'+ degree[i].DegreeName +'</option>');
            });

            $('#degree').html(degOutput.join(''));
        });

      $.ajax({
          url: "../getBenefits/" 

      }).done(function(benefit) {
            
          $.each(benefit, function(i)
          {
              benefitHTML += '<option value="'+ benefit[i].Id +'">'+ benefit[i].BenefitName +'</option>';
          });

          benefitHTML +=  '</select>';

          $("#benefitTable tbody").append('<tr><td>' + benefitHTML + '</td><td>' + benefitRemHTML + '</td><td class="text-center remove"><span class="fa fa-remove"></span></td></tr>');

          
          
      });

      function addRowToBenefitTable() {
          $("#benefitTable tbody").append('<tr><td>' + benefitHTML + '</td><td>' + benefitRemHTML + '</td><td class="text-center remove"><span class="fa fa-remove"></span></td></tr>');

      }


      $( document ).on( "click", ".remove", function(){  $(this).parent("tr:first").remove() });


      function getAllBenefitVals() {

          var allBenefitVal = [];
          var benefitId = [];
          var benefitRem = [];

          var allBenefitVal = [];

          $(".benefitSelect").each(function() {
              benefitId.push($(this).val());
          });

          $(".benefitRemarks").each(function() {
              benefitRem.push($(this).val());
          });

          $(benefitId).each(function(i) {
              allBenefitVal.push('{"benefitId":' + benefitId[i] + ',"benefitRem":' + '\"' + benefitRem[i] + '\"}');
              //allBenefitVal.push([benefitId[i],benefitRem[i]])
          })

          prompt("", JSON.stringify(allBenefitVal));

        }

        </script>

</asp:Content>
