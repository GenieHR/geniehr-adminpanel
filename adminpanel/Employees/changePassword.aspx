<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Employees/EmployeeTemplate.Master" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="adminpanel.Employees.changePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <div class="col-lg-8">

    <div class="animated fadeInDown">
                    <div class="ibox float-e-margins ">
                        <div class="ibox-title">
                            <h5>Change Password</h5>
                        </div>
                        <div class="ibox-content">
                            <form class="form-horizontal" method="post" id="changePasswordForm" >
                                
                                <div class="form-group"><label class="col-lg-4 control-label">Current Password</label>

                                    <div class="col-lg-8"><input type="password" required="required" id="oldPassword" placeholder="Current Password" class="form-control"> 
                                    </div>
                                </div>

                                <div class="form-group"><label class="col-lg-4 control-label">New Password</label>

                                    <div class="col-lg-8"><input type="password" required="required"  id="newPassword" placeholder="New Password" class="form-control"> 
                                    </div>
                                </div>

                                <div class="form-group"><label class="col-lg-4 control-label" >Confirm New Password</label>

                                    <div class="col-lg-8"><input type="password" required="required" placeholder="Confirm New Password" id="confirmPassword" class="form-control"> 
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-offset-4 col-lg-10">
                                        <button class="btn btn-sm btn-success" id="changePasswordFormSubmit" type="submit">Change Password</button>

                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">

    <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
    <script>

        var gEmpId = <%= Session["EmpId"] %>;

        $("#changePasswordForm").submit(function (event) {

            event.preventDefault();

            if(!($("#newPassword").val() === $("#confirmPassword").val()))
            {
                sweetAlert({   
                    title: "Wrong Info!",   
                    text: "New & Confirm passwords doesn't match",   
                    type: "error",   
                    confirmButtonColor: "red",   
                    confirmButtonText: "Ok",   
                });

                return;
            }

            else
            {
                $("#changePasswordFormSubmit").prop("disabled", true);
            }

            var changePwdJSON = {

                "EmpId": gEmpId,
                "oldPassword": $("#oldPassword").val(),
                "newPassword": $("#newPassword").val()
            };

            $.ajax({
                type: "POST",
                url: "../change",
                data: changePwdJSON,
                success: function (result) { changePasswordSuccess(result); },
                datatype: "json"
            });
        });

        function changePasswordSuccess(result) {
            if (result.Succeeded) {

                sweetAlert({   
                    title: "Password changed succesfully!",   
                    text: "You have changed your password. Please relogin with your new password",   
                    type: "success",   
                    confirmButtonColor: "green",   
                    confirmButtonText: "Ok",   
                }, 
                  function(){   
                      window.location.replace("../logout.aspx");
                  });
            }
            else
            {
                sweetAlert({   
                    title: "Wrong Info!",   
                    text: "Your current password is wrongly entered",   
                    type: "error",   
                    confirmButtonColor: "red",   
                    confirmButtonText: "Ok",   
                });

                $("#changePasswordFormSubmit").prop("disabled", false);
            }
        }

</script>
</asp:Content>
