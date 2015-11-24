<%@ Page Title="Add Candidate" Language="C#" MasterPageFile="~/Org/OrgTemplate.Master" AutoEventWireup="true" CodeBehind="AddCandidate.aspx.cs" Inherits="adminpanel.Org.ATS.AddCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <br />
    <div class="row">
        <%--<div class="col-lg-12">

        <div class="text-center">

            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-user"></i>&nbsp; Personal </button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-phone" ></i>&nbsp; Contact </button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-mortar-board"></i>&nbsp; Skills & Qualification</button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-building"></i>&nbsp; Employment</button>
            <button class="btn btn-info  dim btn-lg" type="button"><i class="fa fa-pencil"></i>&nbsp; Remarks</button>

        </div>
    </div>--%>

        <div class="col-lg-4">

            <div class="ibox">
                <div class="ibox-title">
                    <h5>Summary</h5>
                </div>
                <div class="ibox-content">
                </div>
            </div>

        </div>

        <div class="col-lg-8">
            <form method="get" class="form-horizontal">

                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Personal</h5>
                        </div>
                        <div class="ibox-content">
                            <div class="form-group">

                                <div class="col-sm-12">
                                    <input type="text" class="form-control" placeholder="Candidate Name"/>
                                </div>

                            </div>
                            
                            <div class="form-group">

                                <div class="col-sm-12">
                                    <input type="text" class="form-control" placeholder="Current Location"/>
                                </div>

                            </div>

                            <div class="form-group">
                                <div class="col-sm-12 ">
                            
                            <div id="slider" style="margin-left:8px"></div>
                            <span class="help-block " id="amount" style="font-weight:bold;"></span>

                            </div>
    
                            </div>

                        </div>
                    </div>

                </div>

                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Contact Details</h5>
                        </div>
                        <div class="ibox-content">
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Skills</h5>
                        </div>
                        <div class="ibox-content">
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Past Employment</h5>
                        </div>
                        <div class="ibox-content">
                        </div>
                    </div>
                </div>

            </form>

        </div>



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
                    $("#amount").html("Experience " + ui.value + " Years");
                }
            });
            $("#amount").html("Experience " + $("#slider").slider("value") + " Years");
        });

        
        
    </script>

</asp:Content>
