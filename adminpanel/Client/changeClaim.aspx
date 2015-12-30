<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Client/ClientManager.Master" Title="Process Claim" CodeBehind="changeClaim.aspx.cs" Inherits="adminpanel.Client.viewClaim" %>

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
</style>

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>View Claim</h2>
        </div>
        <div class="col-lg-2">
        </div>
    </div>

    <br />

    <div class="col-lg-12 col-sm-12 col-md-12">
        <div class="tabs-container">
                    <div class="tabs-top">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#tabSummary">Summary</a></li>
                            <li><a data-toggle="tab" href="#tabTravel">Travel</a></li>
                            <li><a data-toggle="tab" href="#tabHotel">Hotel</a></li>
                            <li><a data-toggle="tab" href="#tabFood">Food</a></li>
                            <li><a data-toggle="tab" href="#tabOthers">Others</a></li>
                            <li><a data-toggle="tab" onclick="populateClaimLog()" href="#tabLog">Action Log</a></li>

                        </ul>
                        <div class="tab-content ">

                            <div id="tabSummary" class="tab-pane active">
                                <div class="panel-body">
                                    <div class="row">

                                        <div class="col-lg-8 col-sm-8 col-md-8">

                                            <form id="summaryForm" method="get" class="form-horizontal">

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">Claim No.</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" disabled="disabled" id="claimNo"  class="form-control" />
                                                    </div>
                                                </div>

                                                <div class="hr-line-dashed"></div>
                                                
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">Name</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" disabled="disabled" id="empName"  class="form-control" />
                                                    </div>
                                              
                                                    <label class="col-sm-2 control-label">Emp Num</label>
                                                    <div class="col-sm-4">
                                                        <input type="text" disabled="disabled"  id="empNum" class="form-control" />
                                                    </div>
                                                </div>

                                                <div class="hr-line-dashed"></div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">Purpose</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" disabled="disabled" id="claimPurpose" class="form-control" />
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
                                                        <input type="text" readonly  class="form-control" value="Create" />
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-lg-4 col-sm-4 col-md-4">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 50%">Expense</th>
                                                        <th style="width: 25%">Claim ( &#x20B9 )</th>
                                                        <th style="width: 25%">Approved ( &#x20B9 )</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Travel</td>
                                                        <td class="curr" id="sumTravelAmt">0.00</td>
                                                        <td  ><input style="width:60px;border:hidden"  id="sumTravelAmtA" readonly onchange="updateSummVal()" onclick="this.select();" type="number" /></td>

                                                    </tr>
                                                    <tr>
                                                        <td>Hotel</td>
                                                        <td class="curr" id="sumHotelAmt">0.00</td>
                                                        <td  ><input style="width:60px;border:hidden" id="sumHotelAmtA"  readonly  onchange="updateSummVal()"  onclick="this.select();" type="number" /></td>


                                                    </tr>
                                                    <tr>
                                                        <td>Food</td>
                                                        <td class="curr" id="sumFoodAmt">0.00</td>
                                                        <td  ><input style="width:60px;border:hidden" id="sumFoodAmtA"  readonly  onchange="updateSummVal()"  onclick="this.select();" type="number" /></td>
                                                    </tr>

                                                    <tr>
                                                        <td>Others</td>
                                                        <td class="curr" id="summOthAmt">0.00</td>
                                                        <td  ><input style="width:60px;border:hidden" id="summOthAmtA"  readonly  onchange="updateSummVal()" onclick="this.select();" type="number" /></td>

                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr style="background-color: lightgray">
                                                        <td><b>Total Approved ( &#x20B9 )</b></td>
                                                        <td colspan="2" class="curr"><b id="summTotAmt">0.00</b></td>

                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>

                                    </div>

                                                <div style="margin-top:0px" class="hr-line-dashed"></div>
                                   

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <table id="expensesTable" class=" table table-stripped table-bordered table-hover table-condensed">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%;">Type </th>
                                                        <th style="width: 15%;">Date </th>
                                                        <th style="width: 50%">Notes</th>
                                                        <th style="width: 10%" class="curr">Claimed ( &#x20B9 )</th>
                                                        <th style="width: 10%" class="curr">Approved ( &#x20B9 )</th>
                                                        <th style="width: 5%">View</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row text-center">
                                    <input type="button" onclick="saveClaimChanges('A')" value="Approve" id="btnApprove" class="btn btn-info" />
                                    <input type="button" onclick="saveClaimChanges('R')" value="Reject" id="btnReject"  class="btn btn-danger" />
            
                                                                </div>
                                </div>
                            </div>

                            <div id="tabTravel" class="tab-pane">
                                <div class="panel-body">

                                    <form id="travelForm" method="get" class="form-horizontal">

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Travel Purpose</label>
                                            <div class="col-sm-10">
                                                <input type="text" disabled="disabled" id="travelpurpose" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Travel Date</label>

                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                    <input type="date" disabled="disabled" id="traveldate" class="form-control" />
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Mode of Travel</label>
                                            <div class="col-sm-4">
                                                <label class="checkbox-inline">
                                                    <input type="radio" disabled="disabled" name="modeoftravel" value="Auto" id="inlineCheckbox1" />
                                                    Auto
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="radio" disabled="disabled" value="Train" name="modeoftravel" id="inlineCheckbox2" />
                                                    Train
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="radio" disabled="disabled" value="Bus" name="modeoftravel" id="inlineCheckbox3" />
                                                    Bus
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="radio" disabled="disabled" value="Bike" name="modeoftravel" id="inlineCheckbox4" />
                                                    Bike
                                                </label>
                                            </div>

                                        </div>
                                        <div class="hr-line-dashed"></div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">From</label>
                                            <div class="col-sm-4">
                                                <input type="text" disabled="disabled" id="travelfrom" class="form-control" />


                                            </div>
                                            <label class="col-sm-2 control-label">To</label>
                                            <div class="col-sm-4">
                                                <input type="text" disabled="disabled" id="travelto" class="form-control" />
                                            </div>
                                        </div>

                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Distance</label>

                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <input type="text" disabled="disabled" id="traveldistance" class="form-control" /><span class="input-group-addon">Kms</span>
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
                                                <input type="text" disabled="disabled" id="travelremarks" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Total Amount</label>

                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <span class="input-group-addon">&#x20B9</span>
                                                    <input type="number" disabled="disabled" id="travelamount" class="form-control" />
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </form>

                                </div>
                            </div>

                            <div id="tabHotel" class="tab-pane">
                                <div class="panel-body">

                                    <form id="hotelForm" method="get" class="form-horizontal">

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Hotel Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" disabled="disabled" id="hotelname" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Stay From Date</label>

                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                    <input type="date" disabled="disabled" id="stayfromdate" class="form-control" />
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Stay To Date</label>

                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                    <input type="date" disabled="disabled" id="staytodate" class="form-control" />
                                                </div>
                                            </div>

                                        </div>
                                        <div class="hr-line-dashed"></div>


                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">No. of Nights</label>

                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <input type="number" id="noofnights" disabled="disabled" class="form-control" /><span class="input-group-addon">Nights</span>
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Rate</label>

                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <span class="input-group-addon">&#x20B9</span>
                                                    <input type="number" id="hotelrate" disabled="disabled" class="form-control" />
                                                    <span class="input-group-addon">per night</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Remarks</label>
                                            <div class="col-sm-10">
                                                <input type="text" disabled="disabled" id="hotelremarks" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Total Amount</label>

                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <span class="input-group-addon">&#x20B9</span>
                                                    <input type="number" disabled="disabled"  id="hotelamount" class="form-control" />
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </form>

                                </div>
                            </div>

                            <div id="tabFood" class="tab-pane">
                                <div class="panel-body">

                                    <form id="foodForm" method="get" class="form-horizontal">

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Restaurant Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" disabled="disabled" id="restaurantname" class="form-control" />
                                            </div>
                                        </div>

                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Expense Date</label>

                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                    <input type="date" disabled="disabled" id="foodexpensedate" class="form-control" />
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">No. of Persons</label>

                                            <div class="col-sm-4">
                                                <input type="text" disabled="disabled" id="foodnoofpersons" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Remarks</label>
                                            <div class="col-sm-10">
                                                <input type="text" disabled="disabled" id="foodremarks" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Total Amount</label>

                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <span class="input-group-addon">&#x20B9</span>
                                                    <input type="number" disabled="disabled" id="foodtotalamount" class="form-control" />
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div id="tabOthers" class="tab-pane">
                                <div class="panel-body">
                                    <form id="othersForm" method="get" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Expense Description</label>
                                            <div class="col-sm-10">
                                                <input type="text" disabled="disabled" id="otherdesc" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Expense Date</label>
                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                    <input type="date" disabled="disabled" id="otherexpensedate" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Remarks</label>
                                            <div class="col-sm-10">
                                                <input type="text" disabled="disabled" id="otherexpenseremarks" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Total Amount</label>

                                            <div class="col-sm-4">
                                                <div class="input-group m-b">
                                                    <span class="input-group-addon">&#x20B9</span>
                                                    <input type="number" disabled="disabled" id="otherexpenseamt" class="form-control" />
                                                </div>
                                            </div>
                                           
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div id="tabLog" class="tab-pane">
                                <div class="panel-body">
                                   <table id="claimLogTable" class="table table-bordered table-condensed table-hover">
                                       <thead>
                                           <tr>
                                               <th style="width:5%">#</th>
                                               <th style="width:10%">Claim Status</th>
                                               <th style="width:20%">Date</th>
                                               <th style="width:50%">Remarks</th>
                                               <th style="width:20%">Action By</th>
                                           </tr>
                                       </thead>
                                       <tbody></tbody>
                                   </table>
                                </div>
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
                        <div class="row">
              



                            <div class="form-group" id="appAmountDiv">
                                <label class="col-sm-4 control-label">Total Approved Amount</label>

                                <div class="col-sm-8">
                                    <div class="input-group m-b">
                                        <span class="input-group-addon">&#x20B9</span>
                                        <input type="number" readonly id="totalApprovedAmt" class="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Remarks</label>

                                <div class="col-sm-8">
                                        <textarea rows="5" id="claimRemarks" class="form-control" ></textarea>
                                </div>
                            </div>

                        </div>
                        <br />
                        <div class="row">

                            <div class="form-group" style="margin-top: 4px">
                                <label class="col-sm-4 control-label"></label>
                                                       
                                <div class="col-sm-8">
                                    <input type="submit" class="btn btn-success" onclick="saveClaim()" value="Save" style="margin-right: 4px"  />
                                    <input type="button" data-dismiss="modal" class="btn btn-danger" value="Cancel" />

                                </div>
                                </div>
                                </div>

                       
                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="javascriptPart" runat="server">

    <script>

        var claimJSON, cliamNum;
        var fullJSONText;
        var logPopulated = false;

        //


        function populateClaimLog()
        {

            if (!logPopulated) {
            $.ajax({
                url: "../api/getClaimLog/" + window.localStorage.getItem("cliamId"),
            }).done(function (claimLog) {
                logPopulated = true;
                var i;
                for (i = 0; i < claimLog.length; i++) {

                    var rowString = '<tr>';
                    rowString += '<td align="center">' + (i + 1) + '</td>';
                    rowString += '<td>' + claimLog[i].Claim_Status + '</td>';
                    rowString += '<td>' + claimLog[i].Date + '</td>';
                    rowString += '<td>' + claimLog[i].Remarks + '</td>';
                    rowString += '<td>' + claimLog[i].Action_By + '</td>';
                    rowString += '</tr>';

                    $('#claimLogTable tbody').append(rowString);
                }

                });
            }
        }

        var originalClaimText;
        var claimResponse;
        var manager2Exists = false;
        var manager2Info, orgEmpInfo, gEmpDetails;

        $(document).ready(function () {
            
            
            $.ajax({
                url: "../api/claimJSONs/" + window.localStorage.getItem("cliamId"),
            }).done(function (result) {
                originalClaimText = result.claimText;

                claimJSON = JSON.parse(originalClaimText);

                $("#sumTravelAmt").html(claimJSON.travelExpense);
                $("#sumTravelAmtA").val(claimJSON.travelExpense);

                $("#sumFoodAmt").html(claimJSON.foodExpense);
                $("#sumFoodAmtA").val(claimJSON.foodExpense);

                $("#summOthAmt").html(claimJSON.otherExpense);
                $("#summOthAmtA").val(claimJSON.otherExpense);

                $("#sumHotelAmt").html(claimJSON.hotelExpense);
                $("#sumHotelAmtA").val(claimJSON.hotelExpense);

                $("#summTotAmt").html(claimJSON.totalExpense);

                $("#claimPurpose").val(result.claimPurpose);

                $("#claimDate").val(result.claimDate.substring(0, 10));
                $("#claimNo").val(result.claimNo);

                cliamNum = result.claimNo;

                $.ajax({
                    url: "../api/getDivIncharge/" + result.EmpId,
                }).done(function (manager2) {
                
                    if(manager2.length > 0) {
                        manager2Exists = true;
                        manager2Info = manager2;
                    }
                });

                $.ajax({
                    url: '../api/getOrgEmployeeDetails/' + result.EmpId,
                    success: function (data) {
                        orgEmpInfo = data;
                    }
                });
                
                $.ajax({
                    url: "../GetEmpDetail/of/" + result.EmpId,
                }).done(function (empDetails) {
                    gEmpDetails = empDetails; 
                    $("#empName").val(empDetails.employee[0].EmpName);
                    $("#empNum").val(empDetails.employee[0].EmpNum);

                });

                var i = 0;

                for (i = 0; i < claimJSON.Travels.length; i++) {
                    var lineId = 'Travel_' + i;
                    $('#expensesTable  tbody').append('<tr><td>Travel</td><td>' + claimJSON.Travels[i].traveldate + '</td><td>' + claimJSON.Travels[i].purpose + '</td><td class="curr">' + claimJSON.Travels[i].totalamount + '</td><td><input style="width:100px"  onchange="updateTotals(\'Travel\')"  type="number" id="travel' + i + '" value="' + claimJSON.Travels[i].totalamount + '" /></td><td class="text-center text-info"><a href="#" onclick="viewvalues(\'' + lineId + '\')"><i class="fa fa-eye"></i></a></tr>');
                }

                for (i = 0; i < claimJSON.Hotels.length; i++) {
                    var lineId = 'Hotel_' + i;
                    $('#expensesTable  tbody').append('<tr><td>Hotel</td><td>' + claimJSON.Hotels[i].staytodate + '</td><td>' + claimJSON.Hotels[i].hotelname + '</td><td class="curr">' + claimJSON.Hotels[i].totalamount + '</td><td><input style="width:100px" type="number"  onchange="updateTotals(\'Hotel\')"  id="hotel' + i + '"  value="' + claimJSON.Hotels[i].totalamount + '" /></td><td class="text-center text-info"><a href="#" onclick="viewvalues(\'' + lineId + '\')"><i class="fa fa-eye"></i></a></tr>');
                }

                for (i = 0; i < claimJSON.Food.length; i++) {
                    var lineId = 'Food_' + i;
                    $('#expensesTable  tbody').append('<tr><td>Food</td><td>' + claimJSON.Food[i].expensedate + '</td><td>' + claimJSON.Food[i].restaurantname + '</td><td class="curr">' + claimJSON.Food[i].totalamount + '</td><td><input style="width:100px"  onchange="updateTotals(\'Food\')"  type="number" id="food' + i + '"  value="' + claimJSON.Food[i].totalamount + '" /></td><td class="text-center text-info"><a href="#" onclick="viewvalues(\'' + lineId + '\')"><i class="fa fa-eye"></i></a></tr>');
                }

                for (i = 0; i < claimJSON.Others.length; i++) {
                    var lineId = 'Others_' + i;
                    $('#expensesTable  tbody').append('<tr><td>Others</td><td>' + claimJSON.Others[i].otherexpensedate + '</td><td>' + claimJSON.Others[i].otherdesc + '</td><td class="curr">' + claimJSON.Others[i].otherexpenseamt + '</td><td><input style="width:100px" onchange="updateTotals(\'Others\')"  type="number" id="other' + i + '"  value="' + claimJSON.Others[i].otherexpenseamt + '" /></td><td class="text-center text-info"><a href="#" onclick="viewvalues(\'' + lineId + '\')"><i class="fa fa-eye"></i></a></tr>');
                }

                addApprovalItems();

            });
        });

        function saveClaim() {

            if($("#claimRemarks").val() === "") {
                alert("Please enter remarks");
                return false;
            }

            var claimUploadJson = {
                "claimId": window.localStorage.getItem("cliamId"),
                "actionBy": <%= Session["EmpId"] %>,
                "claimStatus": -1,
                "revisionText": "",
                "revisionRemarks": $("#claimRemarks").val(),
                "claimText": ""
            };

            if (claimResponse == 'A') {

                var submittedClaim = JSON.parse(originalClaimText);

                
                if (manager2Exists) {
                    claimUploadJson.claimStatus = 2;
                }
                else
                {
                    claimUploadJson.claimStatus = 3;
                }
                     

                if (claimJSON.totalExpenseA != submittedClaim.totalExpense) {

                    claimUploadJson.revisionText = originalClaimText;
                    claimUploadJson.claimText = JSON.stringify(claimJSON);
                }
            }
            else if (claimResponse == 'R') {
                claimUploadJson.claimStatus = 4;
            }

            $.ajax({
                url: '../api/ClaimUpdate',
                type: 'post',
                dataType: 'json',
                data: claimUploadJson,
                success: function (data) {
                    $('#btnApprove').hide();
                    $('#btnReject').hide();
                    alert('Claim Succesfully Updated');
                    $('#myModal').modal('hide');

                    //Mail to Employee if claim is rejected

                    if (claimResponse == 'R'){
                    var emailJSON = {

                        "toEmailAddress":gEmpDetails.employee[0].Email,
                        "ccEmailAddress":orgEmpInfo[0].Email,
                        "mailSubject": "Claim (" + cliamNum  + ") has been Rejected!!",
                        "mailBody":'<html><body>Dear ' +  gEmpDetails.employee[0].EmpName +' ,<br /> <br /> Your claim no. '+ cliamNum + ' is rejected. Please login to <a href="http://ubiety.geniehr.com">Ubiety</a> to view further details. <br /><br />Thank You.<br /><br />For,<br/>Team GenieHR Solutions Pvt. Ltd.<br/><br/>Please Note: This is a system generated email and is not monitored. Please don’t reply to this email.</body></html>'
                    }
                    
                    $.ajax({
                        type: "post",
                        url: '../sendmail',
                        data: JSON.stringify(emailJSON),
                        contentType: 'application/json',
                        dataType: "json"
                    });
                    }
                    
                    // Mail to Second Level Manager if exists

                    if (manager2Exists && claimResponse == 'A') {

                    var emailJSON = {

                        "toEmailAddress":manager2Info[0].Email,
                        "ccEmailAddress":orgEmpInfo[0].Email,
                        "mailSubject": "Claim (" + cliamNum  + ") from " + gEmpDetails.employee[0].EmpName,
                        "mailBody":'<html><body>Dear ' +  manager2Info[0].EmpName +' ,<br /> <br />' + gEmpDetails.employee[0].EmpName + ' claim no. '+ cliamNum + ' requires your action. Please login to <a href="http://ubiety.geniehr.com">Ubiety</a> to view the claim and approve / reject for further processing.<br /><br />Thank You.<br /><br />For,<br/>Team GenieHR Solutions Pvt. Ltd.<br/><br/>Please Note: This is a system generated email and is not monitored. Please don’t reply to this email.</body></html>'
                    }
                    
                    $.ajax({
                        type: "post",
                        url: '../sendmail',
                        data: JSON.stringify(emailJSON),
                        contentType: 'application/json',
                        dataType: "json"
                    });
                }

                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }

        function saveClaimChanges(actionTaken) {
            claimResponse = actionTaken;

            if (actionTaken == 'A') {
                $("#appAmountDiv").show();
                addApprovalItems();
                $("#totalApprovedAmt").val(claimJSON.totalExpenseA);
            
            }

            else if(actionTaken == 'R') {
                $("#appAmountDiv").hide();
                $("#claimRemarks").val('');
            }

            $('#myModal').modal({
                backdrop: 'static',
                keyboard: false
            });

            $('#myModal').modal();
        }

        function updateSummVal() {
            $("#summTotAmt").html(parseInt($("#sumTravelAmtA").val()) + parseInt($("#sumFoodAmtA").val()) + parseInt($("#sumHotelAmtA").val()) + parseInt($("#summOthAmtA").val()));
        }

        function addApprovalItems() {

            claimJSON.travelExpenseA = $("#sumTravelAmtA").val();
            claimJSON.foodExpenseA = $("#sumFoodAmtA").val();
            claimJSON.otherExpenseA = $("#summOthAmtA").val();
            claimJSON.hotelExpenseA = $("#sumHotelAmtA").val();
            claimJSON.totalExpenseA = $("#summTotAmt").html();

            for (i = 0; i < claimJSON.Travels.length; i++) {
                claimJSON.Travels[i].approvedAmt = $("#travel" + i).val();
            }

            for (i = 0; i < claimJSON.Hotels.length; i++) {
                claimJSON.Hotels[i].approvedAmt = $("#hotel" + i).val();
            }

            for (i = 0; i < claimJSON.Food.length; i++) {
                claimJSON.Food[i].approvedAmt = $("#food" + i).val();
            }

            for (i = 0; i < claimJSON.Others.length; i++) {
                claimJSON.Others[i].approvedAmt = $("#other" + i).val();
            }

        }

        function updateTotals(expenseType)
        {
            var approvedAmt = 0;

            switch (expenseType) {

                case 'Travel':
                    for (i = 0; i < claimJSON.Travels.length; i++) {
                        approvedAmt += parseInt($("#travel" + i).val());
                    }

                    $("#sumTravelAmtA").val(approvedAmt);
                    break;

                case 'Hotel':
                    for (i = 0; i < claimJSON.Hotels.length; i++) {
                        approvedAmt += parseInt($("#hotel" + i).val());
                    }

                    $("#sumHotelAmtA").val(approvedAmt);
                    break;

                case 'Food':
                    for (i = 0; i < claimJSON.Food.length; i++) {
                        approvedAmt += parseInt($("#food" + i).val());
                    }

                    $("#sumFoodAmtA").val(approvedAmt);
                    break;

                case 'Others':
                    for (i = 0; i < claimJSON.Others.length; i++) {
                        approvedAmt += parseInt($("#other" + i).val());
                    }

                    $("#summOthAmtA").val(approvedAmt);
                    break;
            }

            updateSummVal();
        }

        function viewvalues(valId) {

            var expenseType = valId.split('_')[0];
            var editId = valId.split('_')[1];

            switch (expenseType) {
                case 'Travel':
                    $('#travelpurpose').val(claimJSON.Travels[editId].purpose);
                    $("#traveldate").val(claimJSON.Travels[editId].traveldate);
                    $('input[name="modeoftravel"][value="' + claimJSON.Travels[editId].modeoftravel + '"]').prop('checked', true);
                    $("#travelfrom").val(claimJSON.Travels[editId].from);
                    $("#travelto").val(claimJSON.Travels[editId].to);
                    $("#traveldistance").val(claimJSON.Travels[editId].distance);
                    $("#travelrate").val(claimJSON.Travels[editId].rate);
                    $("#travelremarks").val(claimJSON.Travels[editId].remarks);
                    $("#travelamount").val(claimJSON.Travels[editId].totalamount);
                    activateTab('tabTravel');
                    break;

                case 'Hotel':
                    $("#hotelname").val(claimJSON.Hotels[editId].hotelname);
                    $("#stayfromdate").val(claimJSON.Hotels[editId].stayfromdate);
                    $("#staytodate").val(claimJSON.Hotels[editId].staytodate);
                    $("#noofnights").val(claimJSON.Hotels[editId].noofnights);
                    $("#hotelrate").val(claimJSON.Hotels[editId].rate);
                    $("#hotelremarks").val(claimJSON.Hotels[editId].remarks);
                    $("#hotelamount").val(claimJSON.Hotels[editId].totalamount);
                    activateTab('tabHotel');
                    break;

                case 'Food':
                    $("#restaurantname").val(claimJSON.Food[editId].restaurantname);
                    $("#foodexpensedate").val(claimJSON.Food[editId].expensedate);
                    $("#foodnoofpersons").val(claimJSON.Food[editId].noofpersons);
                    $("#foodremarks").val(claimJSON.Food[editId].remarks);
                    $("#foodtotalamount").val(claimJSON.Food[editId].totalamount);
                    activateTab('tabFood');
                    break;

                case 'Others':

                    $("#otherdesc").val(claimJSON.Others[editId].otherdesc);
                    $("#otherexpensedate").val(claimJSON.Others[editId].otherexpensedate);
                    $("#otherexpenseremarks").val(claimJSON.Others[editId].otherexpenseremarks);
                    $("#otherexpenseamt").val(claimJSON.Others[editId].otherexpenseamt);
                    activateTab('tabOthers');
                    break;
            }
        }

        function activateTab(tab) {
            $('.nav-tabs a[href="#' + tab + '"]').tab('show');
        }

    </script>

</asp:Content>