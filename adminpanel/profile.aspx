<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" MasterPageFile="~/template.Master" Inherits="UbietyAdmin.profile" Title="Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" Runat="Server">
    <script src="js/plugins/table2Excel/ExportHTML.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>

    
            <div class="ibox">
                <div class="ibox-title">
                    <h1 id="EmpName" class=" text-navy"></h1>
                </div>
                <div class="ibox-content ">
                    <div class="row">
                        <div class="col-sm-6 col-lg-3 col-md-3">
                            <img style="width: 200px; height: 200px" class="border-right" src="http://www.hydrogenaud.io/forums/uploads/profile/photo-119400.jpg" />
                        </div>
                        <div class="col-sm-6 col-lg-4 col-md-4">
                            <table id="empDetails" class="table no-borders ">
                                <tr style="display: none">
                                    <td class="text-justify">
                                        <h4 class="text-justify">Employee Name. </h4>
                                    </td>
                                    <td><span class="text-info" id="EmpNameTbl"></span></td>
                                </tr>

                                <tr>
                                    <td class="no-top-border">
                                        <h4 class="text-justify">Employee No. </h4>
                                    </td>
                                    <td class="no-top-border"><span class="text-info" id="EmpNum"></span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4 class="text-justify">Email </h4>
                                    </td>
                                    <td><span class="text-info" id="Email"></span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4 class="text-justify">Mobile No. </h4>
                                    </td>
                                    <td><span class="text-info" id="MobileNo"></span></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-sm-6 col-lg-4 col-md-4">
                            <table class="table no-borders ">
                                <tr>
                                    <td class="no-top-border">
                                        <h4 class="text-justify">Attendance </h4>
                                    </td>
                                    <td class="no-top-border"><span class="text-info" id=""></span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4 class="text-justify">Claims </h4>
                                    </td>
                                    <td><span class="text-info" id=""></span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <h4 class="text-justify">Leaves </h4>
                                    </td>
                                    <td><span class="text-info" id=""></span></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12 col-lg-12 col-md-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h1>Details</h1>
                        </div>
                        <div class="ibox-content ">

                            <ul class="nav nav-tabs ">
                                <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-user"></i>Attendance</a></li>
                                <li class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i>Leave </a></li>
                                <li class=""><a data-toggle="tab" href="#tab-3"><i class="fa fa-money"></i>Claims</a></li>

                            </ul>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                    <br />
                                    <div class="full-height-scroll">
                                        <div class="table-responsive ">
                                            <div class="dataTables_wrapper">

                                                <div class="pull-right"><a title="Export to Excel" id="foo">Export to Excel</a></div>
                                                <table id="jsonTable" class="table table-bordered  table-condensed">
                                                    <tr>
                                                        <th>Date</th>
                                                        <th>Time</th>
                                                        <th>Place</th>
                                                        <th class="noExl">Details</th>

                                                    </tr>

                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-2" class="tab-pane">
                                    <div class="full-height-scroll">
                                        <h1 class="text-center"><span class="text-success">
                                            <br />
                                            <br />
                                            <br />
                                            <span class="spinner">Loading…</span><br />
                                            Coming Soon...<br />
                                            <br />
                                            <br />
                                            <br />
                                        </span></h1>
                                    </div>
                                </div>
                                <div id="tab-3" class="tab-pane">
                                    <div class="full-height-scroll">
                                        <h1 class="text-center"><span class=" text-success">
                                            <br />
                                            <br />
                                            <br />
                                            <span class="spinner">Loading…</span><br />
                                            Coming Soon...<br />
                                            <br />
                                            <br />
                                            <br />
                                        </span></h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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

            
        </div>


        <div class="modal inmodal" id="viewMapDialog" style="min-width: 100%; min-height: 100%; height: auto" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-body">

                        <div id="panel">
                            <input id="latlng" value="40.714224,-73.961452" />
                            <input type="button" value="Reverse Geocode" onclick="codeLatLng()" />
                        </div>
                        <div id="mapCanvas" style="min-width: 100%; min-height: 500px; height: auto"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>

        </div>

    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="javascriptPart" runat="server">


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

        var attendanceURL = "api/attendance/of/temp/" + getParameterByName('EmpId');
        var profileURL = "api/getempdetail/of/" + getParameterByName('EmpId') + '?jsoncallback=?';
         <% // TODO: Environment Varialbe %>

        var url = '<%= ConfigurationManager.AppSettings["StorageURL"] %>';

        // var url = '<%//= Environment.GetEnvironmentVariable("StorageURL") %>';

        var _map1, orgJSON, marker;

        var geocoder = new google.maps.Geocoder();
        var infowindow = new google.maps.InfoWindow();

        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        var addArray = [];

        $.getJSON(attendanceURL, function (result) {
            orgJSON = result;

            var spancount = 1;
            var i, q;

            q = 0;

            if (orgJSON.length >= 2) {
                if (orgJSON[0].MarkDate != orgJSON[1].MarkDate) {
                    orgJSON[0].span = 0;
                    q = 1;
                }
            }

            for (i = q; i < orgJSON.length - 1; i++) {
                if (orgJSON[i].MarkDate == orgJSON[i + 1].MarkDate) {
                    spancount++;
                }
                else {
                    if (spancount > 1) {
                        orgJSON[i - spancount + 1].span = spancount;
                        spancount = 1;
                    }
                }
            }

            if (spancount > 1) {
                orgJSON[orgJSON.length - spancount].span = spancount;
            }

            var rowStr = '';
            var curSpanCount = 1;

            for (i = 0; i < orgJSON.length; i++) {
                rowStr = '<tr>';

                if (q == 1) {
                    rowStr += '<td  valign="middle" align="center">' + orgJSON[0].MarkDate + '</td>';
                    q = 0;
                }

                if (orgJSON[i].span > 0) {
                    rowStr += '<td valign="middle" align="center" rowspan = "' + orgJSON[i].span + '">' + orgJSON[i].MarkDate + '</td>';
                    spancount = orgJSON[i].span;
                    curSpanCount = 1;
                }
                else {
                    curSpanCount++;

                    if (curSpanCount > spancount) {
                        rowStr += '<td valign="middle" align="center" >' + orgJSON[i].MarkDate + '</td>';
                    }
                }

                rowStr += '<td>' + orgJSON[i].MarkTime + '</td>';

                var spanId = 'add' + Math.floor(Math.random() * 9000) + 1000;;

                var a = '<i id="' + 'a' + spanId + '" class="fa fa-spinner fa-pulse fa-spin"></i><span id="' + spanId + '"> Loading... </span>';

                var maptd = '<a data-toggle="modal" data-lat="' + orgJSON[i].Coordinates + '" class="open-myMapModal" data-target="#myMapModal" href="#"  ><i class="fa fa-2x fa-map-marker" /></a>'

                addArray[i] = spanId + ',' + orgJSON[i].Coordinates;

                var empId, mdYear, mdMonth, mdDate, imgId;

                empId = orgJSON[i].empid;

                mdYear = orgJSON[i].MarkDate.split('-', 3)[2];
                mdMonth = orgJSON[i].MarkDate.split('-', 3)[1];
                mdDate = orgJSON[i].MarkDate.split('-', 3)[0];

                imgId = empId + '/' + mdYear + '/' + mdMonth + '/' + mdDate + '/' + orgJSON[i].MarkCount;

                rowStr += '<td>' + a + '</td>';

                a = maptd + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + '<a data-toggle="modal" data-id="' + imgId + '" class="open-viewImageDialog" data-target="#viewImageDialog" href="#viewImageDialog"  ><i class="fa fa-2x fa-file-image-o" /></a>';

                rowStr += '<td>' + a + '</td>';

                rowStr += '</tr>';

                $("#jsonTable > tbody").append(rowStr);

            }

            var i = addArray.length;

            (function myLoop(i) {
                setTimeout(function () {
                    if (--i) myLoop(i);
                }, 1000)
            })(addArray.length);
        });

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

        myLoop();

        var el = document.getElementById('foo');
        el.onclick = showFoo;

        function showFoo() {
            fnExportHTML("empDetails|jsonTable", "#87AFC6", "lakshman");
            return false;
        }


        $(document).ready(function () {
            $.ajax({
                url: profileURL,
                beforeSend: function (xhr) {
                    xhr.overrideMimeType("text/plain; charset=x-user-defined");
                }
            })
                .done(function (data) {
                    var obj = JSON.parse(data);

                    document.getElementById("EmpNameTbl").innerHTML = obj.employee[0].EmpName;
                    document.getElementById("EmpName").innerHTML = obj.employee[0].EmpName;
                    document.getElementById("EmpNum").innerHTML = obj.employee[0].EmpNum;
                    document.getElementById("Email").innerHTML = obj.employee[0].Email;
                    document.getElementById("MobileNo").innerHTML = obj.employee[0].MobileNum;
                });
        });

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