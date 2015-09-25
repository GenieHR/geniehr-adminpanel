<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowClients.aspx.cs" MasterPageFile="~/UbietyMenu.Master" Inherits="Admin.ShowClients" Title="Clients"%>

<asp:Content ID="Content1" ContentPlaceHolderID="body" Runat="Server">
    <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h1>Clients</h1>
                <ol class="breadcrumb">
                    <li>
                       <h5>GenieHR Solutions Pvt. Ltd.</h5>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>
    <br />
    <link href="css/spinners.css" rel="stylesheet" />
    <div id="loadingSpinner" class="text-center">
        <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <span  class="fa fa-4x fa-pulse fa-spinner"></span>
        </div>
    <div id="clientBoxes">

    </div>

    <script>
        $(document).ready(function () {
            $.ajax({
                url: "api/orgEmpClients/<%= Session["EmpId"] %>",
                type: "Get",
                success: function (data) {

                    $('#loadingSpinner').remove();

                    for (var i = 0; i < data.length; i++) {
                        var clientBoxHTML = '<div class="col-lg-3"> <div class="ibox"> <div class="ibox-content product-box"> <div class="product-imitation"> <img  src="img/logos/' + data[i].ClientLogoURL + '"/> </div><div class="product-desc"> <span class="product-name"> ' + data[i].ClientName + '</span> <div class="m-t text-right"> <a href="dashboard.aspx?Client=' + data[i].ClientId + '|' + data[i].ClientName + '" class="btn btn-xs btn-outline btn-primary">Select</a> </div></div></div></div></div>';
                        $('#clientBoxes').append(clientBoxHTML);
                    }
                }
            });
        });
    </script>
</asp:Content>