<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printClaim.aspx.cs" Inherits="adminpanel.Common.printClaim" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Claim</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" />

    <style>
        body {
            overflow-y: scroll;
            font-size:smaller;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;

        }
        .center {
            margin: auto;
            width: 100%;
            padding: 10px;
        }

        .data-label {
            width:30%;
            padding:4px
        }

        
        .data-value {
            padding-left:4px;
            padding-right:4px;

            font-weight:600;
        }

        .doc-border {
            border:1px thin; 
        }

        table {
            border:thin 1px;
            width:100%;
        }
        
        /*
            .expenseTable {
            page-break-inside:auto;
        }
        */

        .expenseTable td {
            padding:5px;
        }

        .curr {
            text-align:right;
        }
        
        .expenseTable .expType {
            text-align:center;
        }
        
        .expenseTable tr { 
            page-break-inside:avoid; 
            page-break-after:auto 
        }

        @media print {
            thead {
                display: table-header-group;
            }
        }

        table {
            color: #333;
            border-collapse: collapse;
            border-spacing: 0;
        }

        th {
            background: #DFDFDF; /* Darken header a bit */
            font-weight: bold;
            text-align-last:center;
        }

        td {
            background: #FAFAFA;
        }

        .expenseTable tr:nth-child(even) td {
            background: #F1F1F1;
        }

        .expenseTable tr:nth-child(odd) td {
            background: #FEFEFE;
        }
    </style>
</head>

<body>
    <div style="padding-top:10px;" class="container">
        <div class="center">
        <div class="row">
            <h3 class="pull-left">GenieHR Solutions Pvt. Ltd.</h3>
            <img class="pull-right" src="../img/print-logo.png" />
        </div>
    <hr />
            <div style="padding-top:10px" class="row">
    <div class="col-lg-6 col-sm-6 col-md-6 col-xs-6" >
        <table  border="1">
        <tr >
            <td class="data-label">Emp Name</td>
            <td class="data-value empName"></td>
        </tr>
        <tr >
            <td class="data-label">Emp Num</td>
            <td class="data-value empNum"></td>
        </tr>
            <tr >
            <td class="data-label">Mobile No</td>
            <td class="data-value empMobile"></td>
        </tr>
                        <tr >
            <td class="data-label">Email</td>
            <td class="data-value empEmail"></td>
        </tr>
            <tr >
            <td class="data-label">Designation</td>
            <td class="data-value empDesignation"></td>
        </tr>

    </table>
        </div>
                
     <div class="col-lg-6 col-sm-6 col-md-6 col-xs-6 ">
        <table  border="1">
            <tr >
            <td class="data-label">Claim No</td>
            <td class="data-value claimNo"></td>
        </tr>
        <tr>     
            <td class="data-label">Period</td>
            <td class="data-value claimPeriod"></td>
        </tr>
             
        <tr >
            <td class="data-label">Date</td>
            <td class="data-value createDate"></td>
        </tr>
           <tr>
            <td class="data-label">Client</td>
            <td class="data-value clientName"></td>
        </tr>
            <tr>
            <td class="data-label">Manager</td>
            <td class="data-value managerName"></td>
        </tr>

    </table>

        </div>
            </div>
            <div style="padding-top:10px" class="row">
    <div class="col-lg-6 col-sm-6 col-md-6 col-xs-6" >
        <table  border="1">
            <thead>
            <tr >
            <th class="data-label">Expense</th>
            <th class="data-value">Claimed</th>
            <th class="data-value">Approved</th>

        </tr>
                </thead>
        <tr >
            <td class="data-label">Travel</td>
            <td class="data-value curr"><span class="travel"></span></td>
            <td class="data-value curr travelA"></td>

        </tr>
        <tr >
            <td class="data-label">Hotel</td>
            <td class="data-value curr hotel"></td>
            <td class="data-value curr hotelA"></td>

        </tr>
            <tr >
            <td class="data-label">Food</td>
            <td class="data-value curr food"></td>
            <td class="data-value curr foodA"></td>

        </tr>
                        <tr >
            <td class="data-label">Others</td>
            <td class="data-value curr others"></td>
            <td class="data-value curr othersA"></td>

        </tr>
                        <tr style="border-top-style:double;border-bottom-style:double">
            <td class="data-label">Total</td>
            <td class="data-value curr totalC"></td>
            <td class="data-value curr totalA"></td>

        </tr>
            

    </table>
        </div>
                <div class="col-lg-6 col-sm-6 col-md-6 col-xs-6  ">

       <%-- 
       <table style="height:auto;width:auto" border="1">
        <tr>     <td style="text-align:center;padding:5px">
                 </td>
        </tr>

    </table>--%>
        
        <div  class="text-center" style="vertical-align:middle">
            <br />
            <img style="border:solid 1px;padding:5px" class="qrCode"   />
        </div>

        </div>
            </div>
            <div style="padding-top:30px" class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <table border="1" class="expenseTable">
                        
                        <thead style="border-top:1px thin">
                            <tr class="text-center" style="font-weight:700; border-bottom:solid 2px">
                                <th style="width:10%">Exp Type</th>
                                <th style="width:15%">Date</th>
                                <th style="width:45%">Description</th>
                                <th style="width:15%">Claimed </th>
                                <th style="width:15%">Approved </th>
                            </tr>
                        </thead>

                        <tbody>
                       </tbody>

                        <tfoot> 
                            <tr>
                                <td colspan="3" class="curr">Total</td>
                                <td class="curr data-value totalC"></td>
                                <td class="curr data-value totalA"></td>
                            </tr>
                         </tfoot>

                    </table>
                    <div class="row" style=" text-align:center; margin-top:100px">
    <div class="pull-left" style="border-top:solid 1px;margin-left:20px;">
        Employee Signature & Date
    </div>
                        <div class="pull-right"  style="margin-right:20px; border-top:solid 1px" >
                            Manager Signature & Date

    </div>
                        </div>

                </div>
</div>
        </div>
        </div>
</body>

     <script src="../js/jquery-2.1.1.js"></script>

    <script>

       // localStorage.setItem("cliamId", 124);

        $(".claimId").html(localStorage.getItem("cliamId"));

        var claimURL = '../api/printClaim/' + localStorage.getItem("cliamId");

        $.getJSON(claimURL, function (claim) {
            $(".qrCode").attr("src", 'https://api.qrserver.com/v1/create-qr-code/?size=135x135&data=' + claim.claimNo);

            $(".empName").html(claim.empName);
            $(".claimNo").html(claim.claimNo);
            $(".empDesignation").html(claim.designation);
            $(".empMobile").html(claim.mobileNO);
            $(".claimPeriod").html([claim.periodFrom.substring(0, 10), 'to', claim.periodTO.substring(0, 10)].join(' ') );
            $(".createDate").html(claim.createDate.substring(0, 10));
            $(".empNum").html(claim.empNum);
            $(".empEmail").html(claim.email);
            $(".clientName").html(claim.clientName);
            $(".managerName").html(claim.approvingManager);


            var claimText = JSON.parse(claim.claimText);

            $(".travel").html(claimText.travelExpense);

            $(".hotel").html(claimText.hotelExpenseA);
            $(".food").html(claimText.foodExpense);
            $(".others").html(claimText.otherExpense);
            $(".othersA").html(claimText.otherExpenseA);
            $(".foodA").html(claimText.foodExpenseA);
            $(".hotelA").html(claimText.hotelExpense);
            $(".travelA").html(claimText.travelExpenseA);

            $(".totalC").html(claimText.totalExpense);
            $(".totalA").html(claimText.totalExpenseA);

            var expenseArray = [];

            var i = 0;

            for (i = 0; i < claimText.Travels.length; i++) {
                expenseArray.push({ 'ExpType': 'Travel', 'Date': claimText.Travels[i].traveldate, 'Description': claimText.Travels[i].purpose + '<br />' + claimText.Travels[i].from + ' to ' + claimText.Travels[i].to + '<br />' + 'Mode: ' + claimText.Travels[i].modeoftravel + ', Distance: ' + claimText.Travels[i].distance + ' km<br /> Remarks: ' + claimText.Travels[i].remarks, 'claimed': claimText.Travels[i].totalamount, 'approved': claimText.Travels[i].approvedAmt })
            }

            for (i = 0; i < claimText.Food.length; i++) {
                expenseArray.push({ 'ExpType': 'Food', 'Date': claimText.Food[i].expensedate, 'Description': claimText.Food[i].restaurantname + '<br />No. of Persons: ' + claimText.Food[i].noofpersons  + '<br />' + 'Remarks: ' + claimText.Food[i].remarks, 'claimed': claimText.Food[i].totalamount, 'approved': claimText.Food[i].approvedAmt })
            }

            for (i = 0; i < claimText.Hotels.length; i++) {
                expenseArray.push({ 'ExpType': 'Hotel', 'Date': claimText.Hotels[i].stayfromdate + '<br />  To <br/>' + claimText.Hotels[i].staytodate, 'Description': claimText.Hotels[i].hotelname + '<br />No. of Nights: ' + claimText.Hotels[i].noofnights + ', ' + 'Rate: ' + claimText.Hotels[i].rate + ' <br /> Remarks: ' + claimText.Hotels[i].remarks, 'claimed': claimText.Hotels[i].totalamount, 'approved': claimText.Hotels[i].approvedAmt })
            }

            //for (i = 0; i < claimText.Others.lenght; i++) {
            //    expenseArray.push({ 'ExpType': 'Others', 'Date': claimText.Others[i].stayfromdate + '<br />  To <br/>' + claimText.Hotels[i].staytodate, 'Description': claimText.Hotels[i].hotelname + '<br />No. of Nights: ' + claimText.Hotels[i].noofnights + ', ' + 'Rate: ' + claimText.Hotels[i].rate + ' <br /> Remarks: ' + claimText.Hotels[i].remarks, 'claimed': claimText.Hotels[i].totalamount, 'approved': claimText.Hotels[i].approvedAmt })
            //}

            $(expenseArray).each(function (i) { $('.expenseTable tbody').append('<tr><td class="expType">' + expenseArray[i].ExpType + '</td><td class="expType">' + expenseArray[i].Date + '</td><td>' + expenseArray[i].Description + '</td><td class="curr">' + expenseArray[i].claimed + '</td><td class="curr">' + expenseArray[i].approved + '</td></tr>') })
            

            $('title').html(claim.claimNo);

        });



        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        $(".bodyClass").html(getParameterByName('claimId'));

    </script>
</html>