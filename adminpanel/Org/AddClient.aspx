<%@ Page Title="Create New Client" Language="C#" MasterPageFile="~/Org/OrgTemplate1.Master" AutoEventWireup="true" CodeBehind="AddClient.aspx.cs" Inherits="adminpanel.Org.AddClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/plugins/dropzone/basic.css" rel="stylesheet" />
    <link href="../css/plugins/dropzone/dropzone.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-sm-4">
                    <h1>Create New Client</h1>
                </div>
            </div>
    <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="ibox ">
                       
                        <div class="ibox-content">
                            <form method="post" id="formoid"   class="m-t form-horizontal" role="form">
                            
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Client Name</label>
                                    <div class="col-sm-10"><input type="text" id="clientName" required="required"  class="form-control"/></div>
                                </div>

                                <div class="text-center"><button class="btn btn-primary " id="submitButton" name="submitButton" type="submit"><i class="fa fa-check"></i>&nbsp;Add Client</button></div>
                                </form>
                                </div>
                        </div>
                    </div>
        </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">
    <script src="../js/plugins/dropzone/dropzone.js"></script>
    <script>

        var gEmpId = <%= Session["EmpId"] %>;

        //alert(gEmpId);
        
        $("#formoid").submit(function (event) {

            $("#submitButton").prop("disabled", true);

            event.preventDefault();

            var empClientJSON = {

                "orgEmpId": gEmpId,
                "clientName": $("#clientName").val()
            };

            $.ajax({
                type: "POST",
                url: "../addClient",
                data: empClientJSON,
                success: function (result) {

                    $("#submitButton").prop("disabled", false);
                    alert("Client Succesfully created");
                    window.location.href = "ShowClients.aspx";

                },
                error: function(result) {
                    alert(JSON.stringify(result));
                    $("#submitButton").prop("disabled", false);

                },
                datatype: "json"
            });
        });


    </script>
</asp:Content>
