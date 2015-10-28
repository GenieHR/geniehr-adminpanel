<%@ Page Title="Employee Profile" Language="C#" MasterPageFile="~/Employees/EmployeeTemplate.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="adminpanel.Employees.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/plugins/jcrop/jquery.Jcrop.min.css" rel="stylesheet" />
    <link href="../css/plugins/dropzone/dropzone.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="modal inmodal fade" id="profileImageModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-sm">
                <div class="modal-header">
                    <button type="button" class="close" onclick="closeModal()"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Upload Profile Image</h4>
                    <small class="font-bold">Select an image from your computer </small>
                </div>
                <div class="modal-body ">

                    <div id="dZUpload" class="dropzone">
                        <div class="dz-default dz-message">
                            Drop image here. 
       
                        </div>
                    </div>


                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-white" onclick="closeModal()">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="row wrapper border-bottom white-bg page-heading">

        <div class="col-lg-12">
            <h2>My Profile</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="home.aspx">Home</a>
                </li>

                <li class="active">
                    <strong>Profile</strong>
                </li>
            </ol>
        </div>

    </div>

    <div class="row wrapper wrapper-content animated fadeIn">

        <div class=" col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Primary Details</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>

                <div class="ibox-content">

                    <div class="row">

                        <div class="col-sm-4 text-center">

                            <h2 class="text-info"><%= Session["loggedinuserName"] %></h2>

                            <div id="profileImgContainer">
                                <img id="mainProfilePic" src="<%= System.Web.Configuration.WebConfigurationManager.AppSettings["ProfileURL"] + Session["EmpId"] %>" onerror="../img/pp/big_blank.jpg" style="height: 200px; width: 200px; overflow: hidden" />
                            </div>

                            <h5><a href="#" data-toggle="modal" data-target="#profileImageModal">Change Image</a></h5>
                        </div>

                        <div class="col-sm-4">
                            <ul class="list-group clear-list m-t" style="margin-top: 35px">
                                <li class="list-group-item fist-item">
                                    <span class="pull-right text-success">REL-201508-001
                                    </span>
                                    Employee No
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success">Engineer
                                    </span>
                                    Designation
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success">23-10-2015
                                    </span>
                                    Date of Joining
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success">Reliance Jio Infocomm
                                    </span>
                                    Client
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success">Jammu & Kashmir
                                    </span>
                                    Location
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success">&#8377; 12,500
                                    </span>
                                    Salary
                                </li>

                            </ul>
                        </div>

                        <div class="col-sm-4">
                            <div style="margin-top: 35px; height: 100px" class="panel panel-info">
                                <div class="panel-body">
                                    <h5>Your profile is 15% complete </h5>
                                    <div class="progress">
                                        <div style="width: 15%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="15" role="progressbar" class="progress-bar progress-bar-success">
                                            <small>15% </small>

                                        </div>


                                    </div>
                                </div>
                            </div>
                            <ul class="list-group clear-list m-t">
                                <li class="list-group-item fist-item">
                                    <span class="pull-right text-success">Sukhwinder Singh
                                    </span>
                                    Manager Name
                                </li>

                                <li class="list-group-item">
                                    <span class="pull-right text-success">ssingh@ril.com
                                    </span>
                                    Email
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success">+91 7032906292
                                    </span>
                                    Mobile 
                                </li>

                            </ul>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div class=" col-lg-12">
            <div class="ibox float-e-margins collapsed">
                <div class="ibox-title">
                    <h5>Personal Details</h5>
                    <div class="ibox-tools">
                        <i class="fa fa-save"></i>

                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>

                <div class="ibox-content">
                    <div class="row">
                        <div class="col-md-3">
                            <label>Full Name</label></div>
                        <div class="col-md-3">
                            <input type="text" placeholder="First Name" class="form-control input-sm" /></div>
                        <div class="col-md-3">
                            <input type="text" placeholder="Middle Name" class="form-control input-sm" /></div>
                        <div class="col-md-3">
                            <input type="text" placeholder="Last Name" class="form-control input-sm" /></div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-3">
                            <label>Parents Detail</label></div>
                        <div class="col-md-4">
                            <input type="text" placeholder="Father's Name" class="form-control input-sm" /></div>
                        <div class="col-md-4">
                            <input type="text" placeholder="Mother's Name" class="form-control input-sm" /></div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-3">
                            <label>Birth Details</label></div>
                        <div class="col-md-3">
                            <input type="text" placeholder="Date of Birth" class="form-control input-sm" /></div>
                        <div class="col-md-3">
                            <input type="text" placeholder="Blood Group" class="form-control input-sm" /></div>
                        <div class="col-md-3">
                            <input type="text" placeholder="Gender" class="form-control input-sm" /></div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-md-3">
                            <label>Relationship Details</label></div>
                        <div class="col-md-3">
                            <input type="text" placeholder="Marital Status" class="form-control input-sm" /></div>
                        <div class="col-md-3">
                            <input type="text" placeholder="Spouse Name" class="form-control input-sm" /></div>
                        <div class="col-md-3">
                            <input type="text" placeholder="Marriage Anniversary" class="form-control input-sm" /></div>
                    </div>
                    <hr />

                </div>
            </div>
        </div>

        <div class=" col-lg-12">
            <div class="ibox float-e-margins collapsed">
                <div class="ibox-title">
                    <h5>Profile Details</h5>
                    <div class="ibox-tools">
                        <i class="fa fa-save"></i>

                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>

                <div class="ibox-content">
                    <div class="row">

                        <div class="col-sm-6">
                            <div class="panel panel-primary">

                                <div class="panel-heading">
                                    <span class="panel-title text-center">Emergency Contacts</span>
                                </div>
                                <div class="panel-body text-center" style="height:150px">
                                    <%--<ul class="list-group clear-list m-t">
                                        <li class="list-group-item fist-item">
                                            <span class="pull-right text-success">Father
                                            </span>
                                            Suresh Krishna
                                        </li>
                                        <li class="list-group-item">
                                            <span class="pull-right text-success">Uncle
                                            </span>
                                            Mahesh Kumar
                                        </li>
                                        <li class="list-group-item">
                                            <span class="pull-right text-success">Wife
                                            </span>
                                            Asha Madhuri
                                        </li>
                                        <li class="list-group-item">
                                            <span class="pull-right text-success">Doctor
                                            </span>
                                            Dr. Hari Prasad
                                        </li>



                                    </ul>--%>

                                        No Details
                                        
                                </div>

                            </div>

                        </div>

                        <div class="col-sm-6">
                            <div class="panel panel-primary">

                                <div class="panel-heading">
                                    <span class="panel-title text-center">Emergency Contacts</span>
                                </div>
                                <div class="panel-body text-center" style="height:150px">
                         
                                               
                                    

                            </div>

                        </div>
                        
                    </div>

                    
                </div>

            </div>
        </div>
    </div>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">
    <script src="../js/plugins/jcrop/jquery.Jcrop.min.js"></script>
    <script src="../js/plugins/jcrop/jquery.color.js"></script>
    <script src="../js/plugins/dropzone/dropzone.js"></script>
    <script>


        function closeModal() {
            $('#profileImageModal').modal('hide');
            $('#mainProfilePic').attr("src", '<%= System.Web.Configuration.WebConfigurationManager.AppSettings["ProfileURL"] + Session["EmpId"] %>');

        }

        jQuery(function ($) {
            $('#profilepic').Jcrop(
                {
                    bgColor: 'gray',
                    bgOpacity: .2,
                    aspectRatio: 1,
                    boxWidth: 450,
                    boxHeight: 400
                });
        });


        Dropzone.autoDiscover = false;

        $("#dZUpload").dropzone({
            url: "../hn_SimpeFileUploader.ashx",
            maxFiles: 1,
            addRemoveLinks: true,
            success: function (file, response) {
                var imgName = response;
                file.previewElement.classList.add("dz-success");
                $('#profileImageModal').modal('hide');

                $('#mainProfilePic').remove();


                var strHTML = '<img id="mainProfilePic" src="<%= System.Web.Configuration.WebConfigurationManager.AppSettings["ProfileURL"] + Session["EmpId"]  + "?" + DateTime.Now.ToString("ddMMyyyyhhmmsstt") %>" style="height:200px;width:200px;overflow:hidden" />';

                $('#profileImgContainer').html(strHTML);
                $('#mainProfilePic')[0].src += new Date().getTime();


            },
            error: function (file, response) {
                file.previewElement.classList.add("dz-error");
            }
        });

    </script>
</asp:Content>
