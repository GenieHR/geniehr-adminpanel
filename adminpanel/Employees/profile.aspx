<%@ Page Title="" Language="C#" MasterPageFile="~/Employees/EmployeeTemplate.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="adminpanel.Employees.profile" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/plugins/jcrop/jquery.Jcrop.min.css" rel="stylesheet" />
    <link href="../css/plugins/dropzone/dropzone.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


    <div class="modal inmodal fade" id="profileImageModal" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content ">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">Upload Profile Image</h4>
                                            <small class="font-bold">Select an image from your computer </small>
                                        </div>
                                        <div class="modal-body ">
                                       <%--<center>
                                            <img style="width:400px;height:400px;" src="../img/general.jpg"  id="profilepic" />
                                            </center>--%>

                                            <div class="jumbotron">
   <div id="dZUpload" class="dropzone">
        <div class="dz-default dz-message">
            Drop image here. 
        </div>
    </div>

</div>
                                            

                                        </div>
                                        <div class="modal-footer">

                                            <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>


    <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
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
    <div class="wrapper wrapper-content animated fadeIn">
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Basic Details</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>

                    <div class="ibox-content">
                        <div class="row">
                        <div class="col-sm-3">
                        <img src="../img/pp/big_blank.jpg"  />
                            <div class="text-center">
                            <h5><a href="#" data-toggle="modal" data-target="#profileImageModal">Change Image</a></h5>
                                </div>
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


    jQuery(function($) {
        $('#profilepic').Jcrop(
            {
                bgColor: 'gray',
                bgOpacity: .2,
                aspectRatio: 1,
                boxWidth: 450,
                boxHeight: 400
            });
    });


            //File Upload response from the server
    Dropzone.autoDiscover = false;
    //Simple Dropzonejs 
    $("#dZUpload").dropzone({
        url: "../hn_SimpeFileUploader.ashx",
        maxFiles: 5,
        addRemoveLinks: true,
        success: function (file, response) {
            var imgName = response;
            file.previewElement.classList.add("dz-success");
            //console.log("Successfully uploaded :" + imgName);
        },
        error: function (file, response) {
            file.previewElement.classList.add("dz-error");
        }
    });

    </script>
</asp:Content>
