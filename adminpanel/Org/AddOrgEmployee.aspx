<%@ Page Title="Add Employee" Language="C#" MasterPageFile="~/Org/OrgManager.Master" AutoEventWireup="true" CodeBehind="AddOrgEmployee.aspx.cs" Inherits="adminpanel.Employees.AddOrgEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="col-sm-12">
            <form method="get" class="form-horizontal">
                <div class="ibox">
                        <div class="ibox-title">
                            <h5>Add New Employee</h5>
                        </div>
                        <div class="ibox-content">
                            
                            
                            <div class="hr-line-dashed"></div>
                            <h4 class="text-info">Employee Details</h4>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">Employee Name</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control"  id="pCompany" />
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Contact No.</label>

                                   <div class="col-sm-5">
                                        <div class="input-group m-b">
                                            <span class="input-group-addon">+91</span>
                                            <input type="number" class="form-control"/>
                                        </div>
                                    </div>
                            </div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">Email</label>


                                    <div class="col-sm-5">
                                        <div class="input-group m-b">
                                            <input type="text" class="form-control"/>
                                            <span class="input-group-addon">@</span>
                                            <select class="form-control">
                                                <option>gmail.com</option>
                                                <option>yahoo.com</option>
                                                <option>yahoo.co.in</option>
                                            </select>
                                        </div>
                                    </div>
                                    </div>
                             
                            
                            
                           <div class="form-group">

                                <label class="col-sm-2 control-label">Designation</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control"   />
                                </div>
                            </div>
                            
                        </div>

                    </div>
    </form>

        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">
</asp:Content>
