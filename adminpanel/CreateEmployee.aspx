<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateEmployee.aspx.cs" Inherits="Admin.CreateEmployee" MasterPageFile="~/UbietyMenu.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" Runat="Server">
    <style>
        .vertical-alignment-helper {
    display:table;
    height: 100%;
    width: 100%;
    pointer-events:none; /* This makes sure that we can still click outside of the modal to close it */
}
.vertical-align-center {
    /* To center vertically */
    display: table-cell;
    vertical-align: middle;
    pointer-events:none;
}
.modal-content {
    /* Bootstrap sets the size of the modal in the modal-dialog class, we need to inherit it */
    width:inherit;
    height:inherit;
    /* To center horizontally */
    margin: 0 auto;
    pointer-events: all;
}
 
    </style>

    <div class="modal fade" id="myModal">
    <div class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center">
            <div class="modal-content">
                <div class="modal-body">
                    <div id="loadingContent" class="text-center">
                        <h3 id="userCreateStatus">Creating User, Please wait.</h3>
                        <div id="showProgress"><i class="fa fa-spinner fa-pulse"></i></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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
                            <form method="post" id="formoid"   class="m-t form-horizontal" role="form">
                                <div class="form-group"><label class="col-sm-2 control-label">Employee No.</label>
                                    <div class="col-sm-10"><input type="text" id="empnum" required="required" name="empnum" class="form-control"/></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">Employee Name</label>
                                    <div class="col-sm-10"><input type="text" required="required" id="empname" name="empname" class="form-control"/></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">Mobile Number</label>

                                    <div class="col-sm-10"><input type="number" required="required" id="mobile" name="mobile" class="form-control"/></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">Email Address</label>

                                    <div class="col-sm-10"><input type="email" required="required" name="email" id="email" class="form-control"/></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">Designation</label>

                                    <div class="col-sm-10"><input type="text" name="designation" id="designation" class="form-control"/></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group"><label class="col-sm-2 control-label">Role</label>

                                    <div class="col-sm-10">
                                        <div style="margin-top:5px;"><label> <input type="radio"  value="ClientAdmin"  name="RoleOfUser"/> Client Admin </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label> <input type="radio" checked="checked" value="ClientEmployee"  name="RoleOfUser"/> Client Employee </label></div>
                                    </div>
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


            $("#formoid").submit(function (event) {
                event.preventDefault();
                $('#myModal').modal({
                    backdrop: 'static',
                    keyboard: false
                })

                $('#myModal').modal();

                var empJSON = $.parseJSON('{ "companyid": 0, "designation": "", "empnum": "", "empname": "", "empstatus": 1, "email": "", "primarymobile": 0 }');

                empJSON.companyid = <%= Session["SelectClientId"] %>;
                empJSON.designation = $('#designation').val();
                empJSON.empnum = $('#empnum').val();
                empJSON.empname = $('#empname').val();
                empJSON.email = $('#email').val();
                empJSON.primarymobile = $('#mobile').val();


                $.ajax({
                    url: 'api/Employees',
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        $.ajax({
                            url: 'api/addEmpToRole/' + data.EmpId + '/' + $('input[name=RoleOfUser]:checked').val(),
                            type: 'post',
                            success: function () {
                                $("#userCreateStatus").html('<span class="text-success">' + data.EmpName + '</span> created successfully' );
                            }
                        });
                    },
                    data: empJSON
                });
            });
    
    </script>

</asp:Content>