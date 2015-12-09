<%@ Page Title="Employee Profile" Language="C#" MasterPageFile="~/Employees/EmployeeTemplate.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="adminpanel.passwords.profile" %>

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
                    <h4 class="modal-title">Enter Document Number</h4>
                </div>
                <div class="modal-body ">

                    <div class="row">
                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="docName"></label>

                            <div class="col-lg-8">
                                <input type="hidden" id="doctype"/>
                                <input type="text"   class="form-control" id="DocNum" required="required"/>
                            </div>
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
    
    <div class="modal inmodal fade" id="idUploadModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Attachments</h4>
                </div>
                <div class="modal-body ">
                    
                    <div class="row text-center" id="pleaseWait"><i class="fa fa-spinner fa-pulse fa-4x"></i>
                        <br />
                        <span class="text-warning">Please Wait..!!</span>
                    </div>

                    <div class="row">
                    <div class="col-sm-12">
                    <div class="ibox float-e-margins" id="docIbox">
                        <div class="ibox-title">
                            <h5>Your Documents </h5>
                            
                        </div>
                        <div class="ibox-content">

                            <table class="table table-bordered" id="docTable">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Document</th>
                                    <th>Uploaded Time</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                
                                </tbody>
                            </table>

                        </div>
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
                    <button type="button" class="btn btn-white"  data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal inmodal fade" id="pastEmpModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
                    <form method="post" class="form-horizontal" id="pastEmpForm" >

            <div class="modal-content">
                
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Enter your Past Employement Details</h4>
                    <small class="font-bold">Enter the details of the companies you have worked earlier</small>
                </div>
                <div class="modal-body ">
                    <div class="row">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Company Name</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" required="required"  id="pCompany"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Designation</label>
                            
                              
                                <div class="col-lg-8">
                                <input type="text" class="form-control" required="required"  id="pDesignation"/>
                            </div>
                           
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Location</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control"  id="pLocation"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Salary</label>
                            <div class="col-lg-8">
                                <input type="number" class="form-control"  id="pSalary"/>
                                <span class="help-block">Last drawn salary</span>
                            </div>
                        </div>

                        
                        
                        <div class="form-group" id="pFromTo">
                            <label class="col-lg-3 control-label">Tenure</label>
                            <div class="col-lg-8">
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="input-sm form-control" name="start" id="pFromDate" />
                                    <span class="input-group-addon">to</span>
                                    <input type="text" class="input-sm form-control" name="end" id="pToDate" />
                                </div>
                    <span class="help-block">Start and End date of your job</span>

                            </div>
                            </div>

                        
                    
                    </div>
                </div>
                <div class="modal-footer">
                     <input type="submit" class="btn btn-success" id="pastEmpSubmit" />
                    <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                </div>
            

            </div>
                         </form>
        </div>
    </div>

    <div class="modal inmodal fade" id="emergencyDetailModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
                    <form method="post" class="form-horizontal" id="emergencyDetailForm" >

            <div class="modal-content">
                
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Enter your emergency contact</h4>
                    <small class="font-bold">Enter the detail of the person to be contacted in case of an emergency</small>
                </div>
                <div class="modal-body ">
                    <div class="row">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Contact Name</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" required="required"  id="eContactName"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Relation</label>
                            <div class="col-lg-8">
                                <select class="form-control" id="eContactRelation">
                                        <option selected="selected" value="0">Loading...</option>
                                    </select>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-3 control-label">Email</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control"  id="eEmail"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Mobile</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control"  id="eMobile"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Landline</label>
                            <div class="col-lg-3">
                                <input type="text" class="form-control" placeholder="STD Code" id="eStdCode"/>
                            </div>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" placeholder="Phone No" id="ePhoneNo"/>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <h4 class="text-info">Postal Address</h4>
                        <div class="hr-line-dashed"></div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Address 1</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" required="required"  id="eAddress1"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Address 2</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control"  id="eAddress2"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">City</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control" required="required"  id="eCity"/>
                            </div>
                            <label class="col-lg-1 control-label">State</label>
                            <div class="col-lg-3">
                                <input type="text" class="form-control"  id="eState"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-lg-3 control-label">Pincode</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control"  id="ePincode"/>
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

    <div class="modal inmodal fade" id="QualModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <form method="post" class="form-horizontal" id="QualDetailForm">

                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" data-dismiss="modal" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">Enter Your Qualification Details</h4>
                    </div>
                    <div class="modal-body ">
                        <div class="row">

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Qualification</label>
                                <div class="col-lg-8">
                                    <select class="form-control" id="qQualification">
                                        <option selected="selected" value="0">Loading...</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Degree</label>
                                <div class="col-lg-8">
                                    <select class="form-control" id="qDegree">
                                        <option selected="selected" value="0">Select Qualification First</option>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-lg-3 control-label">Stream </label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" id="qStream" />
                                    <span class="help-block">Like Computers / Electronics / Mechanical etc.</span>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Institution </label>

                                <div class="col-lg-8">
                                    <input type="text" class="form-control" id="qUniversity" />
                                    <span class="help-block text-muted">School / College / University Name</span>
                                </div>
                            
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Year </label>

                                <div class="col-lg-8">
                                    <input type="number" required="required" max="2015" min="1900" class="form-control" id="qYear" />
                                    <span class="help-block">Year in which you got qualified</span>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Percentage </label>

                                <div class="col-lg-8">
                                    <input type="number" required="required" min="0" max="99.99" class="form-control" id="qPercentage" />
                                    <span class="help-block">Percentage attained</span>

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

                                <input type="text" class="form-control" required="required"  id="iBankName"/>

                                <%--<select id="select2_bankName" class="form-control">
                                    <option></option>
                                    <option value="Bahamas">Bahamas</option>
                                    <option value="Bahrain">Bahrain</option>
                                   
                                </select>--%>


                            </div>
                        </div>
                                <%--<input type="hidden" class="EmpId"/>--%>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Branch</label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control" required="required" name="BranchName"  id="iBranchName"/>

                                
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Account Number</label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control" required="required"  id="iAccountNum"/>

                                
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">IFSC Code</label>

                            <div class="col-lg-8">

                                <input type="text" maxlength="11" required="required" class="form-control"  id="iIFSCCode"/>

                                
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
                            <label class="col-lg-3 control-label" id="contactLabelText"></label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control"  id="contactData"/>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Label</label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control"  id="contactLabel"/>
                                <span class="help-block m-b-none">Enter a short name to describe the contact detail (official, personal etc) </span>
                            </div>
                        </div>


                                <%--<input type="hidden" class="EmpId"/>--%>
                                <input type="hidden" id="contactType"/>

                    
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

    <div class="modal inmodal fade" id="addressModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
                    <form method="get" class="form-horizontal" id="addressForm" >
                        <input type="hidden" id="AddressType" />

            <div class="modal-content">
                
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Address</h4>
                </div>
                <div class="modal-body ">
                    <div class="row">

                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Address Name</label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control"  required="required" id="AddressName"/>

                                <span class="help-block m-b-none">Enter a short name to describe the address (like home, guest house etc) </span>
                                

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Address Line 1<sup>*</sup></label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control"  required="required" id="Address1"/>

                                <%--<select id="select2_bankName" class="form-control">
                                    <option></option>
                                    <option value="Bahamas">Bahamas</option>
                                    <option value="Bahrain">Bahrain</option>
                                   
                                </select>--%>


                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Address Line 2</label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control"   id="Address2"/>

                                
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">City<sup>*</sup></label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control" required="required"  id="City"/>

                                
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">State<sup>*</sup></label>

                            <div class="col-lg-8">
                                <input type="text" maxlength="11" class="form-control" required="required"  id="State"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Pincode<sup>*</sup></label>

                            <div class="col-lg-8">

                                <input type="text" class="form-control" maxlength="6"  id="Pincode"/>

                                
                            </div>
                        </div>
                    
                    </div>
                </div>
                <div class="modal-footer">
                        <input type="submit" id="addressFormSubmit" class="btn btn-success" />

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
            <div class="ibox float-e-margins collapsed">
                <div class="ibox-title">
                    <h5>Personal Details</h5>
                    <div class="ibox-tools">

                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                    <form method="get" class="form-horizontal" id="basicDetailForm" >
                                <%--<input type="hidden" class="EmpId"/>--%>

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
                    <div class="ibox float-e-margins">
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
                                    <span class="text-left">
                                        <a data-target="#idUploadModal" data-toggle="modal" data-doctype="dl" class="fa fa-paperclip docUploadLink"></a>
                                        &nbsp; Driving License
                                    </span>
                                    
                                    <span class="pull-right text-success">

                                    &nbsp; <a data-target="#identityModal" data-toggle="modal" data-doctype="dl" class="docLink"><i class="fa fa-pencil"></i></a>
                                    </span>

                                    <span class="pull-right text-success" id="DL">
                                    

                                    </span>
                                    
                                </li>
                                
                                <li class="list-group-item">
                                    <span class="text-left">
                                        <a data-target="#idUploadModal" data-toggle="modal" data-doctype="adhaar" class="fa fa-paperclip docUploadLink"></a>&nbsp; Adhaar Card

                                    </span>
                                    <span class="pull-right text-success">

                                    &nbsp; <a data-target="#identityModal" data-toggle="modal" data-doctype="adhaar" class="docLink"><i class="fa fa-pencil"></i></a>
                                    </span>

                                    <span class="pull-right text-success" id="Adhaar">
                                    <i class="fa fa-pencil"></i>

                                    </span>
                                </li>

                                <li class="list-group-item">
                                    <span class="text-left"><a data-target="#idUploadModal" data-toggle="modal" data-doctype="voter" class="fa fa-paperclip docUploadLink"></a>&nbsp; Voter Id

                                    </span>
                                    <span class="pull-right text-success">

                                    &nbsp; <a data-target="#identityModal" data-toggle="modal" data-doctype="voter" class="docLink"><i class="fa fa-pencil"></i></a>

                                    </span>

                                    <span class="pull-right text-success" id="Voter">
                                    <i class="fa fa-pencil"></i>

                                    </span>
                                </li><li class="list-group-item">
                                    <span class="text-left"><a data-target="#idUploadModal" data-toggle="modal" data-doctype="passport" class="fa fa-paperclip docUploadLink"></a>&nbsp; Passport No

                                    </span>
                                    
                                    <span class="pull-right text-success">

                                    &nbsp; <a data-target="#identityModal" data-toggle="modal" data-doctype="passport" class="docLink"><i class="fa fa-pencil"></i></a>

                                    </span>

                                    <span class="pull-right text-success" id="Passport">
                                    

                                    </span>
                                </li>
                                
                                <li class="list-group-item">
                                    <span class="text-left"><a data-target="#idUploadModal" data-toggle="modal" data-doctype="pan" class="fa fa-paperclip docUploadLink"></a>&nbsp; PAN No.

                                    </span>
                                    
                                    <span class="pull-right text-success">

                                    &nbsp; <a data-target="#identityModal" data-toggle="modal" data-doctype="pan" class="docLink"><i class="fa fa-pencil"></i></a>

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

                                    <li id="permAddLink"><a href="#"  class="addressType" data-toggle="modal" data-target="#addressModal" data-addresstype="1">Add Permanent Address</a></li>
                                    <li id="currAddLink" ><a href="#" class="addressType" data-toggle="modal" data-target="#addressModal"  data-addresstype="2">Add Current Address</a></li>
                                    <%--<li ><a href="#" data-toggle="modal" data-target="#addressModal"  data-addresstype="3">Add Office Address</a></li>--%>
                                    <%--<li ><a href="#" data-toggle="modal" data-target="#addressModal"  data-addresstype="4">Add Other Address</a></li>--%>
                                    
                                </ul>
                                <a class="collapse-link addressBox">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="ibox-content" id="addressContent">
                            <ul class="list-group" id="addressList">


                            </ul>

                            <h4 class="text-center" id="addressNoData">No Data Available</h4>
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
                                    <li><a href="#" data-target="#emergencyDetailModal" data-toggle="modal">Add New Emergency Contact</a>
                                    </li>

                                </ul>
                                <a class="collapse-link emerBox">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="ibox-content" id="emerContent">
                            <ul class="list-group" id="emerList">
                                </ul>

                            <h4 class="text-center" id="emerNoData">No Data Available</h4>
                        </div>
                    </div>
                </div>

                </div> 
            
            <div class="row">


                <div class="col-sm-4">
                    <div class="ibox float-e-margins collapsed">
                        <div class="ibox-title">
                            <h5>Qualification Details</h5>
                            <div class="ibox-tools">

                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-plus"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="#"  data-target="#QualModal" data-toggle="modal">Add New Qualification Detail</a>
                                    </li>
                                </ul>
                                <a class="collapse-link qualBox">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="ibox-content" id="qualContent">
                            <ul class="list-group" id="qualList">
                            </ul>
                            <h4 class="text-center" id="qualNoData">No Data Available</h4>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-4">
                    <div class="ibox float-e-margins collapsed">
                        <div class="ibox-title">
                            <h5>Past Employment</h5>
                            <div class="ibox-tools">

                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <i class="fa fa-plus"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-user">
                                    <li><a href="#" data-target="#pastEmpModal" data-toggle="modal">Add New Detail</a>
                                    <%--<li><a href="#" >Add New Detail</a>--%>
                                    </li>
                                </ul>
                                <a class="collapse-link pastEmpBox">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" id="pastEmpContent">
                            <ul class="list-group" id="pastEmpList">
                            </ul>
                            <h4 class="text-center" id="pastEmpNoData">No Data Available</h4>
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

        var myDropzone, contactDetailLoaded = false, addressLoaded = false, emerLoaded = false, qualLoaded = false, pastEmpLoaded = false;
        var iDocUploadJSON,gDocType,gDocName;
        var gEmpId = <%= Session["EmpId"] %>;

        $(window).load(function () {
            
            loadiDocUpload(gEmpId);
            loadBasicProfile(gEmpId);
            loadFinancialDetails(gEmpId);
            loadEmpIdentity(gEmpId);
         
            myDropzone = new Dropzone("#docUpload", {
                url: "../hn_SimpeFileUploader.ashx",
                init: function () {
                    this.on("complete", function (file) {
                        if (!(file.xhr.response === 'undefined')) {
                            closeUploadModal();
                        }
                    });
                },
                maxFiles: 1,
                maxFilesize: 2,
                acceptedFiles: 'image/*,.pdf',
                addRemoveLinks: true,
                
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

        
        $('#emergencyDetailModal').on('shown.bs.modal', function() {

            var relationsURL = '../getRelations/';
            if ( $('#eContactRelation option').length == 1) {
                $.getJSON(relationsURL, function (items) {
                    $.each(items, function (i, item) {
                        $('#eContactRelation').append($('<option>', { 
                            value: item.id,
                            text : item.RelationName 
                        }));
                    });
                    $('#eContactRelation option[value="0"]').text('Select Relation');
                });
            }
            else
            {
                $("#eContactRelation").val('0');
            }
        });

        $('#QualModal').on('shown.bs.modal', function() {
            var qualURL = '../getQual/';
            if ( $('#qQualification option').length == 1) {
                $.getJSON(qualURL, function (items) {
                    $.each(items, function (i, item) {
                        $('#qQualification').append($('<option>', { 
                            value: item.QualId,
                            text : item.QualName 
                        }));
                    });
                    $('#qQualification option[value="0"]').text('Select Qualification');
                });
            }
            else
            {
                $("#qQualification").val('0');
            }
        });

        $( "#qQualification" ).change(function() {
        
            if ($('#qQualification').val() != 0) {
            $('#qDegree option[value="0"]').text('Loading Degree...');

            var degreeURL = '../getDegreeByQual/' + $('#qQualification').val();
            
            $('#qDegree option').each(function() {
                if ( $(this).val() != 0 ) {
                    $(this).remove();
                }
            });

            if ( $('#qDegree option').length == 1) {
                $.getJSON(degreeURL, function (items) {
                    $.each(items, function (i, item) {
                        $('#qDegree').append($('<option>', { 
                            value: item.DegreeId,
                            text : item.DegreeName 
                        }));
                    });
                    $('#qDegree option[value="0"]').text('Select Degree');
                });
            }
            else
            {
                $("#qDegree").val('0');
            }
            }
            else
            {
                $('#qDegree option').each(function() {
                    if ( $(this).val() != 0 ) {
                        $(this).remove();
                    }
                });

                $('#qDegree option[value="0"]').text('Select Qualification First');
            }

        });


        $('.collapse-link.contactDetailBox').click(function () {
            var ibox = $(this).closest('div.ibox');
            var button = $(this).find('i');
            if(!contactDetailLoaded){
            if (button.hasClass('fa-chevron-up')) {
                
                contactDetailLoaded = true;    
                $("#contactDetailNoData").html('Fething Data...');

                loadContactDetails(gEmpId);
                
                }
            }
        });


        $('.collapse-link.addressBox').click(function () {
            var ibox = $(this).closest('div.ibox');
            var button = $(this).find('i');
            if(!addressLoaded){
                if (button.hasClass('fa-chevron-up')) {
                
                    addressLoaded = true;    
                    $("#addressNoData").html('Fething Data...');

                    loadAddress(gEmpId);
                }
            }
        });

        $('.collapse-link.emerBox').click(function () {
            var ibox = $(this).closest('div.ibox');
            var button = $(this).find('i');
            if(!emerLoaded){
                if (button.hasClass('fa-chevron-up')) {
                
                    emerLoaded = true;    
                    $("#emerNoData").html('Fething Data...');

                    loadEmergencyContacts(gEmpId);
                }
            }
        });

        $('.collapse-link.qualBox').click(function () {
            var ibox = $(this).closest('div.ibox');
            var button = $(this).find('i');
            if(!qualLoaded){
                if (button.hasClass('fa-chevron-up')) {
                
                    qualLoaded = true;    
                    $("#qualNoData").html('Fething Data...');

                    loadQualSummary(gEmpId);
                }
            }
        });

        $('.collapse-link.pastEmpBox').click(function () {
            var ibox = $(this).closest('div.ibox');
            var button = $(this).find('i');
            if(!pastEmpLoaded){
                if (button.hasClass('fa-chevron-up')) {
                
                    pastEmpLoaded = true;    
                    $("#pastEmpNoData").html('Fething Data...');

                    loadPastEmpSummary(gEmpId);
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

            $('#DocNum').val('');
            $('#doctype').val($(this).data('doctype'));

            $("#docIbox").hide();
            $("#docUpload").hide();
            
        });

        $(document).on("click", ".docUploadLink", function () {

            $("#pleaseWait").show();

            myDropzone.removeAllFiles();
            gDocName = docName();
            myDropzone.options.url = "../hn_SimpeFileUploader.ashx?doctype=" + $(this).data('doctype') + "&docname=" + gDocName;

            $('#doctype').val($(this).data('doctype'));

            updateDocList($(this).data('doctype'), null);

            $("#docIbox").hide();
            $("#docUpload").hide();
            
        });


        
        $(document).on("click", ".contactTypeLink", function () {

            $("#contactType").val($(this).data('contacttype'));

            if ($(this).data('contacttype') == 1) {
                $("#contactLabelText").html("Mobile No");
            }

            else {
                $("#contactLabelText").html("Email Address");
                $("#contactData").attr("type", "email");
                $("#contactData").attr("title", "Please enter a valid email address");
            }
        });

        
        $( "#finDetailForm" ).submit(function( event ) {
            
            event.preventDefault();

            var finDetailJSON = {

                "EmpId"     :   gEmpId,
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

        $( "#emergencyDetailForm" ).submit(function( event ) {
            
            event.preventDefault();

            var emergencyDetailJSON = {

                "EmpId"     :   gEmpId,
                "contactName"  :   $("#eContactName").val(),
                "relation":   $("#eContactRelation").val(),
                "emailAddress":   $("#eEmail").val(),
                "mobileNumber"  :   $("#eMobile").val(),
                "address1":   $("#eAddress1").val(),
                "address2":   $("#eAddress2").val(),
                "city":   $("#eCity").val(),
                "state":   $("#eState").val(),
                "pincode":   $("#ePincode").val(),
                "stdcode":   $("#eStdCode").val(),
                "phonenumber":   $("#ePhoneNo").val()

            };
        

            $.ajax({
                type: "POST",
                url: "../postEmergencyContact",
                //url: "../api/profile",

                data: emergencyDetailJSON,
                success: function(result) { 
                    emerDetSubmitSuccess(result);
                },
                datatype: "json"
            });
        });

        
        $( "#QualDetailForm" ).submit(function( event ) {
            
            event.preventDefault();

            var qualDetailJSON = {

                "EmpId"     :   gEmpId,
                "Qualification"  :   $("#qQualification").val(),
                "Degree":   $("#qDegree").val(),
                "Institution":   $("#qUniversity").val(),
                "Year":   $("#qYear").val(),
                "Stream":   $("#qStream").val(),
                "Percentage":   $("#qPercentage").val()
            };
        

            $.ajax({
                type: "POST",
                url: "../putQualDetails",

                data: qualDetailJSON,
                success: function(result) { 
                    qualDetSubmitSuccess(result);
                },
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

                        "EmpId"        :   gEmpId,
                        "contactData"  :   $("#contactData").val(),
                        "contactType"  :   $("#contactType").val(),
                        "contactLable" :   $("#contactLabel").val()
                    };
        
                    $.ajax({
                        type: "POST",
                        url: "../putEmpContact",
                        data: contactDetailJSON,
                        success: function(result) { 
                            $('#contactDetailsModal').modal('toggle'); 
                            $("#contactData").val('');
                            $("#contactLabel").val('');
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
                "EmpId"  : gEmpId,
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

            "EmpId"        : gEmpId, 
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

        
        $( "#pastEmpForm" ).submit(function( event ) {
            
            $("#pastEmpSubmit").prop("disabled", true);

            event.preventDefault();

            var pastEmpJSON = {

                "EmpId"        : gEmpId, 
                "Company"    : $("#pCompany").val(),
                "Designation"  : $("#pDesignation").val(),
                "Location"     : $("#pLocation").val(),
                "FromDate"     : $("#pFromDate").val(),
                "ToDate"   : $("#pToDate").val(),
                "Salary"   : $("#pSalary").val()
            };
        
            $.ajax({
                type: "POST",
                url: "../PostPastEmp",
                data: pastEmpJSON,
                success: function(result) { 

                    $("#pastEmpSubmit").prop("disabled", false);

                    pastEmpSubmitSuccess(result);

                    //if(result == 1) {
                    //}
                },
                datatype: "json"
            });
        });


        $('#finDetailsModal').on('shown.bs.modal', function () {

            $("#iBankName").val($.trim($("#BankName").html()));
            $("#iBranchName").val($.trim($("#BranchName").html()));
            $("#iAccountNum").val($.trim($("#AccountNum").html()));
            $("#iIFSCCode").val($.trim($("#IFSCCode").html()));
            $("#iSwiftCode").val($.trim($("#SwiftCode").html()));

        });

        $(document).on("click", ".addressType", function () {
        
            $("#AddressType").val($(this).data('addresstype'));

        });
            

        $( "#addressForm" ).submit(function( event ) {
            
            $("#addressFormSubmit").prop("disabled", true);
            event.preventDefault();

            var addressJSON = {

                "EmpId"           : gEmpId, 
                "Address1"        : $("#Address1").val(),
                "Address2"        : $("#Address2").val(),
                "City"            : $("#City").val(),
                "State"           : $("#State").val(),
                "Pincode"         : $("#Pincode").val(),
                "AddressType"     : $("#AddressType").val(),
                "AddressName"     : $("#AddressName").val()
            };
        
            $.ajax({
                type: "POST",
                url: "../putEmpAddress",
                data: addressJSON,
                success: function(result) { 

                    $("#addressFormSubmit").prop("disabled", false);

                    if(result == 1) {
                        
                        $("#Address1").val('');
                        $("#Address2").val('');
                        $("#City").val('');
                        $("#State").val('');
                        $("#Pincode").val('');
                        $("#AddressType").val('');
                        $("#AddressName").val('');

                        $("#addressModal").modal('toggle');
                        sweetAlert("Success", "Address Added Succesfully!", "success");
                        loadAddress(gEmpId);
                    }
                },
                datatype: "json"
            });
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
            maxFilesize: 2,
            acceptedFiles: 'image/*',
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

        $('#dob .input-group.date').datepicker({
            startView: 2,
            inline: true,
            keyboardNavigation: true,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true,
            format: "MM - yyyy"
        });

        $('#pFromTo .input-daterange').datepicker({
            keyboardNavigation: false,
            forceParse: false,
            startView: 2,
            autoclose: true,
            format: "MM - yyyy"
        });

        function updateDocList(doctype, docname)
        {
            var thisDocArray = new Array();
            var iDocUploadURL = '../getIDocUploads/'+ gEmpId;
           
            $.getJSON(iDocUploadURL, function (iDocUploadResult) {
                iDocUploadJSON = iDocUploadResult;

                for(i=0; i<iDocUploadJSON.length; i++) {

                    if(iDocUploadJSON[i].indexOf(doctype) == 0) {
                        thisDocArray.push(iDocUploadJSON[i]);
                    }
                }

                $("#pleaseWait").hide();

                if(thisDocArray.length > 0) 
                {
                    $("#docTable tbody").html('');
                    $("#docIbox").show();
                
                    var hrefLink = "https://ghrstorage.blob.core.windows.net/identity/" + gEmpId + "/";

                    if(thisDocArray.length >= 2){
                        $("#docUpload").hide();
                    }
                    else
                    {
                        $("#docUpload").show();
                    }

                    for(i=0;i<thisDocArray.length;i++) {

                        var docType = thisDocArray[i].split('/')[0];
                        var rawTime = thisDocArray[i].split('/')[1];

                        var year = rawTime.substring(0,4);
                        var month = rawTime.substring(4,6);
                        var date = rawTime.substring(6,8);
                        var hour = rawTime.substring(8,10);
                        var minute = rawTime.substring(10,12);

                        var uploadTime = date + "-" + month + "-" + year + " " + hour + ":" + minute;

                        var attachmentRow =  '<tr><td>' + (i+1) + '</td><td>' + docType + '</td><td>' + uploadTime +'</td><td><a target="_blank" href="' + hrefLink + thisDocArray[i] + '"><i class="fa fa-download" title="Download"></i></a> &nbsp; <a href="#" onclick="deleteIDoc(\'' + (gEmpId +'-' + thisDocArray[i]).replace(/\//g, "-").replace(".","_") + '\')"><i class="fa fa-trash" title="Delete"></i></a></td></tr>'

                        $("#docTable tbody").append(attachmentRow);
                    }
                }
                else
                {
                    $("#docIbox").hide();
                    $("#docUpload").show();
                }
            });
        }

        function deleteIDoc(docId) {
            
            sweetAlert(
                {   
                title: "Are you sure?",   
                text: "You will not be able to recover this file!",   
                type: "warning",   
                showCancelButton: true,   
                confirmButtonColor: "#DD6B55",   
                confirmButtonText: "Yes, delete it!",   
                closeOnConfirm: false 
                }, function(isConfirm){   
                    if (isConfirm) {
                        var deleteDocIdURL = '../deleteIDoc/'+ docId;

                        $.getJSON(deleteDocIdURL, function (result) {
                            if (result==1) {
                                $('#idUploadModal').modal('toggle'); 
                                sweetAlert("Deleted!", "Your file has been deleted.", "success");  
                            }
                            else {
                                sweetAlert("Unable to delete the document!", "Please try again later.", "error");  
                            }
                        });
                    } else {     
                        sweetAlert("Cancelled", "Your file is not deleted", "warning");   
                    }
                });
        }
      
        function loadQualSummary(empId) {
            var qualURL = '../getQualSummary/'+ empId;

            $.getJSON(qualURL, function (qualDetails) {
            
                var totItems = qualDetails.length;

                if(totItems > 0) {
                    $("#qualContent").addClass('no-padding');
                    $("#qualNoData").hide();
                    var i = 0;
                    var iconText = '';
                    $("#qualList").html('');
                    for (i=0;i<totItems;i++) {

                        //if (addressDetails[i].AddressTypeId == 1) {iconText = '<span class="fa fa-home"></span>&nbsp;';} else {iconText = '<span class="fa fa-building"></span>&nbsp;';}
                
                        $("#qualList").append('<li class="list-group-item"><span class="text-left">' + iconText + qualDetails[i].DegreeName +'</span><span class="pull-right text-success">'+ qualDetails[i].Year + '</span></li>');
                    }
                }
                else
                {
                    $("#qualNoData").html('No Data Available');
                }
            });
        }
      
        function loadPastEmpSummary(empId) {

            var pastEmpContactURL = '../getpastEmpSummary/'+ empId;

            $.getJSON(pastEmpContactURL, function (pastEmpDetails) {
            
                var totItems = pastEmpDetails.length;

                if(totItems > 0) {
                    $("#pastEmpContent").addClass('no-padding');
                    $("#pastEmpNoData").hide();
                    var i = 0;
                    var iconText = '';
                    $("#pastEmpList").html('');
                    for (i=0;i<totItems;i++) {

                        //if (addressDetails[i].AddressTypeId == 1) {iconText = '<span class="fa fa-home"></span>&nbsp;';} else {iconText = '<span class="fa fa-building"></span>&nbsp;';}
                
                        $("#pastEmpList").append('<li class="list-group-item"><span class="text-left">' + iconText + pastEmpDetails[i].companyName +'</span><span class="pull-right text-success">'+ pastEmpDetails[i].designation + '</span></li>');
                    }
                }
                else
                {
                    $("#pastEmpNoData").html('No Data Available');
                }
            });

        }        

        function loadEmergencyContacts(empId) {
            var emerContactURL = '../getEmergencySummary/'+ empId;

            $.getJSON(emerContactURL, function (emerDetails) {
            
                var totItems = emerDetails.length;

                if(totItems > 0) {
                    $("#emerContent").addClass('no-padding');
                    $("#emerNoData").hide();
                    var i = 0;
                    var iconText = '';
                    $("#emerList").html('');
                    for (i=0;i<totItems;i++) {

                        //if (addressDetails[i].AddressTypeId == 1) {iconText = '<span class="fa fa-home"></span>&nbsp;';} else {iconText = '<span class="fa fa-building"></span>&nbsp;';}
                
                        $("#emerList").append('<li class="list-group-item"><span class="text-left">' + iconText + emerDetails[i].ContactName +'</span><span class="pull-right text-success">'+ emerDetails[i].RelationName + '</span></li>');
                    }
                }
                else
                {
                    $("#emerNoData").html('No Data Available');
                }
            });
        }
      

        function loadAddress(empId) {
            var addressURL = '../getEmpShortAddressList/'+ empId;

            $.getJSON(addressURL, function (addressDetails) {
            
                var totItems = addressDetails.length;

                if(totItems > 0) {
                    $("#addressContent").addClass('no-padding');
                    $("#addressNoData").hide();
                    var i = 0;
                    var iconText;
                    $("#addressList").html('');
                    for (i=0;i<totItems;i++) {

                        if (addressDetails[i].AddressTypeId == 1) {iconText = '<span class="fa fa-home"></span>&nbsp;';} else {iconText = '<span class="fa fa-building"></span>&nbsp;';}
                
                        $("#addressList").append('<li class="list-group-item"><span class="text-left">' + iconText + addressDetails[i].AddressName +'</span><span class="pull-right text-success">'+ addressDetails[i].City + '</span></li>');
                    }
                }
                else
                {
                    $("#addressNoData").html('No Data Available');
                }
            });
        }
        
         
        function loadContactDetails(empId) {
            var contactDetailURL = '../getEmpContact/'+ empId;

            $.getJSON(contactDetailURL, function (contactDetails) {
            
                var totItems = contactDetails.length;

                if(totItems > 0) {
                $("#contactDetailsContent").addClass('no-padding');
                $("#contactDetailNoData").hide();
                var i = 0;
                var iconText;
                $("#contactDetailsList").html('');
                for (i=0;i<totItems;i++) {

                    if (contactDetails[i].contactTypeId == 1) {iconText = '<span class="fa fa-phone"></span>&nbsp;';} else {iconText = '<span class="fa fa-envelope"></span>&nbsp;';}
                    $("#contactDetailsList").append('<li class="list-group-item"><span class="text-left">' + iconText + contactDetails[i].contactLable +'</span><span class="pull-right text-success">'+ contactDetails[i].contactData + '</span></li>');
                    }
                }
                else
                {
                    $("#contactDetailNoData").html('No Data Available');
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

                    $("input[name=Gender][value=" + userDetails[0].Gender + "]").prop('checked', true);
                    $("input[name=BloodGroup][value=" + userDetails[0].BloodGroup + "]").prop('checked', true);
                    $("input[name=MaritalStatus][value=" + userDetails[0].MaritalStatus + "]").prop('checked', true);
                }                
            });
        }

        function closeModal() {
            $('#profileImageModal').modal('hide');
            $('#mainProfilePic').attr("src", '<%= System.Web.Configuration.WebConfigurationManager.AppSettings["ProfileURL"] + Session["EmpId"] %>');
            $('#smallProfileImg').attr("src", '<%= System.Web.Configuration.WebConfigurationManager.AppSettings["ProfileURL"] + Session["EmpId"] + "?" + DateTime.Now.ToString("ddMMyyyyhhmmsstt") %>');
        }

        function finDetSubmitSuccess(result) {
            if(result == 1) {
                loadFinancialDetails(gEmpId);
                $('#finDetailsModal').modal('toggle');
            }
        }

        function emerDetSubmitSuccess(result) {
            if(result == 1) {
                loadEmergencyContacts(gEmpId);
                $('#emergencyDetailModal').modal('toggle');
            }
        }

        function qualDetSubmitSuccess(result) {
            if(result == 1) {
                loadQualSummary(gEmpId);
                $('#QualModal').modal('toggle');
            }
        }

        function pastEmpSubmitSuccess(result)
        {
            if(result == 1) {
                loadPastEmpSummary(gEmpId);
                $('#pastEmpModal').modal('toggle');
                sweetAlert("Success", "Past Employee Details Saved Succesfully!", "success");
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

        function loadiDocUpload(empId)
        {
            var iDocUploadURL = '../getIDocUploads/'+ empId;
           
            $.getJSON(iDocUploadURL, function (iDocUploadResult) {
                iDocUploadJSON = iDocUploadResult;
            });
        }

        function zeroPad(num, places) {
            var zero = places - num.toString().length + 1;
            return Array(+(zero > 0 && zero)).join("0") + num;
        }

        function docName() {
            
            var d = new Date();
            return (d.getFullYear() + zeroPad((d.getMonth()+1),2) + zeroPad(d.getDate(),2) + zeroPad(d.getHours(),2) +  zeroPad(d.getMinutes(),2) +  zeroPad(d.getSeconds(),2));
        
        }

        function closeUploadModal() {
            //alert(result);
            $('#idUploadModal').modal('toggle'); 

            sweetAlert("Document Saved!", "Your document is succesfully uploaded.", "success");

        }

    </script>

</asp:Content>
