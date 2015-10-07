<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UbietyMenu.Master" CodeBehind="viewClaim.aspx.cs" Inherits="adminpanel.viewClaim" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>View Claim</h2>
        </div>
        <div class="col-lg-2">
        </div>
    </div>

    <br />

    <div class="col-lg-10 col-sm-12 col-md-12 col-lg-offset-1">
        <div class="ibox">
            <div class="ibox-content">
                <div class="tabs-container">
                    <div class="tabs-top">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#tabSummary">Summary</a></li>
                            <li><a data-toggle="tab" href="#tabTravel">Travel</a></li>
                            <li><a data-toggle="tab" href="#tabHotel">Hotel</a></li>
                            <li><a data-toggle="tab" href="#tabFood">Food</a></li>
                            <li><a data-toggle="tab" href="#tabOthers">Others</a></li>
                        </ul>
                        <div class="tab-content ">

                            <div id="tabSummary" class="tab-pane">
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
                                                        <input type="text" readonly class="form-control" value="Create" />
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-lg-4 col-sm-4 col-md-4">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 50%">Expense</th>
                                                        <th style="width: 23%">Claimed ( &#x20B9 )</th>
                                                        <th style="width: 27%">Approved ( &#x20B9 )</th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Travel</td>
                                                        <td class="curr" id="sumTravelAmt">0.00</td>
                                                        <td  ><input style="width:60px" id="sumTravelAmtA" onclick="this.select();" type="number" /></td>

                                                    </tr>
                                                    <tr>
                                                        <td>Hotel</td>
                                                        <td class="curr" id="sumHotelAmt">0.00</td>
                                                        <td  ><input style="width:60px" id="sumHotelAmtA" onclick="this.select();" type="number" /></td>


                                                    </tr>
                                                    <tr>
                                                        <td>Food</td>
                                                        <td class="curr" id="sumFoodAmt">0.00</td>
                                                        <td  ><input style="width:60px" id="sumFoodAmtA" onclick="this.select();" type="number" /></td>
                                                    </tr>

                                                    <tr>
                                                        <td>Others</td>
                                                        <td class="curr" id="summOthAmt">0.00</td>
                                                        <td  ><input style="width:60px" id="summOthAmtA" onclick="this.select();" type="number" /></td>

                                                    </tr>
                                                </tbody>
                                                <tfoot>
                                                    <tr style="background-color: lightgray">
                                                        <td><b>Approved Amount</b></td>
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
                                                        <th style="width: 10%;">Date </th>
                                                        <th style="width: 40%">Notes</th>
                                                        <th style="width: 15%" class="curr">Amount</th>
                                                        <th style="width: 15%" class="curr">Approved</th>
                                                        <th style="width: 10%">View</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row text-center">
                                    <input type="button" value="Save Changes" class="btn btn-info" />
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>

        var claimJSON;
        $(document).ready(function () {

            $.ajax({
                url: "api/claimJSONs/16",
            }).done(function (result) {

                claimJSON = JSON.parse(result.claimText);

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

                $("#claimDate").val(result.claimDate.substring(0,10));
                $("#claimNo").val(result.claimNo);

                $.ajax({
                    url: "GetEmpDetail/of/" + result.EmpId,
                }).done(function (empDetails) {
                    $("#empName").val(empDetails.employee[0].EmpName);
                    $("#empNum").val(empDetails.employee[0].EmpNum);

                });




                var i = 0;

                for (i = 0; i < claimJSON.Travels.length; i++) {
                    $('#expensesTable  tbody').append('<tr><td>Travel</td><td>' + claimJSON.Travels[i].traveldate + '</td><td>' + claimJSON.Travels[i].purpose + '</td><td class="curr">' + claimJSON.Travels[i].totalamount + '</td><td><input type="number" value="' + claimJSON.Travels[i].totalamount + '" /></td><td class="text-center text-info"><i class="fa fa-eye"></i></tr>');
                }

                for (i = 0; i < claimJSON.Hotels.length; i++) {
                    $('#expensesTable  tbody').append('<tr><td>Hotel</td><td>' + claimJSON.Hotels[i].staytodate + '</td><td>' + claimJSON.Hotels[i].hotelname + '</td><td class="curr">' + claimJSON.Hotels[i].totalamount + '</td><td><input type="number" value="' + claimJSON.Hotels[i].totalamount + '" /></td><td class="text-center text-info"><i class="fa fa-eye"></i></tr>');
                }
                
                for (i = 0; i < claimJSON.Food.length; i++) {
                    $('#expensesTable  tbody').append('<tr><td>Food</td><td>' + claimJSON.Food[i].expensedate + '</td><td>' + claimJSON.Food[i].restaurantname + '</td><td class="curr">' + claimJSON.Food[i].totalamount + '</td><td><input type="number" value="' + claimJSON.Food[i].totalamount + '" /></td><td class="text-center text-info"><i class="fa fa-eye"></i></tr>');
                }

                for (i = 0; i < claimJSON.Others.length; i++) {
                    $('#expensesTable  tbody').append('<tr><td>Others</td><td>' + claimJSON.Others[i].otherexpensedate + '</td><td>' + claimJSON.Others[i].otherdesc + '</td><td class="curr">' + claimJSON.Others[i].otherexpenseamt + '</td><td><input type="number" value="' + claimJSON.Others[i].otherexpenseamt + '" /></td><td class="text-center text-info"><i class="fa fa-eye"></i></tr>');
                }
            });
        });

    </script>


    <%--<script>

        
        var newId = 0;
        var claimJSON = $.parseJSON('{"empid":"","travelExpense":0, "foodExpense":0, "hotelExpense":0,"otherExpense":0, "totalExpense":0, "claimpurpose":"","claimdate":"","totalamount":"","managername":"","status":"","Travels":[],"Hotels":[],"Food":[],"Others":[]}');


        function addExpense(expenseType) {
            newId++;
            switch (expenseType) {
                case 'Travel':
                  //  claimJSON.Travels.push({ "travelid": newId, "purpose": $('#travelpurpose').val(), "traveldate": $("#traveldate").val(), "modeoftravel": $('input[name=modeoftravel]:checked').val(), "from": $("#travelfrom").val(), "to": $("#travelto").val(), "distance": $("#traveldistance").val(), "rate": $("#travelrate").val(), "remarks": $("#travelremarks").val(), "totalamount": $("#travelamount").val() });
                  //  calculateSummTravelAmt();
                    $('#expensesTable  tbody').append('<tr id="' + newId + '"><td>Travel</td><td>' + $("#traveldate").val() + '</td><td>' + $('#travelpurpose').val() + '</td><td class="curr">' + $("#travelamount").val() + '</td><td class="text-center text-info"><i class="fa fa-pencil"></i>&nbsp;&nbsp;  <i class="fa fa-trash"></i></tr>');

                    break;
                case 'Hotel':
                    claimJSON.Hotels.push({ "hotelsid": newId, "hotelname": $("#hotelname").val(), "stayfromdate": $("#stayfromdate").val(), "staytodate": $("#staytodate").val(), "noofnights": $("#").val(), "rate": $("#hotelrate").val(), "remarks": $("#hotelremarks").val(), "totalamount": $("#hotelamount").val() });
                    calculateSummHotelAmt();
                    $('#expensesTable  tbody').append('<tr id="' + newId + '"><td>Hotel</td><td>' + $("#staytodate").val() + '</td><td>' + $('#hotelname').val() + '</td><td class="curr">' + $("#hotelamount").val() + '</td><td class="text-center text-info"><i class="fa fa-pencil"></i>&nbsp;&nbsp;  <i class="fa fa-trash"></i></tr>');
                    break;
                case 'Food':
                    claimJSON.Food.push({ "foodid": newId, "restaurantname": $("#restaurantname").val(), "expensedate": $("#foodexpensedate").val(), "noofpersons": $("#foodnoofpersons").val(), "remarks": $("#foodremarks").val(), "totalamount": $("#foodtotalamount").val() });
                    calculateSummFoodAmt();
                    $('#expensesTable  tbody').append('<tr id="' + newId + '"><td>Food</td><td>' + $("#foodexpensedate").val() + '</td><td>' + $('#restaurantname').val() + '</td><td class="curr">' + $("#foodtotalamount").val() + '</td><td class="text-center text-info"><i class="fa fa-pencil"></i>&nbsp;&nbsp;  <i class="fa fa-trash"></i></tr>');

                    break;
                case 'Others':
                    claimJSON.Others.push({ "othersid": newId, "otherdesc": $("#otherdesc").val(), "otherexpensedate": $("#otherexpensedate").val(), "otherexpenseremarks": $("#otherexpenseremarks").val(), "otherexpenseamt": $("#otherexpenseamt").val() });
                    calculateSummOthersAmt();
                    $('#expensesTable  tbody').append('<tr id="' + newId + '"><td>Others</td><td>' + $("#otherexpensedate").val() + '</td><td>' + $('#otherdesc').val() + '</td><td class="curr">' + $("#otherexpenseamt").val() + '</td><td class="text-center text-info"><i class="fa fa-pencil"></i>&nbsp;&nbsp;  <i class="fa fa-trash"></i></tr>');

                    break;

                default:
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

        function activateTab(tab) {
            $('.nav-tabs a[href="#' + tab + '"]').tab('show');
        }


        $("#foodForm").submit(function (event) {
            event.preventDefault();
            addExpense('Food');
            $('#foodForm').trigger("reset");
            activateTab('tabSummary');

        });

        $("#travelForm").submit(function (event) {
            event.preventDefault();
            addExpense('Travel');
            $('#travelForm').trigger("reset");
            activateTab('tabSummary');


        });

        $("#hotelForm").submit(function (event) {
            event.preventDefault();
            addExpense('Hotel');
            $('#hotelForm').trigger("reset");
            activateTab('tabSummary');


        });

        $("#othersForm").submit(function (event) {
            event.preventDefault();
            addExpense('Others');
            $('#othersForm').trigger("reset");
            activateTab('tabSummary');

        });


        var claimJSON = $.parseJSON('{"empid":"","travelExpense":0, "foodExpense":0, "hotelExpense":0,"otherExpense":0, "totalExpense":0, "claimpurpose":"","claimdate":"","totalamount":"","managername":"","status":"","Travels":[],"Hotels":[],"Food":[],"Others":[]}');


        function populateSummary() {

            claimJSON.travelExpense = parseInt($("#sumTravelAmt").html());
            claimJSON.foodExpense = parseInt($("#sumFoodAmt").html());
            claimJSON.hotelExpense = parseInt($("#sumHotelAmt").html());
            claimJSON.otherExpense = parseInt($("#summOthAmt").html());
            claimJSON.totalExpense = $("#summTotAmt").html();

            prompt("", JSON.stringify(claimJSON));

        }

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

    </script>--%>
</asp:Content>