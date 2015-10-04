<%@ Page Title="Claims" Language="C#" MasterPageFile="~/UbietyMenu.Master" AutoEventWireup="true" CodeBehind="claim.aspx.cs" Inherits="adminpanel.claim" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Add A New Claim</h2>
        </div>
        <div class="col-lg-2">
        </div>
    </div>
    

    <br />

        
        <div class="col-lg-10 col-sm-12 col-md-12 col-lg-offset-1">
            <div class="ibox">
                <div class="ibox-content">
                    <div class="tabs-container">
                        <div class="tabs-top">
                            <ul class="nav nav-tabs">
                                <li><a data-toggle="tab" href="#tabSummary">Summary</a></li>
                                <li class="active"><a data-toggle="tab" href="#tabTravel">Travel</a></li>
                                <li><a data-toggle="tab" href="#tabHotel">Hotel</a></li>
                                <li><a data-toggle="tab" href="#tabFood">Food</a></li>
                                <li><a data-toggle="tab" href="#tabOthers">Others</a></li>

                            </ul>
                            <div class="tab-content ">

                                <div id="tabSummary" class="tab-pane">
                                    <div class="panel-body">
        <div class="col-lg-8 col-sm-8 col-md-8">
</div>
                                        <div class="col-lg-4 col-sm-4 col-md-4">
                                        <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width:65%">Expense</th>
                                <th>Amount ( &#x20B9 )</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Travel</td>
                                <td class="curr">0.00</td>
                            </tr>
                            <tr>
                                <td>Hotel</td>
                                <td class="curr">0.00</td>

                            </tr>
                            <tr>
                                <td>Food</td>
                                <td class="curr">0.00</td>

                            </tr>

                            <tr>
                                <td>Others</td>
                                <td class="curr">0.00</td>

                            </tr>
                        </tbody>
                                            <tfoot>
                                                <tr style="background-color:lightgray">
                                                <td><b>Total</b></td>
                                                <td class="curr"><b>0.00</b></td>
                                                    </tr>
                                            </tfoot>
                    </table>
                                    </div>
                                        </div>
                                </div>

                                <div id="tabTravel" class="tab-pane">
                                    <div class="panel-body">

                                        <form method="get" class="form-horizontal">

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Travel Purpose</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>
                                                                                          <div class="hr-line-dashed"></div>
                                            <div class="form-group">
                                                 <label class="col-sm-2 control-label">Travel Date</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b">                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>                                             <input type="date"  class="form-control"/>
                                        </div></div>
                                                <label class="col-sm-2 control-label">Mode of Travel</label>
                                                <div class="col-sm-4"><label class="checkbox-inline"> <input type="radio" name="modeoftravel" value="option1" id="inlineCheckbox1"/> Auto </label> <label class="checkbox-inline">
                                        <input type="radio" value="option2" name="modeoftravel" id="inlineCheckbox2"/> Train </label> <label class="checkbox-inline">
                                        <input type="radio" value="option3" name="modeoftravel" id="inlineCheckbox3"/> Bus </label></div>
                                    
                                </div>
                                                  <div class="hr-line-dashed"></div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">From</label>
                                                <div class="col-sm-4">
                                                                                       <input type="text" class="form-control" />


                                </div>
                                                <label class="col-sm-2 control-label">To</label>
                                                <div class="col-sm-4">
                                                                                       <input type="text" class="form-control" />
                                </div>
                                                </div>

                                              <div class="hr-line-dashed"></div>
                                              <div class="form-group">
      <label class="col-sm-2 control-label">Distance</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b"> <input type="text"  class="form-control"/><span class="input-group-addon">Kms</span></div></div>
      <label class="col-sm-2 control-label">Rate</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b">                                            <span class="input-group-addon">&#x20B9</span>                                             <input type="text"  class="form-control"/>                                            <span class="input-group-addon">per km</span> </div></div>
  </div>                                              <div class="hr-line-dashed"></div>                                                                  
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Remarks</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>                                                                                                                <div class="hr-line-dashed"></div>                                                                  <div class="form-group">
      <label class="col-sm-2 control-label">Total Amount</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b">                                            <span class="input-group-addon">&#x20B9</span>                                             <input type="text"  class="form-control"/>
                                        </div></div>
    <div class="col-sm-6">
        <input type="button" class="pull-right btn btn-success" value="Add Expense" />
    </div>
</div>
                                        </form>
                                
                            </div>                            </div>

                                <div id="tabHotel" class="tab-pane">
                                    <div class="panel-body">

                                        <form method="get" class="form-horizontal">

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Hotel Name</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>
                                                                                          <div class="hr-line-dashed"></div>
                                            <div class="form-group">
                                                 <label class="col-sm-2 control-label">Stay From Date</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b">                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>                                             <input type="date"  class="form-control"/>
                                        </div></div>
                                               <label class="col-sm-2 control-label">Stay To Date</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b">                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>                                             <input type="date"  class="form-control"/>
                                        </div></div>
                                    
                                </div>
                                                  <div class="hr-line-dashed"></div>

                                            
                                              <div class="form-group">
      <label class="col-sm-2 control-label">No. of Nights</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b"> <input type="text"  class="form-control"/><span class="input-group-addon">Nights</span></div></div>
      <label class="col-sm-2 control-label">Rate</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b">                                            <span class="input-group-addon">&#x20B9</span>                                             <input type="text"  class="form-control"/>                                            <span class="input-group-addon">per night</span> </div></div>
  </div>                                              <div class="hr-line-dashed"></div>                                                                  
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Remarks</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>                                                                                                                <div class="hr-line-dashed"></div>                                                                  <div class="form-group">
      <label class="col-sm-2 control-label">Total Amount</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b">                                            <span class="input-group-addon">&#x20B9</span>                                             <input type="text"  class="form-control"/>
                                        </div></div>
    <div class="col-sm-6">
        <input type="button" class="pull-right btn btn-success" value="Add Expense" />
    </div>
</div>
                                        </form>
                                
                            </div>
                                </div>

                                <div id="tabFood" class="tab-pane">
                                    <div class="panel-body">

                                        <form method="get" class="form-horizontal">

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Restaurant Name</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>
                                                                                        
                                            

                                            

                                              <div class="hr-line-dashed"></div>
                                              <div class="form-group">
      <label class="col-sm-2 control-label">Expense Date</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b"><span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="date"  class="form-control"/></div></div>
      <label class="col-sm-2 control-label">No. of Persons</label>

                                    <div class="col-sm-4">
                                            <input type="text"  class="form-control"/>
</div>
  </div>                                              <div class="hr-line-dashed"></div>                                                                  
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Remarks</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>                                                                                                                <div class="hr-line-dashed"></div>                                                                  <div class="form-group">
      <label class="col-sm-2 control-label">Total Amount</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b">                                            <span class="input-group-addon">&#x20B9</span>                                             <input type="text"  class="form-control"/>
                                        </div></div>
    <div class="col-sm-6">
        <input type="button" class="pull-right btn btn-success" value="Add Expense" />
    </div>
</div>
                                        </form>
                                
                            </div>
                                </div>

                                <div id="tabOthers" class="tab-pane">
                                    <div class="panel-body">
                                        <form method="get" class="form-horizontal">

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Expense Description</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>
                                                                                          <div class="hr-line-dashed"></div>
  <div class="form-group">
      <label class="col-sm-2 control-label">Expense Date</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b"><span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="date"  class="form-control"/></div></div>
      
  </div>                                              <div class="hr-line-dashed"></div>                      
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Remarks</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>                                                                                                                <div class="hr-line-dashed"></div>                                                                  <div class="form-group">
      <label class="col-sm-2 control-label">Total Amount</label>

                                    <div class="col-sm-4">
                                        <div class="input-group m-b">                                            <span class="input-group-addon">&#x20B9</span>                                             <input type="text"  class="form-control"/>
                                        </div></div>
    <div class="col-sm-6">
        <input type="button" class="pull-right btn btn-success" value="Add Expense" />
    </div>
</div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>

    <script>
        var d = new Date();
        var month = d.getMonth() + 1;
        var day = d.getDate();

        var output = (day < 10 ? '0' : '') + day + '-' +
            (month < 10 ? '0' : '') + month + '-' +
            d.getFullYear();

        $("#claimDate").html(output);
    </script>
</asp:Content>
