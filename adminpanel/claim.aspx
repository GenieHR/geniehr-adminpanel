<%@ Page Title="" Language="C#" MasterPageFile="~/UbietyMenu.Master" AutoEventWireup="true" CodeBehind="claim.aspx.cs" Inherits="adminpanel.claim" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>Add A New Claim</h2>
                </div>
                <div class="col-lg-2">

                </div>
            </div>
        <%--<div class="col-lg-3">
            <div class="panel panel-success travelbox">
                <div class="panel-heading">
                    <i class="fa fa-2x fa-suitcase"></i>
                    <p class="traveldate pull-right">
                        23-Nov-2015
                    </p>
                </div>
                <div class="panel-body">
                    <p class="travelfromto">
                        Sector-17, Chandigarh 
                                                -
                                                Talentpull Office, Mohali
                    </p>

                    <p class="purpose">
                        Lorem Ipsum is simply dummy 
                                                text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
                    </p>
                </div>

                <div class="panel-footer">
                    <p class="distance pull-left">15 kms @ Rs. 5 /km</p>
                    <p class="amount">75</p>
                </div>

                <div  class="panel-footer auth-but" >
                    <span >hover text</span>
                </div>

            </div>
        </div>--%>

    <br />

    <div class="col-lg-12">
        <div class="col-lg-4">
            <div class="ibox"><div class="ibox-content">&nbsp;</div></div>

        </div>

        <div class="col-lg-8"><div class="ibox"><div class="ibox-content">
            <div class="tabs-container">
                        <div class="tabs-top">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#tabTravel">Travel</a></li>
                                <li class=""><a data-toggle="tab" href="#tabHotel">Hotel</a></li>
                                <li class=""><a data-toggle="tab" href="#tabFoood">Food</a></li>

                            </ul>
                            <div class="tab-content ">
                                

                                <div id="tabTravel" class="tab-pane">
                                    <div class="panel-body">
                                            <div class="hr-line-dashed"></div>

                                        <form method="get" class="form-horizontal">                                <div class="form-group"><label class="col-sm-2 control-label">Help text</label>
                                    <div class="col-sm-10"><input type="text" class="form-control"/> <span class="help-block m-b-none">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                                    </div></div>

                                            <div class="hr-line-dashed"></div>

                                        </form>
                                    </div>
                                </div>

                                <div id="tabHotel" class="tab-pane">
                                    <div class="panel-body">
                                    </div>
                                </div>

                                <div id="tabFoood" class="tab-pane">
                                    <div class="panel-body">
                                    </div>
                                </div>

                                <div id="tab-12" class="tab-pane">
                                    <div class="panel-body">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>        
                </div>
                </div>
                </div>
        </div>
</asp:Content>
