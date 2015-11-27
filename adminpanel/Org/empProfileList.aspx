<%@ Page Title="" Language="C#" MasterPageFile="~/Org/OrgTemplate1.Master" AutoEventWireup="true" CodeBehind="empProfileList.aspx.cs" Inherits="adminpanel.Org.empProfileList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<div class="row wrapper border-bottom white-bg page-heading">

        <div class="col-lg-12">
            <h2>My Profile</h2>
            <ol class="breadcrumb">
                <li>
                    <a href="ShowClients.aspx" title="Change Client" id="clientName"></a>
                </li>

                <li >
                    <span>Employees</span>
                </li>

                <li class="active">
                    <strong> Profile Details </strong>
                </li>

            </ol>
        </div>

    </div>

    <div class="row wrapper wrapper-content animated fadeIn">

        <div class=" col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>

                <div class="ibox-content">


                    <table class="table table-hover table-bordered" id="empTable">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Basic</th>
                                <th>Contact</th>
                                <th>Addresses</th>
                                <th>Bank</th>
                                <th>Identity</th>
                                <th>PastEmp</th>
                                <th>Qualification</th>
                                <th>Emergency</th>
                            </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                        </table>                </div>
                </div>
            </div>
        </div>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">

    <script>

        $("#clientName").html(localStorage.getItem("org_clientName"));

$(window).load(function () {

    var profilesURL = '../getProfilesByClient/' + localStorage.getItem("org_clientId");

    $.getJSON(profilesURL, function (employees) {

        var totItems = employees.length;
        var i;

        var ok = '<span class="fa fa-check text-success"></span>';
        var no = '<span class="fa fa-remove text-danger"></span>';

        for (i = 0; i < totItems;i++){

            var rowStr = "<tr>"
            var iconstr = '';

            rowStr += '<td><a href="#" title="Primary Mobile: ' + employees[i].PrimaryMobile + '" onclick="javascript:showProfile(' + employees[i].EmpId + ')">' + employees[i].EmpName + "</a></td>";

        if (employees[i].Basic_Detail == 0) iconstr = no; else iconstr = ok;
        rowStr += '<td class="text-center">' + iconstr + "</td>";

        if (employees[i].Contact_Detail == 0) iconstr = no; else iconstr = ok;
        rowStr += '<td class="text-center">' + iconstr + "</td>";

        if (employees[i].Addresses == 0) iconstr = no; else iconstr = ok;
        rowStr += '<td class="text-center">' + iconstr + "</td>";

        if (employees[i].Bank == 0) iconstr = no; else iconstr = ok;
        rowStr += '<td class="text-center">' + iconstr + "</td>";

        if (employees[i].Identity == 0) iconstr = no; else iconstr = ok;
        rowStr += '<td class="text-center">' + iconstr + "</td>";

        if (employees[i].PastEmp == 0) iconstr = no; else iconstr = ok;
        rowStr += '<td class="text-center">' + iconstr + "</td>";

        if (employees[i].Qualification == 0) iconstr = no; else iconstr = ok;
        rowStr += '<td class="text-center">' + iconstr + "</td>";

        if (employees[i].Emergency == 0) iconstr = no; else iconstr = ok;
        rowStr += '<td class="text-center">' + iconstr + "</td>";

        rowStr += "</tr>";

        $("#empTable > tbody").append(rowStr);

        }



    });
});

    function showProfile(empId) {
        localStorage.org_empid = empId;
        window.location.href = "empProfile.aspx";
        
    }
        
    </script>

</asp:Content>
