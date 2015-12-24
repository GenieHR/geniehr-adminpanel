<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Title="Employee Home" MasterPageFile="~/Employees/EmployeeTemplate.Master" Inherits="adminpanel.passwords.home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

         <div class="row  border-bottom white-bg dashboard-header">
             
                    <div class="row">
                        <h2>Welcome <%= Session["loggedinuserName"] %></h2>
                        <small> <a href="profile.aspx">Continue to your profile</a></small>
                    </div>
             <div class="row col-sm-4">
             <%--<ul class="list-group clear-list m-t">
                            <li class="list-group-item fist-item">
                                <span class="pull-right">
                                    09:00 pm
                                </span>
                                <span class="label label-success">1</span> Please contact me
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    10:16 am
                                </span>
                                <span class="label label-info">2</span> Sign a contract
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    08:22 pm
                                </span>
                                <span class="label label-primary">3</span> Open new shop
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    11:06 pm
                                </span>
                                <span class="label label-default">4</span> Call back to Sylvia
                            </li>
                            <li class="list-group-item">
                                <span class="pull-right">
                                    12:00 am
                                </span>
                                <span class="label label-primary">5</span> Write a letter to Sandra
                            </li>
                        </ul>
           --%>  

             </div>
            </div>
    <blockquote>
    Welcome to the Self Service Portal of <span class="text-info" id="orgName"></span>
<br />
<br />
    <span class="text-danger">An updated profile and contact information helps us in serving you better.</span>
<br />
<br />

    This portal allows you to view all your information and change some of your information. 
        You can view and change the following
        <br />
        <br />
    <ol>
        <li> Your historical pay statements. </li>
        <li> Your profile and education details. </li>
        <li> Addresses and contact information. </li>
        <li> Education upgradation. </li>
        <li> Your bank details. </li>
        <li> Your pan number. </li>
    </ol>

    Hope you will find the portal useful and will keep your details updated. 

<br />
<br />
Thanks and enjoy the experience

        </blockquote>
<%--In case of any technical difficulties, pls contact us on laks@geniehr.com
Alternately you can also reach us at +91-8888888--%>



</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="javascriptPart" runat="server">
    <script>

        $.getJSON("../getEmpOrgId/<%= Session["EmpId"] %>", function (data) {
            $("#orgName").html(data);
        });

    </script>
</asp:Content>