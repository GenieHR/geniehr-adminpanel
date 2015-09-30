<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddClaim.aspx.cs" MasterPageFile="~/UbietyMenu.Master" Inherits="Admin.AddClaim" Title="Add Claim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" Runat="Server">
<script src="js/plugins/date/date.js"></script>
<script src="js/plugins/date/time.js"></script>
    <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h1>Create New Claim</h1>
                <%--<ol class="breadcrumb">
                    <li>
                       <h5>GenieHR Solutions Pvt. Ltd.</h5>
                    </li>
                </ol>--%>
            </div>
            
        </div>

    <br />
    <div class="ibox-content">
                            <form method="post" id="formoid" class="m-t form-horizontal" role="form">
                                
                                <div class="form-group">
                                    <div class="col-sm-2"><label class="control-label">Claim Purpose</label></div>
                                    <div class="col-sm-9"><input type="text" placeholder="Enter Claim Purpose" id="claimTitle" name="claimTitle" class="text-box form-control inline"/></div>
                                    <div class="col-sm-1"><button type="button" class="btn btn-success btn-outline inline" onclick="initiateClaim()">Ok</button></div>
                                </div>

                                <div id="hrLineUp" style="display:none" class="hr-line-dashed"></div>

                                <div id="cliamTypeButtonDiv" style="display:none" class="form-group "> 

                                    <div class="col-sm-2"><label class="control-label">Add new expense</label></div>
                                    <div class="col-sm-10">
                                    <button type="button" class="btn btn-success btn-outline" data-toggle="modal" data-target="#travelModal"> Travel</button>
                                    <button type="button" class="btn btn-success btn-outline" data-toggle="modal" data-target="#hotelModal"> Hotel</button>
                                    <button type="button" class="btn btn-success btn-outline" > Food</button></div>
                                </div>

                                <div class="hr-line-dashed" style="display:none" id="hrLineDown" ></div>

                            </form>
        </div>
    
    <div id="claimLinesDiv" style="display:none">
    <div class="ibox-content">
        <div class="row" id="claimLinesRow">
        
    </div>
    </div>
    </div>

    <script src="js/plugins/daterangepicker/daterangepicker.js"></script>

    <div class="modal inmodal" id="travelModal" tabindex="-1" role="dialog"  aria-hidden="true">

                                    <div class="modal-dialog">
                                    <div class="modal-content animated fadeIn">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">Add Travel Expense</h4>
                                            <small>Add a new local or outstation travel expense</small>
                                        </div>
                                        <div class="modal-body">
                                            <form method="post"  class="m-t form-horizontal" id="travelForm" role="form">
                                <div class="form-group">
                                    <div class="col-sm-2"><label class="control-label"> Purpose</label></div>
                                    <div class="col-sm-10"><input type="text"  id="travelPurpose" name="travelPurpose" class="input-sm form-control"/></div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2"><label class="control-label"> Date</label></div>
                                    <div class="col-sm-10"><input type="date"  id="travelDate" name="travelDate" class="input-sm form-control"/></div>
                                </div>

                                                <div class="form-group ">
                                                    <div class="col-sm-2"><label class="control-label"> Mode</label></div>
                                                    <div class="col-sm-10">
                                        <div class="i-checks inline"><label> <input type="radio"  value="A" name="a" checked=""/> <i></i> Auto </label></div>&nbsp;&nbsp;
                                        <div class="i-checks inline"><label> <input type="radio"  value="B"  name="a"/> <i></i> Bus </label></div> &nbsp;&nbsp;
                                        <div class="i-checks inline"><label> <input type="radio"  value="T"  name="a"/> <i></i> Train </label></div>&nbsp;&nbsp;
                                        <div class="i-checks inline"><label> <input type="radio"  value="X"  name="a"/> <i></i> Taxi </label></div>&nbsp;&nbsp;
                                                    </div>
                                                </div>
                                                
                                                
                                            <div class="form-group" id="data_6">
                                                <div class="col-sm-2">
                                <label class="control-label">Travel</label></div>
                                                <div class="col-sm-10">
                                <div class="input-daterange input-group" >
                                    <span class="input-group-addon">From</span>

                                    <input type="text" class="input-sm form-control" id="travelFrom" name="travelFrom" />
                                    <span class="input-group-addon">To</span>
                                    <input type="text" class="input-sm form-control"  id="travelTo" name="travelTo"  />
                                </div>
                                                    </div>
                            </div>
                                                <div class="form-group">
                                    <div class="col-sm-2"><label class="control-label">Distance(km)</label></div>
                                    <div class="col-sm-10"><input type="number"  id="travelDistance" name="travelDistance" class="input-sm form-control"/></div>

                                </div>
                                                <div class="form-group">
                                    <div class="col-sm-2"><label class="control-label">Rate / km</label></div>
                                    <div class="col-sm-10"><input type="number"  id="rate" name="rate" class="input-sm form-control"/></div>

                                </div>
                                                <div class="form-group">
                                    <div class="col-sm-2"><label class="control-label">Amount</label></div>
                                    <div class="col-sm-10"><input type="number"  id="Amount" name="Amount" class="input-sm form-control"/></div>
                                </div>
                                                </form>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-info" onclick="addTravelExpense()">Add</button>
                                        </div>
                                       
                                    </div>
                                </div>
                            </div>

    <div class="modal inmodal" id="hotelModal" tabindex="-1" role="dialog"  aria-hidden="true">

                                    <div class="modal-dialog">
                                    <div class="modal-content animated fadeIn">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">Add Hotel Expense</h4>
                                            <small>Add a new outstation hotel expense</small>
                                        </div>
                                        <div class="modal-body">

                                            <form method="post"  class="m-t form-horizontal" id="hotelForm" role="form">

                                <div class="form-group">
                                    <div class="col-sm-2"><label class="control-label"> Hotel</label></div>
                                    <div class="col-sm-10"><input type="text"  id="hotelName" name="hotelName" class="input-sm form-control"/></div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-2"><label class="control-label"> Bill Date</label></div>
                                    <div class="col-sm-10"><input type="date"  id="billDate" name="billDate" class="input-sm form-control"/></div>
                                </div>

                                       <div class="form-group" id="dates_6">
                                                <div class="col-sm-2">
                                <label class="control-label">Dates</label></div>
                                                <div class="col-sm-10">
                                <div class="input-daterange input-group" >
                                    <span class="input-group-addon">From</span>

                                    <input type="date" class="input-sm form-control" id="stayFrom" name="stayFrom" />
                                    <span class="input-group-addon">To</span>
                                    <input type="date" class="input-sm form-control"  id="stayTo" name="stayTo"  />
                                </div>
                                                    </div>
                            </div>

                                                <div class="form-group">
                                    <div class="col-sm-2"><label class="control-label">Total Nights</label></div>
                                    <div class="col-sm-10"><input type="number"  id="noOfNights" name="noOfNights" class="input-sm form-control"/></div>

                                </div>
                                                <div class="form-group">
                                    <div class="col-sm-2"><label class="control-label">Rate/Night</label></div>
                                    <div class="col-sm-10"><input type="number"  id="ratePerNight" name="ratePerNight" class="input-sm form-control"/></div>

                                </div>
                                                <div class="form-group">
                                    <div class="col-sm-2"><label class="control-label">Amount</label></div>
                                    <div class="col-sm-10"><input type="number"  id="hotelAmount" name="hotelAmount" class="input-sm form-control"/></div>
                                </div>
                                                </form>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-info" onclick="addHotelExpense()">Add</button>
                                        </div>
                                       
                                    </div>
                                </div>
                            </div>

    <script src="js/plugins/toastr/toastr.min.js"></script>
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet"/>

        


        <script>
        
        $(document).ready(function () {
            
        });


        var claimJsonLines = [];

        var claimJsonHead = jQuery.parseJSON('{"ClaimHead":[{"EmpId":0,"ClaimNumber":"","ClaimTitle":"","Status":1}]}');
         claimJsonLines[0] = jQuery.parseJSON('{"ClaimLines":[{"ClaimLineId":1,"ClaimType":1,"Purpose":"","LocOut":0,"HotelName":"","ExpenseDate":"","FromDate":null,"ToDate":null,"AccNoOfNights":null,"TravelFromPlace":"","TravelToPlace":"","TravelMode":"","Distance":null,"Rate":null,"OtherClaimTypeDesc":null,"TotalAmount":0,"BillType":null,"LineStatus":1,"EmpRemarks":"","ManagerRemarks":null,"OrgRemarks":null,"ClaimStatu":null}]}');
        
         function addHotelExpense() {
             //$('#hotelModal').modal('toggle');
             //var index = claimJsonLines.length-1;

             var stayFrom = Date.parse($('#stayFrom').val());
             var stayTo = Date.parse($('#stayTo').val());

             if (stayTo.compareTo(stayFrom) == 1)
             {
                 diff = new TimeSpan(stayTo - stayFrom);
                 $('#noOfNights').val(diff.days);
             }
             else
             {
                 toastr.error('', 'Stay From cannot be earlier than Stay To!')
                 return false;
             }
         }

        function addTravelExpense() {

            $('#travelModal').modal('toggle');

            var index = claimJsonLines.length-1;
            
            claimJsonLines[index].ClaimLines[0].HotelName = $('#travelPurpose').val();
            claimJsonLines[index].ClaimLines[0].TravelMode = $('input[name=a]:checked', '#travelForm').val();
            claimJsonLines[index].ClaimLines[0].ExpenseDate = $('#travelDate').val();
            claimJsonLines[index].ClaimLines[0].TravelFromPlace = $('#travelFrom').val();
            claimJsonLines[index].ClaimLines[0].TravelToPlace = $('#travelTo').val();
            claimJsonLines[index].ClaimLines[0].Distance = $('#travelDistance').val();
            claimJsonLines[index].ClaimLines[0].Rate = $('#rate').val();

            $('#Amount').val($('#travelDistance').val() * $('#rate').val())

            claimJsonLines[0].ClaimLines[0].TotalAmount = $('#Amount').val();
            
            var travelMode = "";

            switch(claimJsonLines[0].ClaimLines[0].TravelMode) {
                case 'X':
                    travelMode = 'Taxi';
                    break;
                case 'A':
                    travelMode = 'Auto';
                    break;
                case 'B':
                    travelMode = 'Bus';
                    break;
                case 'T':
                    travelMode = 'Train';
                    break;
            }            

            $('form[id="travelForm"]')[0].reset();
            
            var travelClaimBoxHTML =    '<div class="col-lg-3 col-sm-6 col-md-4"> <div class="ibox"> <div class="ibox-content product-box travel-box"> <div class="product-desc"><span class="product-name pull-right"><i class="fa fa-bus"></i></span> <div class="row"> <div class="col-lg-3"><h5>Date: </h5></div><div class="col-lg-6"><h5 class=" text-success">' 
                                        + claimJsonLines[0].ClaimLines[0].ExpenseDate       + '</h5></div><div class="col-lg-3"><h5>Purpose: </h5></div><div class="col-lg-9"><h5 class=" text-success">' 
                                        + claimJsonLines[0].ClaimLines[0].Purpose           + '</h5></div><div class="col-lg-3"><h5>From: </h5></div><div class="col-lg-9"><h5 class=" text-success">' 
                                        + claimJsonLines[0].ClaimLines[0].TravelFromPlace   + '</h5></div><div class="col-lg-3"><h5>To: </h5></div><div class="col-lg-9"><h5 class=" text-success">' 
                                        + claimJsonLines[0].ClaimLines[0].TravelToPlace     + '</h5></div><div class="col-lg-3"><h5>Mode: </h5></div><div class="col-lg-9"><h5 class=" text-success">' 
                                        + travelMode                                        + '</h5></div></div><h3 class="pull-right"><span class="text-success">&#8377 ' 
                                        + claimJsonLines[0].ClaimLines[0].TotalAmount       + '</span></h3> <br/> </div></div></div></div>';
            
            
            $('#claimLinesDiv').slideDown( "slow", function() { 
                $('#claimLinesRow').append(travelClaimBoxHTML).fadeIn(2000);
            } );

        }

        function initiateClaim() {
            if ($('#claimTitle').val().trim() == "") {
                toastr.error('', 'Enter the claim purpose!')
            }
            else
            {
                var EmpId = <%= Session["EmpId"] %>;
                var EmpNum = '<%= Session["EmpNum"] %>';
                var ClaimNo = '';

                $.getJSON('api/getLastClaimHead/'+EmpId, function (result) {
                    claimJsonHead.ClaimHead[0].EmpId = EmpId
                    claimJsonHead.ClaimHead[0].ClaimTitle = $('#claimTitle').val();
                    claimJsonHead.ClaimHead[0].ClaimNumber = EmpNum + '-' + result.ClaimNo;

                    $('#hrLineUp').slideDown( "slow" );
                    $('#cliamTypeButtonDiv').slideDown("slow");
                    $('#hrLineDown').slideDown("slow");
                   
                });
            }
        }
    </script>
</asp:Content>
