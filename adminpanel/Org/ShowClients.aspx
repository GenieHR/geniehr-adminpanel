<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowClients.aspx.cs" MasterPageFile="~/Org/OrgTemplate1.Master" Inherits="Admin.Org.ShowClients" Title="Clients"%>


<asp:Content ID="Content1" ContentPlaceHolderID="body" Runat="Server">
    <br />
    <link href="css/spinners.css" rel="stylesheet" />
    <div id="loadingSpinner" class="text-center">
        <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <span  class="fa fa-4x fa-pulse fa-spinner"></span>
        </div>
    <div id="clientBoxes">
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="javascriptPart" Runat="Server">

    <script>
        $(document).ready(function () {
            $.ajax({
                url: "../api/orgEmpClients/<%= Session["EmpId"] %>",
                type: "Get",
                success: function (data) {

                    $('#loadingSpinner').remove();

                    for (var i = 0; i < data.length; i++) {
                        var clientBoxHTML = '<div class="col-lg-3"> <div class="ibox"> <div class="ibox-content product-box"> <div class="product-imitation"> <img onerror="this.src=\'../img/k9542856.png\'"  src="<%= ConfigurationManager.AppSettings["LogosURL"] %>' + data[i].ClientLogoURL + '"/> </div><div class="product-desc"> <span class="product-name"> ' + data[i].ClientName + '</span> <div class="m-t text-right"> <a href="#" onclick="javascript:gotoDashboard(' + data[i].ClientId + ',\'' + data[i].ClientName + '\')" class="btn btn-xs btn-outline btn-primary">Select</a> </div></div></div></div></div>';
                        $('#clientBoxes').append(clientBoxHTML);
                    }
                }
            });
        });

        function gotoDashboard(clientId, clientName)
        {
            localStorage.org_clientId = clientId;
            localStorage.org_clientName = clientName;

            window.location.href = "empProfileList.aspx";

        }
    </script>
</asp:Content>