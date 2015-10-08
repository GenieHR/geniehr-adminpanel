<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowEmployees.aspx.cs" MasterPageFile="~/UbietyMenu.Master" Title="Employees" Inherits="Admin.showEmployees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" Runat="Server">
    <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h1><%= Request.QueryString["Client"].Split('|')[1] %></h1>
                <ol class="breadcrumb">
                    <li>
                       <h5>GenieHR Solutions Pvt. Ltd.</h5>
                    </li>
                </ol>
            </div>
        <div class="col-lg-2">
                </div>
            <div class="col-lg-2">

            </div>
        </div>
    <br />

    
    <div id="loadingSpinner" class="text-center">
        <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <span  class="fa fa-4x fa-pulse fa-spinner"></span>
        </div>

        <div id="empBoxes">

           
            </div>
    

    


    <script>
        

        $(document).ready(function () {
            $.ajax({
                url: "api/clientEmployees/<%= Request.QueryString["Client"].Split('|')[0] %>",
                type: "Get",
                success: function (data) {

                    $('#loadingSpinner').remove();

                    //$('#empBoxes').append('<div class="row">');

                    for (var i = 0; i < data.length; i++) {
                        var empBoxHTML = '<div class="col-md-4 col-lg-3 col-sm-6"> <div class="ibox"> <div class="ibox-content product-box"> <div class="row"> <div class="col-lg-3"> <img src="img/pp/' + data[i].ProfilePic + '.png" style="width:80px; height:120px"/></div><div class="col-lg-9"> <div class="product-desc"> <small class="text-muted">' + data[i].EmpNum + '</small> <a href="profile.aspx?EmpId=' + data[i].EmpId + '" class="product-name">' + data[i].EmpName + '</a> <div class="small m-t-xs"> ' + data[i].Email + ' </div><div class="small m-t-xs"> ' + data[i].PrimaryMobile + ' </div></div></div></div></div></div></div>';
                        $('#empBoxes').append(empBoxHTML);
                    }

                    $('#empBoxes').append('<div class="col-md-4 col-lg-3 col-sm-6"  id="addNewBox"> <div class="ibox"> <div class="ibox-content product-box"> <div class="row"> <div class="col-lg-5"> <img style="width:110px; height:120px" src="img/pp/add_user.png"/> </div><div class="col-lg-7"> <div class="product-desc"> <br/> <a href="CreateEmployee.aspx" class="text-center"> <h3>Create New</h3><h3>Employee</h3></a> </div></div></div></div></div></div>');
                    //$('#empBoxes').append('</div>');

                }
            });
        });
    </script>
    
</asp:Content>
