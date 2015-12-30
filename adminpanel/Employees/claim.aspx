<%@ Page Title="Claims" Language="C#" MasterPageFile="~/Employees/EmployeeTemplate.Master" AutoEventWireup="true" CodeBehind="claim.aspx.cs" Inherits="adminpanel.passwords.claim" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <style>
        .vertical-alignment-helper {
            display: table;
            height: 100%;
            width: 100%;
            pointer-events: none;
        }

        .vertical-align-center {
            display: table-cell;
            vertical-align: middle;
            pointer-events: none;
        }

        .modal-content {
            width: inherit;
            height: inherit;
            margin: 0 auto;
            pointer-events: all;
        }

        .button-hide {
            display: none;
        }

    </style>

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Add A New Claim</h2>
        </div>
        <div class="col-lg-2">
        </div>
    </div>

    <br />

    <div class="col-lg-12 col-sm-12 col-md-12 ">
        <div class="tabs-container">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#tabSummary">Summary</a></li>
                <li><a data-toggle="tab" href="#tabTravel">Travel</a></li>
                <li><a data-toggle="tab" href="#tabHotel">Hotel</a></li>
                <li><a data-toggle="tab" href="#tabFood">Food</a></li>
                <li><a data-toggle="tab" href="#tabOthers">Others</a></li>
            </ul>
            <div class="tab-content ">

                <div id="tabSummary" class="tab-pane active">
                    <div class="panel-body">
                        <div class="row">

                            <div class="col-lg-8 col-sm-8 col-md-8">
                                <form id="summaryForm" method="get" class="form-horizontal">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Purpose</label>
                                        <div class="col-sm-10">
                                            <input type="text" required="required" id="claimPurpose" class="form-control" />
                                        </div>
                                    </div>

                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Date</label>

                                        <div class="col-sm-4">
                                            <div class="input-group m-b">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <input type="text" id="claimDate" disabled="disabled" class="form-control" />
                                            </div>
                                        </div>
                                        <label class="col-sm-2 control-label">Status</label>

                                        <div class="col-sm-4">
                                            <input type="text" readonly class="form-control" value="Create" />
                                        </div>
                                    </div>
                                    <hr class="hr-line-dashed" style="margin-top: 0px" />
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Manager</label>

                                        <div class="col-sm-10">
                                            <input type="text" readonly id="managerName" class="form-control" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-4 col-sm-4 col-md-4">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="width: 65%">Expense</th>
                                            <th>Amount ( &#x20B9 )</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Travel</td>
                                            <td class="curr" id="sumTravelAmt">0.00</td>
                                        </tr>
                                        <tr>
                                            <td>Hotel</td>
                                            <td class="curr" id="sumHotelAmt">0.00</td>

                                        </tr>
                                        <tr>
                                            <td>Food</td>
                                            <td class="curr" id="sumFoodAmt">0.00</td>

                                        </tr>

                                        <tr>
                                            <td>Others</td>
                                            <td class="curr" id="summOthAmt">0.00</td>

                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr style="background-color: lightgray">
                                            <td><b>Total</b></td>
                                            <td class="curr"><b id="summTotAmt">0.00</b></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>

                        </div>
                        <div class="hr-line-dashed" style="margin-top: 0px"></div>

                        <div class="row">
                            <div class="col-sm-2">
                                <label class=" control-label">Add Expense</label>
                            </div>
                            <div class=" text-left col-sm-10">
                                <input type="button" value="Travel" onclick="javascript: activateTab('tabTravel')" class="btn btn-success btn-xs" />
                                <input type="button" value="Hotel" onclick="javascript: activateTab('tabHotel')" class="btn btn-success btn-xs" />
                                <input type="button" value="Food" onclick="javascript: activateTab('tabFood')" class="btn btn-success btn-xs" />
                                <input type="button" value="Other" onclick="javascript: activateTab('tabOthers')" class="btn btn-success btn-xs" />
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-12" id="expensesTableDiv">
                            </div>
                        </div>
                        <div class="row text-right">
                            <input type="button" value="Submit" onclick="javascript:submitClaim()" class="btn btn-success" />
                            <input type="button" value="Save" onclick="javascript:saveDraftClaim()" class="btn btn-info" />
                            <input type="button" value="Discard" onclick="javascript:discardClaim()" class="btn btn-danger" />


                        </div>
                    </div>
                </div>

                <div id="tabTravel" class="tab-pane fade in">
                    <div class="panel-body">

                        <form id="travelForm" method="get" class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Travel Purpose</label>
                                <div class="col-sm-10">
                                    <input type="text" required="required" id="travelpurpose" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Travel Date</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" required="required" id="traveldate" class="form-control" />
                                    </div>
                                </div>
                                <label class="col-sm-2 control-label">Mode of Travel</label>
                                <div class="col-sm-4">
                                    <label class="checkbox-inline">
                                        <input type="radio" required="required" name="modeoftravel" value="Auto" id="inlineCheckbox1" />
                                        Auto
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" required="required" value="Train" name="modeoftravel" id="inlineCheckbox2" />
                                        Train
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" required="required" value="Bus" name="modeoftravel" id="inlineCheckbox3" />
                                        Bus
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" required="required" value="Bike" name="modeoftravel" id="inlineCheckbox4" />
                                        Bike
                                    </label>
                                </div>

                            </div>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">From</label>
                                <div class="col-sm-4">
                                    <input type="text" required="required" id="travelfrom" class="form-control" />


                                </div>
                                <label class="col-sm-2 control-label">To</label>
                                <div class="col-sm-4">
                                    <input type="text" required="required" id="travelto" class="form-control" />
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Distance</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <input type="text" required="required" id="traveldistance" class="form-control" /><span class="input-group-addon">Kms</span>
                                    </div>
                                </div>
                                <label class="col-sm-2 control-label">Rate</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon">&#x20B9</span>
                                        <input type="text" id="travelrate" class="form-control" />
                                        <span class="input-group-addon">per km</span>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Remarks</label>
                                <div class="col-sm-10">
                                    <input type="text" id="travelremarks" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Total Amount</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon">&#x20B9</span>
                                        <input type="number" required="required" id="travelamount" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-6">

                                    <input type="button" class="pull-right btn btn-info" value="Clear" />
                                    <input type="submit" class="pull-right btn btn-success button-hide" value="Update" />
                                    <input type="submit" class="pull-right btn btn-info" value="Add Expenses" style="margin-right: 4px" />


                                </div>
                            </div>
                        </form>

                    </div>
                </div>

                <div id="tabHotel" class="tab-pane fade">
                    <div class="panel-body">

                        <form id="hotelForm" method="get" class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Hotel Name</label>
                                <div class="col-sm-10">
                                    <input type="text" required="required" id="hotelname" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Stay From Date</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" required="required" id="stayfromdate" class="form-control" />
                                    </div>
                                </div>
                                <label class="col-sm-2 control-label">Stay To Date</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" required="required" id="staytodate" class="form-control" />
                                    </div>
                                </div>

                            </div>
                            <div class="hr-line-dashed"></div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">No. of Nights</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <input type="number" id="noofnights" class="form-control" /><span class="input-group-addon">Nights</span>
                                    </div>
                                </div>
                                <label class="col-sm-2 control-label">Rate</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon">&#x20B9</span>
                                        <input type="number" id="hotelrate" required="required" class="form-control" />
                                        <span class="input-group-addon">per night</span>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Remarks</label>
                                <div class="col-sm-10">
                                    <input type="text" required="required" id="hotelremarks" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Total Amount</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon">&#x20B9</span>
                                        <input type="number" required="required" id="hotelamount" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <input type="button" class="pull-right btn btn-info" value="Clear" />
                                    <input type="submit" class="pull-right btn btn-success button-hide" value="Update" />
                                    <input type="submit" class="pull-right btn btn-info" value="Add Expense" style="margin-right: 4px" />


                                </div>
                            </div>
                        </form>

                    </div>
                </div>

                <div id="tabFood" class="tab-pane fade">
                    <div class="panel-body">

                        <form id="foodForm" method="get" class="form-horizontal">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Restaurant Name</label>
                                <div class="col-sm-10">
                                    <input type="text" required="required" id="restaurantname" class="form-control" />
                                </div>
                            </div>

                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Expense Date</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" required="required" id="foodexpensedate" class="form-control" />
                                    </div>
                                </div>
                                <label class="col-sm-2 control-label">No. of Persons</label>

                                <div class="col-sm-4">
                                    <input type="text" id="foodnoofpersons" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Remarks</label>
                                <div class="col-sm-10">
                                    <input type="text" required="required" id="foodremarks" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Total Amount</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon">&#x20B9</span>
                                        <input type="number" required="required" id="foodtotalamount" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <input type="button" class="pull-right btn btn-info" value="Clear" />
                                    <input type="submit" class="pull-right btn btn-success button-hide" value="Update" />
                                    <input type="submit" class="pull-right btn btn-info" value="Add Expense" style="margin-right: 4px" />

                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div id="tabOthers" class="tab-pane fade">
                    <div class="panel-body">
                        <form id="othersForm" method="get" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Expense Description</label>
                                <div class="col-sm-10">
                                    <input type="text" required="required" id="otherdesc" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Expense Date</label>
                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="date" required="required" id="otherexpensedate" class="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Remarks</label>
                                <div class="col-sm-10">
                                    <input type="text" required="required" id="otherexpenseremarks" class="form-control" />
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Total Amount</label>

                                <div class="col-sm-4">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon">&#x20B9</span>
                                        <input type="number" required="required" id="otherexpenseamt" class="form-control" />
                                    </div>
                                </div>
                                <div class="col-sm-6">

                                    <input type="button" class="pull-right btn btn-info" value="Clear" />
                                    <input type="submit" class="pull-right btn btn-success button-hide" value="Update" />
                                    <input type="submit" class="pull-right btn btn-info" value="Add Expense" style="margin-right: 4px" />

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal">
        <div class="vertical-alignment-helper">
            <div class="modal-dialog vertical-align-center">
                <div class="modal-content">
                    <div class="modal-body">
                        <div id="loadingContent" class="text-center">
                            <h3>Submitting claim, Please wait.</h3>
                            <i class="fa fa-2x fa-spinner fa-pulse"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="draftClaimModal">
        <div class="vertical-alignment-helper">
            <div class="modal-dialog vertical-align-center">
                <div class="modal-content">
                    <div class="modal-body">
                        <div id="loadingContentDraft" class="text-center">
                            <h3>Saving claim, Please wait.</h3>
                            <i class="fa fa-2x fa-spinner fa-pulse"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="javascriptPart" runat="server">

<script>
        
    var empId = <%= Session["EmpId"] %>;
    var intTravelNo = -1; 
    var intHotelNo = -1;
    var intFoodNo = -1;
    var intOthersNo = -1;
    var managerInfo, orgEmpInfo;
    var travelLineId,hotelLineId,foodLineId,othersLineId;

    $('#myModal').on('hidden.bs.modal', function () {
        window.location = 'claim.aspx';
    })

    var gClaimNo = null, gClaimId = -1;
    var newId = 0;
    var claimJSON = $.parseJSON('{"travelExpense":0, "foodExpense":0, "hotelExpense":0,"otherExpense":0, "totalExpense":0,"claimpurpose":"","Travels":[],"Hotels":[],"Food":[],"Others":[]}');

    $("#claimDate").datepicker({ dateFormat: 'MM dd, yy' }).datepicker("setDate", new Date());

    $( document ).ready(function() {
        
        $.ajax({
            url: '../api/getClaimDraft/' + empId,
            success: function (data) {
                alert('came here with ' + data.length);
                if (data.length > 0) {
                    gClaimNo = data[0].claimNo;
                    gClaimId = data[0].id;

                    claimJSON = JSON.parse(data[0].claimText);

                    $("#sumTravelAmt").val(claimJSON.travelExpense);

                    $("#sumFoodAmt").html(claimJSON.foodExpense);

                    $("#summOthAmt").html(claimJSON.otherExpense);

                    $("#sumHotelAmt").html(claimJSON.hotelExpense);

                    $("#summTotAmt").html(claimJSON.totalExpense);

                    $("#claimPurpose").val(data[0].claimPurpose);

                    $("#claimDate").val(data[0].claimDate.substring(0, 10));
                    $("#claimNo").val(data[0].claimNo);

                           
                    if($("#expensesTable").length == 0) {
                        $('#expensesTableDiv').html('<table id="expensesTable" class=" table table-stripped table-bordered table-hover table-condensed"><thead><tr><th style="width: 10%;">Type </th><th style="width: 10%;">Date </th><th style="width: 60%">Notes</th><th style="width: 10%" class="curr">Amount</th><th style="width: 10%">Manage</th></tr></thead><tbody></tbody></table>');
                    }

                    var i = 0;

                    for (i = 0; i < claimJSON.Travels.length; i++) {
                        var lineId = 'Travel_' + i;
                        $('#expensesTable  tbody').append('<tr><td>Travel</td><td>' + claimJSON.Travels[i].traveldate + '</td><td>' + claimJSON.Travels[i].purpose + '</td><td class="curr">' + claimJSON.Travels[i].totalamount + '</td><td class="text-center text-info"><a href="#" onclick="viewvalues(\'' + lineId + '\')"><i class="fa fa-eye"></i></a></tr>');
                    }

                    for (i = 0; i < claimJSON.Hotels.length; i++) {
                        var lineId = 'Hotel_' + i;
                        $('#expensesTable  tbody').append('<tr><td>Hotel</td><td>' + claimJSON.Hotels[i].staytodate + '</td><td>' + claimJSON.Hotels[i].hotelname + '</td><td class="curr">' + claimJSON.Hotels[i].totalamount + '</td><td class="text-center text-info"><a href="#" onclick="viewvalues(\'' + lineId + '\')"><i class="fa fa-eye"></i></a></tr>');
                    }

                    for (i = 0; i < claimJSON.Food.length; i++) {
                        var lineId = 'Food_' + i;
                        $('#expensesTable  tbody').append('<tr><td>Food</td><td>' + claimJSON.Food[i].expensedate + '</td><td>' + claimJSON.Food[i].restaurantname + '</td><td class="curr">' + claimJSON.Food[i].totalamount + '</td><td class="text-center text-info"><a href="#" onclick="viewvalues(\'' + lineId + '\')"><i class="fa fa-eye"></i></a></tr>');
                    }

                    for (i = 0; i < claimJSON.Others.length; i++) {
                        var lineId = 'Others_' + i;
                        $('#expensesTable  tbody').append('<tr><td>Others</td><td>' + claimJSON.Others[i].otherexpensedate + '</td><td>' + claimJSON.Others[i].otherdesc + '</td><td class="curr">' + claimJSON.Others[i].otherexpenseamt + '</td><td class="text-center text-info"><a href="#" onclick="viewvalues(\'' + lineId + '\')"><i class="fa fa-eye"></i></a></tr>');
                    }

                }
            }
        });
        

        $.ajax({
            url: '../api/getOrgEmployeeDetails/' + empId,
            success: function (data) {
                orgEmpInfo = data;
            }
        });

        $.ajax({
            url: '../api/getEmployeeManagers/' + empId,
            success: function (data) {
                managerInfo = data;
                var manNames;
                manNames = data[0].Manager_Name

                if (data.length > 1) {
                    var i = 1;
                    for (i=1;i< data.length;i++) {
                        manNames += ' / ' + data[i].Manager_Name;   
                    }
                }
                $("#managerName").val(manNames);
            }
        });

    });
       
function activateTab(tab) {
    $('.nav-tabs a[href="#' + tab + '"]').tab('show');
}

    
function saveDraftClaim() {
  
    if( $.trim($("#claimPurpose").val()) == "") {
        alert("Claim pupose cannot be blank");
        $("#claimPurpose").focus();
        return false;
    }

    $('#draftClaimModal').modal({
        backdrop: 'static',
        keyboard: false
    });

    $('#draftClaimModal').modal();
           
    claimJSON.travelExpense = parseInt($("#sumTravelAmt").html());
    claimJSON.claimpurpose = $("#claimPurpose").val();
    claimJSON.foodExpense = parseInt($("#sumFoodAmt").html());
    claimJSON.hotelExpense = parseInt($("#sumHotelAmt").html());
    claimJSON.otherExpense = parseInt($("#summOthAmt").html());
    claimJSON.totalExpense = parseInt($("#summTotAmt").html());
            
    if (gClaimId > -1) {
    var uploadVal = {
        "id": gClaimId,
        "claimNo": gClaimNo,
        "EmpId": empId,
        "claimDate": $("#claimDate").val(),
        "claimPurpose": claimJSON.claimpurpose,
        "claimText": JSON.stringify(claimJSON),
        "totalAmount": parseInt($("#summTotAmt").html()),
        "claimstatus": 0
    };
    }
    else
    {
        var uploadVal = {
          
            "EmpId": empId,
            "claimDate": $("#claimDate").val(),
            "claimPurpose": claimJSON.claimpurpose,
            "claimText": JSON.stringify(claimJSON),
            "totalAmount": parseInt($("#summTotAmt").html()),
            "claimstatus": 0
        };
    }

    $.ajax({
        url: '../api/draftClaimJSON',
        type: 'post',
        dataType: 'json',
        data: uploadVal,
        success: function (data) {
            gClaimNo = data.claimNo;
            gClaimId = data.id;

            $("#loadingContentDraft").html('<h3>Draft Claim No <span class="text-success">' + gClaimNo + ' </span> saved. <br/><br/> You can continue updating the claim</h3><a data-dismiss="modal">Close</a>');
            
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            $("#loadingContentDraft").html('<h3 class="text-danger">Error submitting claim. ' + errorThrown + '  </h3><a data-dismiss="modal">Ok</a>');
        }
    });
}


function submitClaim() {
                
    if(parseInt($("#summTotAmt").html()) == 0) {
        alert("Add atleast one expense");
        return false;
    }

    if( $.trim($("#claimPurpose").val()) == "") {
        alert("Claim pupose cannot be blank");
        $("#claimPurpose").focus();
        return false;
    }

    $('#myModal').modal({
        backdrop: 'static',
        keyboard: false
    });

    $('#myModal').modal();
           
    claimJSON.travelExpense = parseInt($("#sumTravelAmt").html());
    claimJSON.claimpurpose = $("#claimPurpose").val();
    claimJSON.foodExpense = parseInt($("#sumFoodAmt").html());
    claimJSON.hotelExpense = parseInt($("#sumHotelAmt").html());
    claimJSON.otherExpense = parseInt($("#summOthAmt").html());
    claimJSON.totalExpense = parseInt($("#summTotAmt").html());
            
    var uploadVal = {
        "EmpId": empId,
        "claimDate": $("#claimDate").val(),
        "claimPurpose": claimJSON.claimpurpose,
        "claimText": JSON.stringify(claimJSON),
        "totalAmount": parseInt($("#summTotAmt").html()),
        "claimstatus": 1
    };

    $.ajax({
        url: '../api/claimJSONs',
        type: 'post',
        dataType: 'json',
        data: uploadVal,
        success: function (data) {
            $("#loadingContent").html('<h3>Claim no. <span class="text-success">' + data.claimNo + ' </span> submitted succesfully</h3><a data-dismiss="modal">Close</a>');
            
    
            var emailJSON = {
                "toEmailAddress":managerInfo[0].Manager_Email,
                "ccEmailAddress":orgEmpInfo[0].Email,
                "mailSubject": "Claim (" + data.claimNo  + ") from <%= Session["loggedinuserName"] %>",
                "mailBody":'<html><body>Dear ' +  managerInfo[0].Manager_Name +' ,<br /> <br /><%= Session["loggedinuserName"] %> has created a claim ('+ data.claimNo + '). Please login to <a href="http://ubiety.geniehr.com">Ubiety</a> and take necessary action on the claim.<br /><br />Thank You.<br /><br />For,<br/>Team GenieHR Solutions Pvt. Ltd.<br/><br/>Please Note: This is a system generated email and is not monitored. Please don’t reply to this email.</body></html>'
            }

            
            $.ajax({
                type: "post",
                url: '../sendmail',
                data: JSON.stringify(emailJSON),
                contentType: 'application/json',
                dataType: "json"
            });

            gClaimNo = null;
            gClaimId = -1;
            
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            $("#loadingContent").html('<h3 class="text-danger">Error submitting claim. ' + errorThrown + '  </h3><a data-dismiss="modal">Close</a>');
        }
    });
}

$("#foodForm").submit(function (event) {

    event.preventDefault();

    if (intFoodNo > -1) {
        claimJSON.Food.splice(intFoodNo,1);
        $('#' + foodLineId).remove();
        intFoodNo = -1;
    }

    addExpense('Food');
    $('#foodForm').trigger("reset");
    activateTab('tabSummary');
});


$("#travelForm").submit(function (event) {
    event.preventDefault();

    if($("#travelamount").val() <= 0) {
        alert("Claimed amount should be positive value");
        return false;
    }
    
    if (intTravelNo > -1) {
        claimJSON.Travels.splice(intTravelNo,1);
        $('#' + travelLineId).remove();
        intTravelNo = -1;
    }

    addExpense('Travel');
    $('#travelForm').trigger("reset");
    activateTab('tabSummary');
});


$("#hotelForm").submit(function (event) {
    event.preventDefault();

    if (intHotelNo > -1) {
        claimJSON.Hotels.splice(intHotelNo,1);
        $('#' + hotelLineId).remove();
        intHotelNo = -1;
    }

    addExpense('Hotel');
    $('#hotelForm').trigger("reset");
    activateTab('tabSummary');
});


$("#othersForm").submit(function (event) {
    event.preventDefault();

    if (intOthersNo > -1) {
        claimJSON.Others.splice(intOthersNo,1);
        $('#' + othersLineId).remove();
        intOthersNo = -1;
    }
    
    addExpense('Others');
    $('#othersForm').trigger("reset");
    activateTab('tabSummary');
});


function calculateTotalAmt() {
    var totamt = parseInt($("#sumTravelAmt").html()) + parseInt($("#sumHotelAmt").html()) + parseInt($("#sumFoodAmt").html()) + parseInt($("#summOthAmt").html());
    $("#summTotAmt").html(totamt);
}

function calculateSummTravelAmt() {
    var i = claimJSON.Travels.length;
    var p;
    var totAmt = 0;
    for (p = 0; p < i; p++) {
        totAmt += parseInt(claimJSON.Travels[p].totalamount);
    }
    $("#sumTravelAmt").html(totAmt);
}
    
function calculateSummHotelAmt() {
    var i = claimJSON.Hotels.length;
    var p;
    var totAmt = 0;
    for (p = 0; p < i; p++) {
        totAmt += parseInt(claimJSON.Hotels[p].totalamount);
    }
    $("#sumHotelAmt").html(totAmt);
}
    
function calculateSummFoodAmt() {
    var i = claimJSON.Food.length;
    var p;
    var totAmt = 0;
    for (p = 0; p < i; p++) {
        totAmt += parseInt(claimJSON.Food[p].totalamount);
    }
    $("#sumFoodAmt").html(totAmt);
}

function calculateSummOthersAmt() {
    var i = claimJSON.Others.length;
    var p;
    var totAmt = 0;
    for (p = 0; p < i; p++) {
        totAmt += parseInt(claimJSON.Others[p].otherexpenseamt);
    }
    $("#summOthAmt").html(totAmt);
}

function loadExpenses(expenseJSON) {
    $('#expensesTableDiv').html('<table id="expensesTable" class=" table table-stripped table-bordered table-hover table-condensed"><thead><tr><th style="width: 10%;">Type </th><th style="width: 10%;">Date </th><th style="width: 60%">Notes</th><th style="width: 10%" class="curr">Amount</th><th style="width: 10%">Manage</th></tr></thead><tbody></tbody></table>');

    newId++;

    var lineId = expenseType + '_' + newId;

}

function addExpense(expenseType) {
            
    if($("#expensesTable").length == 0) {
        $('#expensesTableDiv').html('<table id="expensesTable" class=" table table-stripped table-bordered table-hover table-condensed"><thead><tr><th style="width: 10%;">Type </th><th style="width: 10%;">Date </th><th style="width: 60%">Notes</th><th style="width: 10%" class="curr">Amount</th><th style="width: 10%">Manage</th></tr></thead><tbody></tbody></table>');
    }

    newId++;

    var lineId = expenseType + '_' + newId;

    switch (expenseType) {
        case 'Travel':
            claimJSON.Travels.push({ "id": newId, "purpose": $('#travelpurpose').val(), "traveldate": $("#traveldate").val(), "modeoftravel": $('input[name=modeoftravel]:checked').val(), "from": $("#travelfrom").val(), "to": $("#travelto").val(), "distance": $("#traveldistance").val(), "rate": $("#travelrate").val(), "remarks": $("#travelremarks").val(), "totalamount": $("#travelamount").val() });
            calculateSummTravelAmt();
            $('#expensesTable  tbody').append('<tr id="' + lineId + '"><td>Travel</td><td>' + $("#traveldate").val() + '</td><td>' + $('#travelpurpose').val() + '</td><td class="curr">' + $("#travelamount").val() + '</td><td class="text-center text-info"><a href="#" onclick="javascript:editvalues(\'' + lineId + '\')"><i class="fa fa-pencil-square-o"></i></a>&nbsp;&nbsp;  </tr>');
            break;
        case 'Hotel':
            claimJSON.Hotels.push({ "id": newId, "hotelname": $("#hotelname").val(), "stayfromdate": $("#stayfromdate").val(), "staytodate": $("#staytodate").val(), "noofnights": $("#noofnights").val(), "rate": $("#hotelrate").val(), "remarks": $("#hotelremarks").val(), "totalamount": $("#hotelamount").val() });
            calculateSummHotelAmt();
            $('#expensesTable  tbody').append('<tr id="' + lineId + '"><td>Hotel</td><td>' + $("#staytodate").val() + '</td><td>' + $('#hotelname').val() + '</td><td class="curr">' + $("#hotelamount").val() + '</td><td class="text-center text-info"><a href="#" onclick="javascript:editvalues(\'' + lineId + '\')"><i class="fa fa-pencil-square-o"></i></a>&nbsp;&nbsp;  </tr>');
            break;
        case 'Food':
            claimJSON.Food.push({ "id": newId, "restaurantname": $("#restaurantname").val(), "expensedate": $("#foodexpensedate").val(), "noofpersons": $("#foodnoofpersons").val(), "remarks": $("#foodremarks").val(), "totalamount": $("#foodtotalamount").val() });
            calculateSummFoodAmt();
            $('#expensesTable  tbody').append('<tr id="' + lineId + '"><td>Food</td><td>' + $("#foodexpensedate").val() + '</td><td>' + $('#restaurantname').val() + '</td><td class="curr">' + $("#foodtotalamount").val() + '</td><td class="text-center text-info"><a href="#" onclick="javascript:editvalues(\'' + lineId + '\')"><i class="fa fa-pencil-square-o"></i></a>&nbsp;&nbsp;  </tr>');
            break;
        case 'Others':
            claimJSON.Others.push({ "id": newId, "otherdesc": $("#otherdesc").val(), "otherexpensedate": $("#otherexpensedate").val(), "otherexpenseremarks": $("#otherexpenseremarks").val(), "otherexpenseamt": $("#otherexpenseamt").val() });
            calculateSummOthersAmt();
            $('#expensesTable  tbody').append('<tr id="' + lineId + '"><td>Others</td><td>' + $("#otherexpensedate").val() + '</td><td>' + $('#otherdesc').val() + '</td><td class="curr">' + $("#otherexpenseamt").val() + '</td><td class="text-center text-info"><a href="#" onclick="javascript:editvalues(\'' + lineId + '\')"><i class="fa fa-pencil-square-o"></i></a>&nbsp;&nbsp;  </tr>');
            break;
    }

    calculateTotalAmt();
            
    Command: toastr["success"](" ", "Expense Added Succesfully")
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-bottom-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
}
    
function editvalues(valId) {
            
    var expenseType = valId.split('_')[0];
    var editId = valId.split('_')[1];
    var len,i,foundId;
    
    switch (expenseType) {
        case 'Travel':
            len =  claimJSON.Travels.length;
            for (i=0;i<len;i++) {
                if(claimJSON.Travels[i].id == editId) {
                    
                    intTravelNo = i;
                    travelLineId = valId;

                    $('#travelpurpose').val(claimJSON.Travels[i].purpose); 
                    $("#traveldate").val(claimJSON.Travels[i].traveldate); 
                    $('input[name="modeoftravel"][value="' + claimJSON.Travels[i].modeoftravel + '"]').prop('checked', true);
                    $("#travelfrom").val(claimJSON.Travels[i].from); 
                    $("#travelto").val(claimJSON.Travels[i].to); 
                    $("#traveldistance").val(claimJSON.Travels[i].distance); 
                    $("#travelrate").val(claimJSON.Travels[i].rate); 
                    $("#travelremarks").val(claimJSON.Travels[i].remarks); 
                    $("#travelamount").val(claimJSON.Travels[i].totalamount);
                }
            }
            activateTab('tabTravel');
            break;
        case 'Hotel':
            len =  claimJSON.Hotels.length;
            for (i=0;i<len;i++) {
                if(claimJSON.Hotels[i].id == editId) {
                    intHotelNo = i;
                    hotelLineId = valId;
                    
                    $("#hotelname").val(claimJSON.Hotels[i].hotelname); 
                    $("#stayfromdate").val(claimJSON.Hotels[i].stayfromdate); 
                    $("#staytodate").val(claimJSON.Hotels[i].staytodate);
                    $("#noofnights").val(claimJSON.Hotels[i].noofnights); 
                    $("#hotelrate").val(claimJSON.Hotels[i].rate);
                    $("#hotelremarks").val(claimJSON.Hotels[i].remarks);
                    $("#hotelamount").val(claimJSON.Hotels[i].totalamount); 
                }
            }
            activateTab('tabHotel');
            break;
        case 'Food':
            len =  claimJSON.Food.length;
            for (i=0;i<len;i++) {
                if(claimJSON.Food[i].id == editId) {
                    intFoodNo = i;
                    foodLineId = valId;

                    $("#restaurantname").val(claimJSON.Food[i].restaurantname); 
                    $("#foodexpensedate").val(claimJSON.Food[i].expensedate); 
                    $("#foodnoofpersons").val(claimJSON.Food[i].noofpersons);
                    $("#foodremarks").val(claimJSON.Food[i].remarks);
                    $("#foodtotalamount").val(claimJSON.Food[i].totalamount); 
                }
            }
            activateTab('tabFood');
            break;
        case 'Others':
            
            len =  claimJSON.Others.length;
            for (i=0;i<len;i++) {
                if(claimJSON.Others[i].id == editId) {
                    intOthersNo = i;
                    othersLineId = valId;

                    $("#otherdesc").val(claimJSON.Others[i].otherdesc);
                    $("#otherexpensedate").val(claimJSON.Others[i].otherexpensedate);
                    $("#otherexpenseremarks").val(claimJSON.Others[i].otherexpenseremarks);
                    $("#otherexpenseamt").val(claimJSON.Others[i].otherexpenseamt);
                }
            }
            activateTab('tabOthers');
            break;
    }
}

</script>

</asp:Content>
