<%@ Page Title="All Claims" Language="C#" MasterPageFile="~/Org/OrgManager.Master" AutoEventWireup="true" CodeBehind="AllClaims.aspx.cs" Inherits="adminpanel.Org.AllClaims" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .sulucted {
    background-color: blue;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-sm-10">
                    <h1>Claims</h1>
                    <ol class="breadcrumb">
                <li>
                    <a href="ShowClients.aspx" title="Change Client" id="clientName"></a>
                </li>

                <li>
                    <span>All Claims</span>
                </li>

                <li class="active">
                    <strong> View All Claims</strong>
                </li>

            </ol>
                </div>
    </div>

    <br />

    <div class="col-sm-12">
                    <div class="ibox float-e-margins" id="docIbox">
                        <div class="ibox-title">
                            <h5>Your Claims</h5>
                            
                        </div>
                        <div class="ibox-content">
                            <table class="table table-bordered table-condensed table-hover claimsTable" >
                                <thead>
                                    <tr>
                                        <th>Employee</th>
                                        <th>Claim No</th>
                                        <th>Create Date</th>
                                        <th>Purpose</th>
                                        <th>Claimed Amount</th>
                                        <th>Approved Amount</th>
                                        <th>Current Status</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>

                            </table>
                            </div>
                        </div>
        </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">

    <script>

        if (localStorage.getItem("org_clientId") == 0) {
            window.location.href = "showClients.aspx";

        }

        $("#clientName").html(localStorage.getItem("org_clientName"));

        $('.claimsTable tr').on('click', function() {
            $(this).toggleClass('sulucted');
        });

        $(".claimsTable").hide();
        
        $.ajax({
            url: "../api/getAllClaimsByClient/" + localStorage.getItem("org_clientId"),
        }).done(function (claimsInfo) {
            var val,page;
            $(claimsInfo).each(function(i) {
                if (claimsInfo[i].claimstatus =="1" || claimsInfo[i].claimstatus == "4") {
                    val = "";
                }
                else
                {
                    val = claimsInfo[i].ApprovedAmount;
                }

                if (claimsInfo[i].claimstatus =="1") {
                    page = "viewClaim";
                }
                else
                {
                    page="viewClaim";
                }

                $('.claimsTable tbody').append('<tr><td>' + claimsInfo[i].EmpName + '</td><td><a href="#" onclick=printClaim("' + claimsInfo[i].claimId + '","' + page + '")>' + claimsInfo[i].claimNo + '</td><td>' + claimsInfo[i].ClaimDate.substring(0, 10) + '</td><td>' + claimsInfo[i].claimPurpose + '</td><td>' + claimsInfo[i].totalAmount + '</td><td>' + val + '</td><td>' + claimsInfo[i].Status + '</td></tr>')
            })            

            $(".claimsTable").show();
        });

        function printClaim(claimId,page) {

            localStorage.setItem("cliamId", claimId);
            window.open(page + ".aspx");
        }

    </script>

</asp:Content>
