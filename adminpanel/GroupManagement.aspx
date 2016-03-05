<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupManagement.aspx.cs" MasterPageFile="~/UbietyMenu.Master" Title="Manage Groups" Inherits="adminpanel.GroupManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="Server">
    <link href="css/plugins/autocomplete/jquery.auto-complete.css" rel="stylesheet" />
    <style>
        .managerstar {
           color:#DAA520;
        }

        .employeestar {
            color:#e7e6e6;
}
    </style>
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h1>Group Management</h1>
            <ol class="breadcrumb">
                <li>
                    <h4><%= Session["ClientName"] %></h4>
                </li>
            </ol>
        </div>
        <div class="col-lg-2">
        </div>
    </div>
    <br />
    <div class="wrapper-content">
        <div class="row">
            <div class="col-lg-2 col-md-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Divisions</h5>
                        <div class="ibox-tools">
                            <a data-toggle="modal" data-target="#groupTypeModal" title="Add a new Division">
                                <i class="fa fa-plus"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content no-padding">
                        <ul class="list-group" id="groupTypeList"></ul>
                    </div>
                </div>
            </div>
            <div style="display:none" id="groupsDivContainer">
            <div class="col-lg-10 col-md-9">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5 id="groupsTitle"></h5>
                        <div class="ibox-tools">
                                <a class="product-name open-groupModal" data-grouptypeid="" data-grouptypename="" id="aGroupDiv" data-toggle="modal" data-target="#groupModal" title="Add a new Group">
                
                                <i class="fa fa-plus"></i>
                            </a>
                            
                        </div>
                    </div>

                    <div class="ibox-content">

                        <div class="text-center" id="groupsLoadingSpinner">
                            <span class="fa fa-spinner fa-pulse fa-2x"></span>

                        </div>
                        <div class="row">
                            <div id="groupsDivBox"></div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
      <div style="display:none" id="employeesContainer">  
          <div id="addEmployeeFormDiv">
           
        </div>
        
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">

                        <h5>Employees</h5>

                        <div class="ibox-content">
                            <div id="loadingSpinner" class="text-center" style="display: none">
                                <span class="fa fa-2x fa-pulse fa-spinner"></span>
                            </div>
                            <div class="row">
                                <div id="empBoxes">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>

    <div class="modal inmodal" id="groupTypeModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated fadeIn">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Add Division</h4>
                    <small>Use this screen to add a new Division</small>
                </div>
                <div class="modal-body">
                    <div class="text-center">
                        <form id="groupTypeForm" action="api/GroupTypes" class="m-t form-horizontal" role="form">
                            <input type="text" placeholder="Division Name" class="form-control" id="groupTypeName" name="groupTypeName" />
                            <br />
                            <button type="submit" id="btnAddGroupType" data-loading-text="<i class='fa fa-spinner fa-pulse'></i>" class="btn btn-primary ">Create</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal inmodal" id="groupTypeEditModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated fadeIn">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Edit Division</h4>
                    <small>Use this screen to set manager detail</small>
                </div>
                <div class="modal-body">
                    <div class="text-center">
                        <form id="groupTypeEditForm" class="m-t form-horizontal" role="form">
                            <div class="form-group">

                            <input type="text" placeholder="Division Name" readonly="readonly" class="form-control" id="groupTypeEditName" name="groupTypeName" />
                                </div>
                            <div class="form-group">

                                 <select class="form-control" id="groupTypeManagerName">
                                        <option selected="selected" value="0">Loading...</option>
                                    </select>

                                </div>

                            <br />
                            <button type="button" id="btnEditGroupType" onclick="updateGroupId()" data-loading-text="<i class='fa fa-spinner fa-pulse'></i>" class="btn btn-primary ">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal inmodal" id="groupModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated fadeIn">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Add Group</h4>
                    <small>Use this screen to add a new group under <span class="text-info font-bold" id="groupNameSpan"></span></small>
                </div>
                <div class="modal-body">

                    <div class="text-center">
                        <form id="groupForm" action="api/Groups" class="m-t form-horizontal" role="form">
                            <input type="hidden" id="groupTypeId" />
                            <input type="text" placeholder="Group Name" class="form-control" id="groupName" name="groupName" />
                            <br />
                            <button type="submit" id="btnAddType" class="btn btn-primary ">Add New Group</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="js/plugins/validate/jquery.validate.min.js"></script>

    <script src="js/plugins/toastr/toastr.min.js"></script>
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet" />
    
    <script src="js/plugins/autocomplete/jquery.auto-complete.min.js"></script>


    <script>

        var sessionClientId = <%= Session["ClientId"] %>;
        var ggroupTypeId = '';
        var ggroupTypeName = '';
        var selectedEmpid = 0;
        

        $( document ).ready(function() {
            $('#groupsLoadingSpinner').hide();
            $('#groupsTitle').html('Select Division');
            loadGroupTypes(true);    

            //$('#groupTypeEditModal').on('shown.bs.modal', function() {
            //    alert(this.getAttribute("data-test"));

            //});


        });
        
        function loadGroupTypes(initial) {
            var groupTypesUrl = 'api/groupTypes/of/' + sessionClientId;

            $.getJSON(groupTypesUrl, function (grpTypJSON) {

                var totGrpTypJSON = grpTypJSON.length;

                if(!initial){
                    $('#groupTypeList').empty();
                }

                for (i=0;i<totGrpTypJSON;i++){
                    $('#groupTypeList').append('<li id="groupTypeli' + grpTypJSON[i].Id + '" class="list-group-item">  <a onclick = "showGroups(this)"  data-grouptype-id="' + grpTypJSON[i].Id + '" data-grouptype-name="' + grpTypJSON[i].GroupType1 + '" class="faArrowIcon">' + grpTypJSON[i].GroupType1  + '</a> <a  id="groupTypeEdit" data-toggle="modal" data-target="#groupTypeEditModal" data-grouptype-id="' + grpTypJSON[i].Id + '" data-grouptype-name="' + grpTypJSON[i].GroupType1 + '"  title="Manage Division" class="small pull-right fa fa-gear"></a><br/> </li>');
                }
            });
        }

        $(document).on("click", ".open-groupModal", function () {
            var groupTypeId = $(this).data('grouptypeid');
            $(".modal-body #groupTypeId").val( groupTypeId );
            document.getElementById("groupNameSpan").innerHTML = $(this).data('grouptypename');
        });


        $(document).on("click", "#groupTypeEdit", function () {
            //
            $('#groupTypeEditName').val($(this).data('grouptype-name'));


            var managerNameURL = "getSecondLevelManager/" + <%= Session["ClientId"] %>;

            if ( $('#groupTypeManagerName option').length == 1) {
                $.getJSON(managerNameURL, function (items) {
                    $.each(items, function (i, item) {
                        $('#groupTypeManagerName').append($('<option>', { 
                            value: item.EmpId,
                            text : item.EmpName 
                        }));
                    });

                    $('#groupTypeManagerName option[value="0"]').text('Select Manager');
                });
            }
            else
            {
                $("#groupTypeManagerName").val('0');
            }
        });

        function updateGroupId() {

            var managerId = $('#groupTypeManagerName').val();

            if (managerId != 0) {

            var managerUpdateURL = "editGroupTypeManager/" + managerId + "/" + ggroupTypeId;

            $.ajax({
                url: managerUpdateURL,
                type: "GET",
                
                success: function(data) {
                    if (data==1) {
                        alert("Manager Succesfully Updated");
                    }
                    else{
                        alert("Unknown Error, Please try again later!!");
                    }
                }
            });

            }
            else {
                alert("Please select manager");
            }

        }

        function showGroups(groupType) {
            $('#employeesContainer').fadeOut(500,'linear');
            $('#groupsDivContainer').fadeIn(500,'linear');

            $('#empBoxes').empty();

            var groupTypeId = '';
            var groupTypeName = '';

            var reload = false;
            
            if (typeof groupType === 'undefined') {
                groupTypeId = ggroupTypeId;
                groupTypeName = ggroupTypeName;
                reload = true;
            }
            else
            {
                ggroupTypeId = groupType.getAttribute("data-grouptype-id");
                groupTypeId = ggroupTypeId;

                ggroupTypeName = groupType.getAttribute("data-grouptype-name");
                groupTypeName = ggroupTypeName;
            }

            var groupsUrl = 'api/groups/of/' + groupTypeId;

            $('#groupsDivBox').empty();
            $('#groupsLoadingSpinner').show();
            if (!reload)
                $('#groupsTitle').html('Loading groups of ' + groupType.getAttribute("data-grouptype-name") + '...');

            $.getJSON(groupsUrl, function (grpsJSON) {
                $('#groupsLoadingSpinner').hide();
                if (!reload)
                    $('#groupsTitle').html('Groups of ' + groupType.getAttribute("data-grouptype-name"));

                var totGrpsJSON = grpsJSON.length;

                for (i=0;i<totGrpsJSON;i++) {
                    $('#groupsDivBox').append('<div class="col-lg-3"> <div class="ibox"><div class="ibox-content product-box"> <div class="row vertical-align text-center "> <span  onclick="populateGroupEmployees(' + grpsJSON[i].Id + ')" class="product-name ">' + grpsJSON[i].GroupName + '</span></div> </div></div></div>'); 
                }

                $("#aGroupDiv").data( 'grouptypeid', groupTypeId );
                $("#aGroupDiv").data( 'grouptypename', groupTypeName );
            });
        }

        $("#groupTypeForm").validate({
            rules: {
                groupTypeName: {
                    required: true
                }
            },
            submitHandler: function (form) {
                     
                $('#btnAddGroupType').prop('disabled', true);

                var posting = $.post('api/GroupTypes', { clientId: sessionClientId, grouptype1: $('#groupTypeName').val() });

                posting.done(function (data) {
                    if (data.Id == 0) {
                        toastr.error('', 'Error creating Division');
                    }
                    else
                    {
                        $('#btnAddGroupType').prop('disabled', false);
                        $('#groupTypeModal').modal('toggle');
                        $('#groupTypeForm').trigger("reset");
                        toastr.success('', 'Division created succesfully')
        
                        loadGroupTypes(false);
                    }
                });
            }
        });
    
        $("#groupForm").validate({
            rules: {
                groupName: {
                    required: true
                }
            },
            submitHandler: function (form) {
                     
                $('#btnAddGroup').prop('disabled', true);

                var posting = $.post('api/Groups', { GroupTypeId: $('#groupTypeId').val(), GroupName: $('#groupName').val() });


                posting.done(function (data) {
                    if (data.Id == 0) {
                        alert("Error creating Group");
                    }
                    else
                    {
                        $('#btnAddGroup').prop('disabled', false);
                        $('#groupModal').modal('toggle');
                        $('#groupForm').trigger("reset");
                        toastr.success('', 'Group created succesfully')
                        showGroups();
                    }
                });
            }
        });

        
        function populateGroupEmployees(groupId) {
            $('#employeesContainer').fadeIn(500,'linear');

            $('#addEmployeeFormDiv').empty();

            $('#addEmployeeFormDiv').append('<div class="row"> <div class="col-lg-6"> <div class="input-group"> <input type="text" placeholder="Add Employee" id="empName" name="empName" class="form-control"/> <span class="input-group-btn"> <button class="btn btn-primary" onclick="addEmployeeToGroup('+ groupId +')" type="button" >Add</button> </span> </div></div><div class="col-lg-6"><span class="pull-right"><input type="button" class="btn btn-success" onclick="showCreateEmployee()" value="New Employee"/></span></div></div>');

            $("#empName").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: "api/clientEmp/of/" + sessionClientId + "/notingroup/" + groupId,
                        type: "GET",
                        dataType: "json",
                        data: {
                            term: $("#empName").val()
                        },
                        success: function(data) {
                            var array = $.map(data, function(item) {
                                return {
                                    label: item.EmpName + ' (' + item.EmpNum + ')',
                                    id: item.EmpId
                                };
                            });
                            response($.ui.autocomplete.filter(array, request.term));
                        }
                        
                    });
                },
                minLength: 0,
                select: function(event, ui){
                    selectedEmpid = ui.item.id;
                },
                focus: function(event, ui) {
                    $("#empName").val(ui.item.label);
                }
            });

            $('#loadingSpinner').show();
            $('#empBoxes').empty();
            $.ajax({
                url: "api/groupEmployees/" + groupId,
                type: "Get",
                success: function (data) {

                    $('#loadingSpinner').remove();

                    for (var i = 0; i < data.length; i++) {
                        
                        var str = '<a id="empStar' + data[i].EmpId + '" class="employeestar" onclick="managerToggle(' + data[i].EmpId + ', ' + groupId + ')"><span  class="pull-right fa fa-star "></span></a>';
                        var empBoxHTML = '<div class="col-md-4 col-lg-3 col-sm-6"> <div  class="ibox"> <div class="ibox-content product-box"> <div class="row"> <div class="col-lg-3"> <img src="img/pp/' + data[i].ProfilePic + '.png" style="width:80px; height:120px"/></div><div class="col-lg-9"> <div class="product-desc"> <small class="text-muted">' + data[i].EmpNum + '</small><span class="pull-right"><a onclick="removeEmpFromGrp(' + data[i].EmpId + ', ' + groupId + ')"> <span class="fa fa-trash"></a></span><span class="product-name">' + data[i].EmpName + '</span> <div class="small m-t-xs"> ' + data[i].Email + ' </div><div class="small m-t-xs"> ' + data[i].PrimaryMobile + ' </div>' + str + '</div></div></div></div></div></div>';
                        
                        $('#empBoxes').append(empBoxHTML);
                    }

                    $.ajax({
                        url: "api/getIncharge/" + groupId,
                        type: "Get",
                        success: function (data) {
                            for (var i = 0; i < data.length; i++) {
                                $('#empStar' + data[i].InchargeId).removeClass('employeestar');
                                $('#empStar' + data[i].InchargeId).addClass('managerstar');
                            }
                        }
                    });
                }
            });
        }

        function managerToggle(EmpId, GroupId) {

            if( $('#empStar'+EmpId).hasClass('employeestar')) {

            $.ajax({
                url: 'api/make/' + EmpId + '/inchargeof/' + GroupId,
            }).done(function() {


                $('#empStar'+EmpId).removeClass('employeestar');
                $('#empStar'+EmpId).addClass('managerstar');

                toastr.success('', 'Succesfully made the employee as manager');

            });
           }
           else
           {
               $.ajax({
                       url: 'api/remove/' + EmpId + '/inchargeof/' + GroupId,

               }).done(function() {

                   $('#empStar'+EmpId).removeClass('managerstar');
                   $('#empStar'+EmpId).addClass('employeestar');

                   toastr.success('', 'Succesfully removed the employee as manager');

               });
           }
        }

        function addEmployeeToGroup(GroupId) {
            $.ajax({
                url: 'api/addEmployee/' + selectedEmpid + '/to/' + GroupId,
            }).done(function() {
                toastr.success('', 'Succesfully added employee to group');
                populateGroupEmployees(GroupId);
            });
        }

        function removeEmpFromGrp(empId, groupId) {
            $.ajax({
                url: 'api/removeEmployee/' + empId + '/from/' + groupId,
                success: function (data) {
                    toastr.success('', 'Succesfully removed employee from group');
                    populateGroupEmployees(groupId);
                }
            });
        }

        function showCreateEmployee() {
            localStorage.setItem("fromGrpMngmt","1");
            window.location = "CreateEmployee.aspx";

        }
            </script>

</asp:Content>

