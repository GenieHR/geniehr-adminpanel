<%@ Page Title="" Language="C#" MasterPageFile="~/UbietyMenu.Master" AutoEventWireup="true" CodeBehind="claim.aspx.cs" Inherits="adminpanel.claim" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="col-lg-3">
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
        </div>
    </div>

</asp:Content>
