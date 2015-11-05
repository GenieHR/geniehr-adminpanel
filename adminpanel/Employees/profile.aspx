<%@ Page Title="Employee Profile" Language="C#" MasterPageFile="~/Employees/EmployeeTemplate.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="adminpanel.Employees.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/plugins/jcrop/jquery.Jcrop.min.css" rel="stylesheet" />
    <link href="../css/plugins/dropzone/basic.css" rel="stylesheet" />
    <link href="../css/plugins/dropzone/dropzone.css" rel="stylesheet" />
    <link href="../css/plugins/datapicker/datepicker3.css" rel="stylesheet" />
    <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet" />


    <style>
        .EmpId {}
 
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="modal inmodal fade" id="profileImageModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-sm">
                <div class="modal-header">
                    <button type="button" class="close" onclick="closeModal()"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Upload Profile Image</h4>
                    <small class="font-bold">Select an image from your device </small>
                </div>
                <div class="modal-body ">

                    <div id="dZUpload" class="dropzone">
                        <div class="dz-default dz-message">
                            Click to select image 
                       
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" onclick="closeModal()">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal inmodal fade" id="identityModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <form method="post" class="form-horizontal" id="identityForm" action="../PostIDDetail">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Upload Document</h4>
                    <small class="font-bold">Select  from your device </small>
                </div>
                <div class="modal-body ">

                    <div class="row">
                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="docName"></label>

                            <div class="col-lg-8">
                                <input type="hidden" class="EmpId"  />                                <input type="hidden" id="doctype"/>                                <input type="text"   class="form-control" id="DocNum" required="required"/>
                            </div>
                        </div>
                    </div>


                    <div id="docUpload" class="dropzone">
                        <div class="dz-default dz-message">
                            Click to select document to upload 
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success" id="identitySubmit" value="Save Details" />
                    <button type="button" class="btn btn-white"  data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>
        </div>
    </div>
    
    <div class="modal inmodal fade" id="finDetailsModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
                    <form method="get" class="form-horizontal" id="finDetailForm" >

            <div class="modal-content">
                
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Enter your Bank Details</h4>
                    <small class="font-bold">Your salary, advance & claim reimbursements are credited in this account </small>
                </div>
                <div class="modal-body ">
                    <div class="row">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Bank Name</label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control"  id="iBankName"/>
                                <%--<select id="select2_bankName" class="form-control">
                                    <option></option>
                                    <option value="Bahamas">Bahamas</option>
                                    <option value="Bahrain">Bahrain</option>
                                   
                                </select>--%>


                            </div>
                        </div>
                                <input type="hidden" class="EmpId"/>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Branch</label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control" name="BranchName"  id="iBranchName"/>
                                
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Account Number</label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control"  id="iAccountNum"/>
                                
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">IFSC Code</label>

                            <div class="col-lg-8">

                                <input type="text" maxlength="11" class="form-control"  id="iIFSCCode"/>
                                
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Swift Code</label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control"  id="iSwiftCode"/>
                                
                            </div>
                        </div>
                    
                    </div>
                </div>
                <div class="modal-footer">
                        <input type="submit" class="btn btn-success" />

                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                </div>
            

            </div>
                         </form>
        </div>
    </div>

    <div class="modal inmodal fade" id="contactDetailsModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
                    <form method="get" class="form-horizontal" id="contactDetailForm" >

            <div class="modal-content">
                
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Enter your Contact Details</h4>
                    <%--<small class="font-bold">Your salary, advance & claim reimbursements are credited in this account </small>--%>
                </div>
                <div class="modal-body ">
                    <div class="row">
                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="contactLableText"></label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control"  id="contactData"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Lable</label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control"  id="contactLable"/>                                <span class="help-block m-b-none">Enter a short name to describe the contact detail (official, personal etc) </span>
                            </div>
                        </div>
                                <input type="hidden" class="EmpId"/>                                <input type="hidden" id="contactType"/>                    
                    </div>
                </div>
                <div class="modal-footer">
                        <input type="submit" class="btn btn-success" id="contactDetailFormSubmit"/>

                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                </div>
            

            </div>
                         </form>
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

                            <%--  <h2 class="text-info"><%//= Session["loggedinuserName"] %></h2>--%>

                            <div style="margin-top: 25px" id="profileImgContainer">
                                <img id="mainProfilePic" src="<%= System.Web.Configuration.WebConfigurationManager.AppSettings["ProfileURL"] + Session["EmpId"] %>" onerror="this.src='../img/pp/big_blank.jpg'" style="height: 200px; width: 200px; overflow: hidden" />
                            </div>

                            <h5><a href="#" data-toggle="modal" data-target="#profileImageModal">Change Image</a></h5>
                        </div>

                        <div class="col-sm-4">
                            <ul class="list-group clear-list m-t">
                                <li class="list-group-item fist-item">
                                    <span class="pull-right text-success" id="EmpName">
                                    </span>
                                    Full Name
                                </li>

                                <li class="list-group-item">
                                    <span class="pull-right text-success" id="Designation">
                                    </span>
                                    Designation
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success" id="DOJ">
                                    </span>
                                    Date of Joining
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success" id="ClientName">
                                    </span>
                                    Client
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success" id="WorkLocation">
                                    </span>
                                    Location
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success" id="Salary">
                                    </span>
                                    Salary
                                </li>

                            </ul>
                        </div>

                        <div class="col-sm-4">
                            <ul class="list-group clear-list m-t">
                                
                                <li class="list-group-item fist-item">
                                    <span class="pull-right text-success" id="EmpNum">
                                    </span>
                                    Employee No
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success" id="Email">
                                    </span>
                                    Email
                                </li>
                                <li class="list-group-item">
                                    <span class="pull-right text-success" id="PrimaryMobile">
                                    </span>
                                    Mobile 
                                </li>

                            </ul>
                            <div style="height: 100px" class="panel panel-info">
                                <div class="panel-body">
                                    <h5>Your profile is 15% complete </h5>
                                    <div class="progress">
                                        <div style="width: 15%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="15" role="progressbar" class="progress-bar progress-bar-success">
                                            <small>15% </small>

                                        </div>


                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div  class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Personal Details</h5>
                    <div class="ibox-tools">

                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                    <form method="get" class="form-horizontal" id="basicDetailForm" >
                                <input type="hidden" class="EmpId"/>
                <div class="ibox-content">
                    <div class="form-horizontal">
                        <h4 class="text-info">Full Name</h4>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">First Name</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="FirstName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Middle Name</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="MiddleName"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Last Name</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="LastName" />
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <h4 class="text-info">Parent's Details</h4>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Father's Name</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="FatherName"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Mother's Name</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="MotherName" />
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <h4 class="text-info">Birth Details</h4>
                        <div class="hr-line-dashed"></div>


                        <div class="form-group" id="dob">
                            <label class="col-sm-2 control-label">Date of Birth</label>
                            <div class="col-sm-6">
                                <div class="input-group date">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input type="text" class="form-control" id="DOB" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Gender</label>

                            <div class="col-sm-6">
                                <div  class="btn-group" id="Gender">
                                    <label class="btn btn-default btn-white">
                                        <input type="radio"  value="1" name="Gender" />
                                        Male
                                    </label>
                                    <label class="btn btn-default btn-white">
                                        <input type="radio"  value="2" name="Gender" />
                                        Female
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Blood Group</label>

                            <div class="col-sm-10">
                                <div <%--data-toggle="buttons"--%> class="btn-group" id="BloodGroup">
                                    <label class="btn btn-default btn-white">
                                        <input type="radio" value="1" name="BloodGroup" />
                                        O +ve
                                    </label>
                                    <label class="btn btn-default btn-white">
                                        <input type="radio" value="2"  name="BloodGroup" />
                                        O -ve
                                    </label>
                                    <label class="btn btn-default btn-white">
                                        <input type="radio" value="3"  name="BloodGroup" />
                                        A +ve
                                    </label>
                                    <label class="btn btn-default btn-white">
                                        <input type="radio"  value="4"  name="BloodGroup" />
                                        A -ve
                                    </label>
                                    <label class="btn btn-default btn-white">
                                        <input type="radio"  value="5"  name="BloodGroup" />
                                        B +ve
                                    </label>
                                    <label class="btn btn-default btn-white">
                                        <input type="radio"  value="6"  name="BloodGroup" />
                                        B -ve
                                    </label>
                                    <label class="btn btn-default btn-white">
                                        <input type="radio"  value="7"  name="BloodGroup" />
                                        AB +ve
                                    </label>
                                    <label class="btn btn-default btn-white">
                                        <input type="radio"  value="8"  name="BloodGroup" />
                                        AB -ve
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <h4 class="text-info">Marital Details</h4>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">

                            <label class="col-sm-2 control-label">Marital Status</label>

                            <div class="col-sm-6">
                                <div  class="btn-group" id="MaritalStatus">
                                    <label class="btn btn-default btn-white">
                                        <input type="radio"  value="1" name="MaritalStatus" />
                                        Single
                                    </label>
                                    <label class="btn btn-default btn-white">
                                        <input type="radio"  value="2" name="MaritalStatus" />
                                        Married
                                    </label>
                                    <label class="btn btn-default btn-white">
                                        <input type="radio"  value="3" name="MaritalStatus" />
                                        Divorced
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">

                            <label class="col-sm-2 control-label">Spouse Name</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="SpouseName"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">

                    <center><input type="submit" id="basicDetSubmit" class="btn btn-primary" value="Save Details"/></center>
                    </div>

                    </div>
                </div>

                </form>
            </div>
        </div>

        <div  class="col-lg-12 page-wrapper">

            <div class="row">

                <div class="col-sm-6">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Financial Details</h5>
                            <div class="ibox-tools">

                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-pencil"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="#" data-toggle="modal" data-target="#finDetailsModal">Update Details</a>
                                    </li>
                                </ul>
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="ibox-content no-padding">
                            <ul class="list-group">

                                <li class="list-group-item">
                                    <span class="text-left">Bank Name
                                    </span>

                                    <span class="pull-right text-success" id="BankName">
                                    </span>
                                </li>

                                <li class="list-group-item">
                                    <span class="text-left">Branch 

                                    </span>


                                    <span class="pull-right text-success"  id="BranchName"></span>
                                    
                                </li>
                                <li class="list-group-item">
                                    <span class="text-left">Account Number 

                                    </span>

                                    <span class="pull-right text-success"  id="AccountNum"></span>
                                    
                                </li>
                                <li class="list-group-item">
                                    <span class="text-left">IFSC Code

                                    </span>

                                    <span class="pull-right text-success"  id="IFSCCode">
                                
                                    </span>
                                </li>
                                <li class="list-group-item">
                                    <span class="text-left">SWIFT Code

                                    </span>

                                    <span class="pull-right text-success"  id="SwiftCode">
                                    </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                

            <div class="col-sm-6">
                    <div class="ibox float-e-margins ">
                        <div class="ibox-title">
                            <h5>Identity Details</h5>
                            <div class="ibox-tools">

                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="ibox-content no-padding">
                            <ul class="list-group">

                                <li class="list-group-item">
                                    <span class="text-left"><a data-target="#identityModal" data-toggle="modal" data-doctype="dl" class="fa fa-paperclip docLink"></a></span>&nbsp; Driving License

                                    </span>

                                    <span class="pull-right text-success" id="DL">
                                    <i class="fa fa-pencil"></i>

                                    </span>
                                </li>
                                
                                <li class="list-group-item">
                                    <span class="text-left"><a data-target="#identityModal" data-toggle="modal" data-doctype="adhaar" class="fa fa-paperclip docLink"></a>&nbsp; Adhaar Card

                                    </span>

                                    <span class="pull-right text-success" id="Adhaar">
                                    <i class="fa fa-pencil"></i>

                                    </span>
                                </li>

                                <li class="list-group-item">
                                    <span class="text-left"><a data-target="#identityModal" data-toggle="modal" data-doctype="voter" class="fa fa-paperclip docLink"></a>&nbsp; Voter Id

                                    </span>

                                    <span class="pull-right text-success" id="Voter">
                                    <i class="fa fa-pencil"></i>

                                    </span>
                                </li><li class="list-group-item">
                                    <span class="text-left"><a data-target="#identityModal" data-toggle="modal" data-doctype="passport" class="fa fa-paperclip docLink"></a>&nbsp; Passport No

                                    </span>

                                    <span class="pull-right text-success" id="Passport">
                                    <i class="fa fa-pencil"></i>

                                    </span>
                                </li>
                                
                                <li class="list-group-item">
                                    <span class="text-left"><a data-target="#identityModal" data-toggle="modal" data-doctype="pan" class="fa fa-paperclip docLink"></a>&nbsp; PAN No.

                                    </span>

                                    <span class="pull-right text-success" id="Pan"> </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">

           
                <div class="col-sm-4">
                    <div class="ibox float-e-margins collapsed">
                        <div class="ibox-title">
                            <h5>Contact Details</h5>
                            <div class="ibox-tools">

                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-plus"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">

                                    <li><a class="contactTypeLink" data-contacttype="1" data-toggle="modal" data-target="#contactDetailsModal" href="#">New Mobile Number</a>
                                    </li>
                                    
                                    <li><a class="contactTypeLink" data-contacttype="2" data-toggle="modal" data-target="#contactDetailsModal" href="#">New Email Address</a>
                                    </li>

                                </ul>

                                <a class="collapse-link contactDetailBox">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="ibox-content" id="contactDetailsContent">
                            <ul class="list-group" id="contactDetailsList">

                                
                                
                            </ul>

                            <h4 class="text-center" id="contactDetailNoData">No Data Available</h4>

                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="ibox float-e-margins collapsed">
                        <div class="ibox-title">
                            <h5>Addresses</h5>
                            <div class="ibox-tools">

                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-plus"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="#">New Address</a>
                                    </li>

                                </ul>
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="ibox-content">
                            <%--<ul class="list-group">



                                <li class="list-group-item">
                                    <span class="text-left">Current 

                                    </span>

                                    <span class="pull-right text-success">Mohali
                                &nbsp;
                                <span class="pull-right"><span class="fa fa-pencil"></span></span>
                                    </span>
                                </li>

                                <li class="list-group-item">
                                    <span class="text-left">Permanent 

                                    </span>



                                    <span class="pull-right text-success">Bhatinda
                                &nbsp;
                                <span class="pull-right"><span class="fa fa-pencil"></span></span>
                                    </span>
                                </li>

                            </ul>--%>

                            <h4 class="text-center">No Data Available</h4>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="ibox float-e-margins collapsed">
                        <div class="ibox-title">
                            <h5>Emergency Contact</h5>
                            <div class="ibox-tools">

                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-plus"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="#">New Emergency Contact</a>
                                    </li>

                                </ul>
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="ibox-content">
                            <%--<ul class="list-group">



                                <li class="list-group-item">
                                    <span class="text-left">Father 

                                    </span>

                                    <span class="pull-right text-success">Sohail Khan
                                &nbsp;
                                <span class="pull-right"><span class="fa fa-pencil"></span></span>
                                    </span>
                                </li>

                                <li class="list-group-item">
                                    <span class="text-left">Doctor 

                                    </span>



                                    <span class="pull-right text-success">Mahinder Kumar
                                &nbsp;
                                <span class="pull-right"><span class="fa fa-pencil"></span></span>
                                    </span>
                                </li>
                                <li class="list-group-item">
                                    <span class="text-left">Friend 

                                    </span>

                                    <span class="pull-right text-success">Suresh Patil
                                &nbsp;
                                <span class="pull-right"><span class="fa fa-pencil"></span></span>
                                    </span>
                                </li>

                            </ul>--%>

                            <h4 class="text-center">No Data Available</h4>
                        </div>
                    </div>
                </div>

                </div> 
            
            <div class="row">


                <div class="col-sm-4">
                    <div class="ibox float-e-margins collapsed">
                        <div class="ibox-title">
                            <h5>Education Details</h5>
                            <div class="ibox-tools">

                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-plus"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="#">Add New Detail</a>
                                    </li>
                                </ul>
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="ibox-content">
                            <%--<ul class="list-group">

                                <li class="list-group-item">
                                    <span class="text-left"><span class="fa fa-paperclip"></span>&nbsp; B. Com

                                    </span>

                                    <span class="pull-right text-success">2014 &nbsp; <i class="fa fa-pencil"></i>
                                    </span>
                                </li>
                                <li class="list-group-item">
                                    <span class="text-left"><span class="fa fa-paperclip"></span>&nbsp; Intermediate

                                    </span>

                                    <span class="pull-right text-success">2011 &nbsp; <i class="fa fa-pencil"></i>
                                    </span>
                                </li>
                                <li class="list-group-item">
                                    <span class="text-left"><span class="fa fa-paperclip"></span>&nbsp; Secondary School

                                    </span>

                                    <span class="pull-right text-success">2009 &nbsp; <i class="fa fa-pencil"></i>
                                    </span>
                                </li>

                            </ul>--%>

                            <h4 class="text-center">No Data Available</h4>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-4">
                    <div class="ibox float-e-margins collapsed">
                        <div class="ibox-title">
                            <h5>Past Employement</h5>
                            <div class="ibox-tools">

                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-plus"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="#">Add New Detail</a>
                                    </li>
                                </ul>
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                            <h4 class="text-center">No Data Available</h4>
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
    <script src="../js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>

    <script>

        var myDropzone, contactDetailLoaded = false;
        var gEmpId = <%= Session["EmpId"] %>;

        $(window).load(function () {

            //$("#select2_bankName").select2({
            //    placeholder: "Select a state",
            //    allowClear: true
            //});
            var empId = <%= Session["EmpId"] %>;
            
            loadBasicProfile(empId);
            loadFinancialDetails(empId);
            loadEmpIdentity(empId);     
         
            myDropzone = new Dropzone("#docUpload", {
                url: "../hn_SimpeFileUploader.ashx",
                maxFiles: 2,
                addRemoveLinks: false,
                success: function (file, response) {
                    var imgName = response;
                    file.previewElement.classList.add("dz-success");
                },
                error: function (file, response) {
                    if($.type(response) === "string")
                        var message = response; 
                    else
                        var message = response.message;
                    file.previewElement.classList.add("dz-error");
                    _ref = file.previewElement.querySelectorAll("[data-dz-errormessage]");
                    _results = [];
                    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                        node = _ref[_i];
                        _results.push(node.textContent = message);
                    }
                    return _results;
                }
            });
        });

        

        $('.collapse-link.contactDetailBox').click(function () {
            var ibox = $(this).closest('div.ibox');
            var button = $(this).find('i');
            if(!contactDetailLoaded){
            if (button.hasClass('fa-chevron-up')) {
                
                contactDetailLoaded = true;    
                loadContactDetails(gEmpId);
                
                }
            }
        });


        $(document).on("click", ".docLink", function () {

            Dropzone.autoDiscover = false;

            if ($(this).data('doctype') == 'pan') $("#docName").html("PAN No");
            if ($(this).data('doctype') == 'voter') $("#docName").html("Voter Id");
            if ($(this).data('doctype') == 'passport') $("#docName").html("Passport No.");
            if ($(this).data('doctype') == 'adhaar') $("#docName").html("Adhaar No.");
            if ($(this).data('doctype') == 'dl') $("#docName").html("Driving License.");

            myDropzone.removeAllFiles();
            myDropzone.options.url = "../hn_SimpeFileUploader.ashx?doctype=" + $(this).data('doctype');

            $('#DocNum').val('');

            $('#doctype').val($(this).data('doctype'));
            $(".EmpId").val(<%= Session["EmpId"] %>);
            
        });

        $(document).on("click", ".contactTypeLink", function () {

            $("#contactType").val($(this).data('contacttype'));
            $(".EmpId").val(<%= Session["EmpId"] %>);

            if ($(this).data('contacttype') == 1) {
                $("#contactLableText").html("Mobile No");
            }

            else {
                $("#contactLableText").html("Email Address");
                $("#contactData").attr("type", "email");
                $("#contactData").attr("title", "Please enter a valid email address");
            }
        });

        
        $( "#finDetailForm" ).submit(function( event ) {
            
            event.preventDefault();

            var finDetailJSON = {

                "EmpId"     :   $(".EmpId").val(),
                "BankName"  :   $("#iBankName").val(),
                "BranchName":   $("#iBranchName").val(),
                "AccountNum":   $("#iAccountNum").val(),
                "IFSCCode"  :   $("#iIFSCCode").val(),
                "SwiftCode":   $("#iSwiftCode").val()
            };
        
            $.ajax({
                type: "POST",
                url: "../PostFinDetail",
                data: finDetailJSON,
                success: function(result) { finDetSubmitSuccess(result); },
                datatype: "json"
            });
        });

        $( "#contactDetailForm" ).submit(function( event ) {
            
            event.preventDefault();

            $("#contactDetailFormSubmit").prop('disabled', true);

        sweetAlert({   
                title: $("#contactData").val(),   
                text: "Please check if your detail is correct. You cannot change this later!",   
                type: "warning",   
                showCancelButton: true,   
                confirmButtonColor: "green",   
                confirmButtonText: "Save",   
                closeOnConfirm: false 
            }, 
            function(isConfirm){   
                if(isConfirm)
                {
                    var contactDetailJSON = {

                        "EmpId"        :   $(".EmpId").val(),
                        "contactData"  :   $("#contactData").val(),
                        "contactType"  :   $("#contactType").val(),
                        "contactLable" :   $("#contactLable").val()
                    };
        
                    $.ajax({
                        type: "POST",
                        url: "../putEmpContact",
                        data: contactDetailJSON,
                        success: function(result) { 
                            $('#contactDetailsModal').modal('toggle'); 
                            $("#contactData").val('');
                            $("#contactDetailFormSubmit").prop('disabled', false);
                            sweetAlert("Data Saved!", "Your contact details are succesfully updated.", "success");
                            loadContactDetails(contactDetailJSON.EmpId)
                        },
                        datatype: "json"
                    });
                }
                else 
                {
                    $("#contactDetailFormSubmit").prop('disabled', false);
                }
            });
        });


        $( "#identityForm" ).submit(function( event ) {
            
            $("#identitySubmit").prop("disabled", true);
            event.preventDefault();

            var IDDetailJSON = {
                "EmpId"  : <%= Session["EmpId"] %>,
                "doctype": $("#doctype").val(),
                "DocNum" : $("#DocNum").val()
            };
        
            $.ajax({
                type: "POST",
                url: "../PostIDDetail",
                data: IDDetailJSON,
                success: function(result) { 

                    $("#identitySubmit").prop("disabled", false);
                    
                    if(result == 1) {
                        $('#identityModal').modal('toggle');
                        loadEmpIdentity(IDDetailJSON.EmpId);
                    }
                },
                datatype: "json"
            });
        });

        $( "#basicDetailForm" ).submit(function( event ) {
            
            $("#basicDetSubmit").prop("disabled", true);
            event.preventDefault();

            var basicDetailJSON = {

            "EmpId"        : <%= Session["EmpId"] %>,
            "FirstName"    : $("#FirstName").val(),
            "MiddleName"   : $("#MiddleName").val(),
            "LastName"     : $("#LastName").val(),
            "DOB"          : $("#DOB").val(),
            "FatherName"   : $("#FatherName").val(),
            "MotherName"   : $("#MotherName").val(),
            "Gender"       : $('#Gender input:radio:checked').val(),
            "BloodGroup"   : $('#BloodGroup input:radio:checked').val(),
            "MaritalStatus": $('#MaritalStatus input:radio:checked').val(),
            "SpouseName"   : $("#SpouseName").val()

            };
        
            $.ajax({
                type: "POST",
                url: "../PostBasicDetail",
                data: basicDetailJSON,
                success: function(result) { 

                $("#basicDetSubmit").prop("disabled", false);
                if(result == 1) {
                    sweetAlert("Success", "Details uploaded Succesfully!", "success");
                    }
                },
                datatype: "json"
            });
        });


        $('#finDetailsModal').on('shown.bs.modal', function () {

            $(".EmpId").val(<%= Session["EmpId"] %>);
            $("#iBankName").val($("#BankName").html());
            $("#iBranchName").val($("#BranchName").html());
            $("#iAccountNum").val($("#AccountNum").html());
            $("#iIFSCCode").val($("#IFSCCode").html());
            $("#iSwiftCode").val($("#SwiftCode").html());

        });


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
            url: "../hn_SimpeFileUploader.ashx?doctype=profile",
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

        $('#dob .input-group.date').datepicker({
            startView: 2,
            inline: true,
            keyboardNavigation: true,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            format: "MM dd, yyyy"
        });
        function loadContactDetails(empId) {
            var contactDetailURL = '../getEmpContact/'+ empId;

            $.getJSON(contactDetailURL, function (contactDetails) {
            
                var totItems = contactDetails.length;

                if(totItems > 0) {
                $("#contactDetailsContent").addClass('no-padding');
                $("#contactDetailNoData").hide('fade');
                var i = 0;
                var iconText;
                $("#contactDetailsList").html('');
                for (i=0;i<totItems;i++) {

                    if (contactDetails[i].contactTypeId == 1) {iconText = '<span class="fa fa-phone"></span>&nbsp;';} else {iconText = '<span class="fa fa-envelope"></span>&nbsp;';}
                    

                    $("#contactDetailsList").append('<li class="list-group-item"><span class="text-left">' + iconText + contactDetails[i].contactLable +'</span><span class="pull-right text-success">'+ contactDetails[i].contactData + '</span></li>');
                }
                }
            });
        }
         
        function loadBasicProfile(empId) {

            var basicProfileURL = '../GetFullProfileDetail/'+ empId;

            $.getJSON(basicProfileURL, function (userDetails) {
                
                if(!(userDetails === null)) {

                    $("#EmpName").html(userDetails[0].EmpName);
                    $("#EmpNum").html(userDetails[0].EmpNum);
                    $("#Email").html(userDetails[0].Email);
                    $("#PrimaryMobile").html(userDetails[0].PrimaryMobile);
                    $("#ClientName").html(userDetails[0].ClientName);
                    $("#DOJ").html(userDetails[0].DOJ);
                    $("#WorkLocation").html(userDetails[0].WorkLocation);
                    
                    if (!(userDetails[0].Salary === null)) {
                        $("#Salary").html('&#8377; ' + userDetails[0].Salary);
                    }

                    $("#Designation").html(userDetails[0].Designation);

                    $("#FirstName").val($.trim(userDetails[0].FirstName));
                    $("#MiddleName").val($.trim(userDetails[0].MiddleName));
                    $("#LastName").val($.trim(userDetails[0].LastName));

                    if (!(userDetails[0].DOB === null)) {
                        var lDOB = userDetails[0].DOB.split("/");
                        $('#dob .input-group.date').datepicker('update', new Date(lDOB[2],lDOB[1]-1,lDOB[0]));
                    }

                    $("#FatherName").val($.trim(userDetails[0].FatherName));
                    $("#MotherName").val($.trim(userDetails[0].MotherName));
                    $("#SpouseName").val($.trim(userDetails[0].SpouseName));
                    $(".EmpId").val(<%= Session["EmpId"] %>);

                    $("input[name=Gender][value=" + userDetails[0].Gender + "]").prop('checked', true);
                    $("input[name=BloodGroup][value=" + userDetails[0].BloodGroup + "]").prop('checked', true);
                    $("input[name=MaritalStatus][value=" + userDetails[0].MaritalStatus + "]").prop('checked', true);
                }                
            });
        }



        function closeModal() {
            $('#profileImageModal').modal('hide');
            $('#mainProfilePic').attr("src", '<%= System.Web.Configuration.WebConfigurationManager.AppSettings["ProfileURL"] + Session["EmpId"] %>');

        }

        function finDetSubmitSuccess(result) {
            if(result == 1) {
                loadFinancialDetails($(".EmpId").val());
                $('#finDetailsModal').modal('toggle');
            }
        }

        function loadFinancialDetails(empId) {
            var finDetailsURL = '../GetFinDetail/'+ empId;

            $.getJSON(finDetailsURL, function (finDetails) {

                if(!(finDetails === null)) {

                    $("#BankName").html(finDetails.BankName);
                    $("#BranchName").html(finDetails.BranchName);
                    $("#AccountNum").html(finDetails.AccountNum);
                    $("#IFSCCode").html(finDetails.IFSCCode);
                    $("#SwiftCode").html(finDetails.SwiftCode);
                }
            });
        }

        function loadEmpIdentity(empId) {
            var empIdentityURL = '../GetIdentity/'+ empId;

            $.getJSON(empIdentityURL, function (identityDet) {

                if(!(identityDet === null)) {

                    $("#DL").html(identityDet.DL);
                    $("#Adhaar").html(identityDet.Adhaar);
                    $("#Voter").html(identityDet.Voter);
                    $("#Passport").html(identityDet.Passport);
                    $("#Pan").html(identityDet.Pan);
                }
            });

        }


    </script>

</asp:Content>
