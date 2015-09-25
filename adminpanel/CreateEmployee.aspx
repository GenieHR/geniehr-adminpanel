<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateEmployee.aspx.cs" Inherits="Admin.CreateEmployee" MasterPageFile="~/UbietyMenu.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" Runat="Server">

    <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h1>Create Employee</h1>
                    
                </div>
                
            </div>

<div class="wrapper wrapper-content">
                <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="ibox float-e-margins">
                       
                        <div class="ibox-content">
                            <form method="post" id="formoid" action="api/Employees"  class="m-t form-horizontal" role="form">
                                <div class="form-group"><label class="col-sm-2 control-label">Employee No.</label>

                                    <div class="col-sm-10"><input type="text" id="empnum" name="empnum" class="form-control"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">Employee Name</label>

                                    <div class="col-sm-10"><input type="text" id="empname" name="empname" class="form-control"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">Mobile Number</label>

                                    <div class="col-sm-10"><input type="text" id="mobile" name="mobile" class="form-control"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">Email Address</label>

                                    <div class="col-sm-10"><input type="email" name="email" id="email" class="form-control"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">Designation</label>

                                    <div class="col-sm-10"><input type="text" name="designation" id="designation" class="form-control"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <br />
                                <div class="text-center"><button class="btn btn-primary " id="submitButton" name="submitButton" type="submit"><i class="fa fa-check"></i>&nbsp;Add Employee</button></div>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

 <script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>
 <script src="js/plugins/validate/jquery.validate.min.js"></script>

        <script type='text/javascript'>


             $("#formoid").validate({
                 rules: {
                     mobile: {
                         required: true,
                         number: true
                     },
                     email: {
                         required: true,
                         email: true
                     },
                     empname: {
                         required: true,
                     },
                     empnum: {
                         required: true
                     }
                 },
                 submitHandler: function (form) {
                     
                     $('#submitButton').prop('disabled', true);

                     var empJSON = $.parseJSON('{ companyid: 0, designation: "", empnum: "", empname: "", empstatus: 1, email: "", primarymobile: 0 }');

                     empJSON[0].companyid = <%= Session["SelectClientId"] %>;
                     empJSON[0].designation = $('#designation').val();
                     empJSON[0].empnum = $('#empnum').val();
                     empJSON[0].empname = $('#empname').val();
                     empJSON[0].email = $('#email').val();
                     empJSON[0].primarymobile = $('#mobile').val();

                     alert(empJSON[0].companyid);
                     alert(empJSON[0].empnum);

                     var posting = $.post('api/Employees', empJSON[0]);

                     posting.done(function (data) {
                         if (data.EmpId == 0) {
                             alert("User Not Created");
                         }
                         else
                         {
                             $('#formoid').trigger("reset");
                             alert("User Created Successfully");
                             $('#submitButton').prop('disabled', false);
                         }
                     });
                 }
             });
    
    </script>

</asp:Content>