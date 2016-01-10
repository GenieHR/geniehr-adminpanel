<%@ Page Title="All Claims" Language="C#" MasterPageFile="~/Client/ClientManager.Master" AutoEventWireup="true" CodeBehind="AllClaims.aspx.cs" Inherits="adminpanel.Client.AllClaims" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .sulucted {
    background-color: blue;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>My Claims</h2>
        </div>
        <div class="col-lg-2">
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
        var gEmpId =<%= Session["EmpId"] %>; 

        $('.claimsTable tr').on('click', function() {
            $(this).toggleClass('sulucted');
        });

        $(".claimsTable").hide();
        
        $.ajax({
            url: "../api/getActiveClaims/" + gEmpId,
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
                    page="changeClaim";
                }
                else
                {
                    page="viewClaim";
                }

                $('.claimsTable tbody').append('<tr><td>' + claimsInfo[i].EmpName +'</td><td><a href="#" onclick=printClaim("' + claimsInfo[i].claimId + '","' + page + '")>' + claimsInfo[i].claimNo + '</td><td>' +  claimsInfo[i].ClaimDate.substring(0, 10) + '</td><td>' +  claimsInfo[i].claimPurpose + '</td><td>' + claimsInfo[i].totalAmount  + '</td><td>' + val  + '</td><td>' +  claimsInfo[i].Status + '</td></tr>')
            })            

            $(".claimsTable").show();
        });

        function printClaim(claimId,page) {

            localStorage.setItem("cliamId", claimId);
            window.open(page + ".aspx");
        }

    </script>

</asp:Content>
