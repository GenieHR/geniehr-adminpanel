<%@ Page Title="Quick Reports" Language="C#" MasterPageFile="~/UbietyMenu.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="adminpanel.dashboard" %>


<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
            <style type="text/css">
.paging-nav {
  text-align: right;
  padding-top: 2px;
}

.paging-nav a {
  margin: auto 1px;
  text-decoration: none;
  display: inline-block;
  padding: 1px 7px;
  background: #91b9e6;
  color: white;
  border-radius: 3px;
}

.paging-nav .selected-page {
  background: #187ed5;
  font-weight: bold;
}
</style>
    <script src="js/plugins/date/date.js"></script>
    <script src="js/plugins/date/extras.js"></script>
    <script src="js/plugins/date/parser.js"></script>
    <script src="js/plugins/date/sugarpak.js"></script>
    <script src="js/plugins/date/time.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet" />
    <script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>

    <div class="row wrapper border-bottom white-bg page-heading">
 
        <div class="col-lg-10">
                <h1 class="text-info"><%= Request.QueryString["Client"].Split('|')[1] %></h1>
                <h3>Quick Reports</h3>

            </div>
        
        <div class="col-lg-2 pull-right">
            <br />
            <br />
        <a href="ShowEmployees.aspx?Client=<%= Request.QueryString["Client"] %>" class="btn btn-xs btn-outline btn-primary">Show all Employees</a>

            </div>
            
        </div>
    <div class="col-lg-6">
    <div class="ibox">
                        <div class="ibox-title">
                            <div class="row">
                            <div class="col-lg-6">
                            <h3>Attendance</h3>
                                </div>
                            <div class="col-lg-6">
                                <div  id="data_1">
                                <div  class="input-group input-xs date">
                                    <span class="input-group-addon">Select Date</span><input type="text" id="selDate" class="form-control" />
                                </div>
                            </div>                                </div>
                        </div>
                            </div>
                        <div class="ibox-content ">
                            <div class="row">
                            <div class="col-lg-12">
                            <table id="jsonTable" class="table table-bordered table-hover  table-condensed">
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Time</th>
                                                        <th>Place</th>
                                                        <th>Details</th>
                                                    </tr>

                                                </table>
                                </div></div>
                            </div>
        </div>

    
    <div class="modal inmodal fadeIn" id="myMapModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-content animated fadeIn">

                        <div class="modal-body">
                                                    <style>
            #map-canvas {
            height: 500px;
            min-width: 100%;
        }
         </style>

                            <div id="map-canvas" class=""></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <div class="modal inmodal" id="viewImageDialog" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-body">
                        <div class="row">
                            <br />
                            <br />
                            <br />
                            <div class="col-md-12 col-lg-12">
                                <center>
                                    <img class="north" id="imageId" style="width:50%;height:50%" />
                                    <br />
                                    <br />
                                </center>
                            </div>
                        </div>
                        <input type="button" value="Rotate" />
                    </div>
                </div>
            </div>
            
            <link href="css/imageModal.css" rel="stylesheet" />

            <script>
                $('input').click(function () {
                    var img = $('#imageId');
                    if (img.hasClass('north')) {
                        img.attr('class', 'west');
                    } else if (img.hasClass('west')) {
                        img.attr('class', 'south');
                    } else if (img.hasClass('south')) {
                        img.attr('class', 'east');
                    } else if (img.hasClass('east')) {
                        img.attr('class', 'north');
                    }
                });

            </script>
        </div>

<script>

    var url = '<%= ConfigurationManager.AppSettings["StorageURL"] %>';

    $(document).ready(function () {
        $('#data_1 .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: true,
            format: "dd/M/yyyy",
            forceParse: false,
            calendarWeeks: false,
            autoclose: true,
        })
            .on('changeDate', function (e) {

                //var span = ;

                populateTableData((new TimeSpan(Date.today() - Date.parse($('#selDate').val()))).days);
        });        $('#data_1 .input-group.date').datepicker('update', new Date());
        $('#jsonTable').paging({
            limit: 5,
            rowDisplayStyle: 'block',
            activePage: 0,
            rows: []
        });

        populateTableData(0);
        
    });

    var addArray = [];

    function populateTableData(numDays) {

         addArray = [];

        $("#jsonTable").find("tr:gt(0)").remove();

        var todayAttURL = 'api/attOfClient/<%= Request.QueryString["Client"].Split('|')[0] %>/' + numDays;

        $.getJSON(todayAttURL, function (result) {
            orgJSON = result;

            var spancount = 1;
            var i, q;

            q = 0;

            var rowStr = '';
            var curSpanCount = 1;

            for (i = 0; i < orgJSON.length; i++) {
                rowStr = '<tr>';

                rowStr += '<td><a href="profile.aspx?EmpId=' + orgJSON[i].EmpId + '" >' + orgJSON[i].Emp_Name + '</a></td>';

                //rowStr += '<td  valign="middle" align="center">' + orgJSON[0].MarkDate + '</td>';

                rowStr += '<td>' + orgJSON[i].MarkingTime.substring(0, 5) + '</td>';

                var spanId = 'add' + Math.floor(Math.random() * 9000) + 1000;;

                var a = '<i id="' + 'a' + spanId + '" class="fa fa-spinner fa-pulse fa-spin"></i><span id="' + spanId + '"> Loading... </span>';

                var maptd = '<a data-toggle="modal" data-lat="' + orgJSON[i].Coordinates + '" class="open-myMapModal" data-target="#myMapModal" href="#"  ><i class="fa fa-2x fa-map-marker" /></a>'

                addArray[i] = spanId + ',' + orgJSON[i].Coordinates;

                var empId, mdYear, mdMonth, mdDate, imgId;

                empId = orgJSON[i].EmpId;

                mdDate = orgJSON[i].MarkDate.split('-', 3)[2].substring(0, 2);
                mdMonth = orgJSON[i].MarkDate.split('-', 3)[1];
                mdYear = orgJSON[i].MarkDate.split('-', 3)[0];

                imgId = empId + '/' + mdYear + '/' + mdMonth + '/' + mdDate + '/' + orgJSON[i].MarkCount;

                rowStr += '<td>' + a + '</td>';

                a = maptd + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + '<a data-toggle="modal" data-id="' + imgId + '" class="open-viewImageDialog" data-target="#viewImageDialog" href="#viewImageDialog"  ><i class="fa fa-2x fa-file-image-o" /></a>';

                rowStr += '<td>' + a + '</td>';

                rowStr += '</tr>';

                $("#jsonTable > tbody").append(rowStr);

            }

            runLoop(addArray);
        });

        myLoop();
    }

    function runLoop(varArray) {
        var i = varArray.length;

        (function myLoop(i) {
            setTimeout(function () {
                if (--i) myLoop(i);
            }, 1000)
        })(varArray.length);
    }


    function getLocation(info) {

        var myCenter = new google.maps.LatLng(info.split(",", 3)[1], info.split(",", 3)[2]);
        var gc = new google.maps.Geocoder();

        gc.geocode({ 'location': myCenter }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[1]) {
                    document.getElementById(info.split(",", 3)[0]).innerHTML = results[1].formatted_address + ' ';
                    document.getElementById('a' + info.split(",", 3)[0]).remove();
                } else {
                    document.getElementById(info.split(",", 3)[0]).innerHTML = 'Click Map for location' + ' ';
                    document.getElementById('a' + info.split(",", 3)[0]).remove();
                }
            } else {
                //window.alert('Geocoder failed due to: ' + status);
                document.getElementById(info.split(",", 3)[0]).innerHTML = 'Click Map for location' + ' ';
                document.getElementById('a' + info.split(",", 3)[0]).remove();
            }
        });
    }

    var element = $(this);
    var map;
    var geocoder = new google.maps.Geocoder();
    var infowindow = new google.maps.InfoWindow();
    var marker;

    function initialize(myCenter) {

        var mapProp = {
            center: myCenter,
            zoom: 14,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(document.getElementById("map-canvas"), mapProp);

        geocoder.geocode({ 'location': myCenter }, function (results, status) {
            marker = new google.maps.Marker({
                position: myCenter,
                map: map
            });
            marker
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[1]) {
                    map.setZoom(12);
                    infowindow.setContent(results[1].formatted_address);
                    infowindow.open(map, marker);
                } else {
                    // window.alert('No results found');
                }
            } else {
                // window.alert('Geocoder failed due to: ' + status);
            }
        });
    };

    var i = 0;

    function myLoop() {
        setTimeout(function () {
            getLocation(addArray[i]);
            i++;
            if (i < addArray.length) {
                myLoop();
            }
        }, 2500)
    }


    $('#myMapModal').on('shown.bs.modal', function (e) {
        var element = $(e.relatedTarget);
        var data = element.data("lat").split(',');
        initialize(new google.maps.LatLng(data[0], data[1]));
    });

    $(document).on("click", ".open-viewImageDialog", function () {
        var myimageId = $(this).data('id');
        $(".modal-body #imageId").attr('src', '');
        $(".modal-body #imageId").attr('src', url + myimageId);
    });

    </script>

</asp:Content>
