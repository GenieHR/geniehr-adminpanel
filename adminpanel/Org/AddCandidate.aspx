<%@ Page Title="Add Candidate" Language="C#" MasterPageFile="~/Org/OrgTemplate.Master" AutoEventWireup="true" CodeBehind="AddCandidate.aspx.cs" Inherits="adminpanel.Org.ATS.AddCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <br />
    <div class="row">
        <%--<div class="col-sm-12">

        <div class="text-center">

            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-user"></i>&nbsp; Personal </button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-phone" ></i>&nbsp; Contact </button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-mortar-board"></i>&nbsp; Skills & Qualification</button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-building"></i>&nbsp; Employment</button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-pencil"></i>&nbsp; Remarks</button>

        </div>
    </div>--%>


        <div class="col-sm-12">
            <form method="get" class="form-horizontal">
                <div class="ibox">
                        <div class="ibox-title">
                            <h5>Add New Candidate</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="hr-line-dashed"></div>
                            <h4 class="text-info">Job Details</h4>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">

                                <label class="col-sm-2 control-label">Job Id</label>
                                <div class="col-sm-5">
                            
                            <select class="form-control" id="jobId">
                                                <option value="0">Select</option>
                                                <option value="2">Dragon_Rigger_001</option>
                                                <option value="1">Dragon_Engineer_257</option>
                                            </select>
                                    </div>
                                </div>
                            <div class="form-group">

                                <label class="col-sm-2 control-label">Company</label>
                                <div class="col-sm-5">
                            
                                     <input class="form-control" readonly="readonly" id="Company" ></input>

                                </div>
                                </div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">No. of Openings</label>
                                <div class="col-sm-5">
                            
                                     <input class="form-control" readonly="readonly"  id="Openings" ></input>

                                </div>

                                </div>

                            
                            <div class="hr-line-dashed"></div>
                            <h4 class="text-info">Candidate Details</h4>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">

                                <label class="col-sm-2 control-label">Candidate Name</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control"  id="pCompany" />
                                </div>
                            </div>
                            <div class="form-group">

                                <label class="col-sm-2 control-label">Native Place</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control"   />
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


                             <label class="col-sm-2 control-label">Alternative</label>

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
                                <label class="col-sm-2 control-label">Total Experience</label>
                                <div class="row">

                                    <div class="col-sm-3">
                                        <div class="input-group m-b">
                                            <input type="number" min="0" class="form-control"/>
                                            <span class="input-group-addon">Years</span>

                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="input-group m-b">
                                            <input type="number" min="0" max="11" class="form-control"/>
                                            <span class="input-group-addon">Months</span>

                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="hr-line-dashed"></div>
                            <h4 class="text-info">Current Details</h4>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Location</label>

                                <div class="col-sm-5">
                                    <input type="text" class="form-control" />
                                </div>

                            </div>

                           <div class="form-group">

                                <label class="col-sm-2 control-label">Company</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control"   />
                                </div>
                            </div>

                            
                           <div class="form-group">

                                <label class="col-sm-2 control-label">Designation</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control"   />
                                </div>
                            </div>

                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Experience</label>
                                <div class="row">

                                    <div class="col-sm-3">
                                        <div class="input-group m-b">
                                            <input type="number" min="0" class="form-control"/>
                                            <span class="input-group-addon">Years</span>

                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="input-group m-b">
                                            <input type="number" min="0"  max="11" class="form-control"/>
                                            <span class="input-group-addon">Months</span>

                                        </div>
                                    </div>
                                </div>

                            </div>
                            
                            <div class="form-group">

                                <label class="col-sm-2 control-label">Salary</label>
                                <div class="col-sm-5">
                                    <div class="input-group m-b">
                                            <span class="input-group-addon">INR</span>
                                            <input type="number"  class="form-control"/>
                                        </div>
                                </div>
                            </div>

                        </div>

                    </div>
    </form>

        </div>




</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">
    <script>

        $(function () {
            $("#slider").slider({
                value: 0,
                min: 0,
                max: 10,
                step: 1,
                slide: function (event, ui) {
                    $("#amount").html(ui.value + " Years");
                }
            });
            $("#amount").html($("#slider").slider("value") + " Years");
        });

        $("#jobId").change(function () {
            if($("#jobId").val() == 1) {
            $("#Company").val("Dragonwave");
            $("#Openings").val("5");
            }
            if ($("#jobId").val() == 2) {
                $("#Company").val("Dragonwave");
                $("#Openings").val("2");
            }
            if ($("#jobId").val() == 0) {
                $("#Company").val("");
                $("#Openings").val("");
            }
        });

    </script>

</asp:Content>
