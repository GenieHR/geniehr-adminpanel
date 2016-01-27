<%@ Page Title="Employee Bulk Create" Language="C#" MasterPageFile="~/Org/OrgTemplate1.Master" AutoEventWireup="true" CodeBehind="BulkUpload.aspx.cs" Inherits="adminpanel.Org.BulkUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <input type="file" id="fileUpload" />
    <input type="button" id="upload" value="Upload" />
    <hr />
    <div class="ibox">
    <div class="ibox-content" id="dvCSV"></div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascriptPart" runat="server">

    <script type="text/javascript">
        $(function () {
            $("#upload").bind("click", function () {
                var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.csv|.txt)$/;
                if (regex.test($("#fileUpload").val().toLowerCase())) {
                    if (typeof (FileReader) != "undefined") {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            var table = $('<table class="table table-hover table-bordered table-condensed"/>');

                            var rows = e.target.result.split("\n");
                            var row = $('<tr class="text-center" />');

                            var cells = rows[0].split(",");

                            for (var j = 0; j < cells.length; j++) {
                                var cell = $("<td />");
                                cell.html("<strong>"+cells[j]+"</strong>");
                                row.append(cell);
                            }

                            table.append(row);
                            //table;

                            for (var i = 1; i < rows.length; i++) {
                                var row = $("<tr />");
                                var cells = rows[i].split(",");
                                for (var j = 0; j < cells.length; j++) {
                                    var cell = $("<td />");
                                    //cell.html('<div ><input type="text" style="border:0px"  value="' + cells[j] + '"></div>');
                                    cell.html(cells[j]);

                                    row.append(cell);

                                }
                                table.append(row);
                            }
                            $("#dvCSV").html('');
                            $("#dvCSV").append(table);
                        }
                        reader.readAsText($("#fileUpload")[0].files[0]);
                    } else {
                        alert("This browser does not support HTML5.");
                    }
                } else {
                    alert("Please upload a valid CSV file.");
                }
            });
        });

        function Upload() {
            var fileUpload = document.getElementById("fileUpload");
            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.csv|.txt)$/;
            if (regex.test(fileUpload.value.toLowerCase())) {
                if (typeof (FileReader) != "undefined") {
                    var reader = new FileReader();
                    reader.onload = function (e) {

                        
                        var table = document.createElement("table");
                        
                        table.id = "empList";
                        table.className = "table";
                        //table.setAttribute("class", "table-hover");
                        //table.setAttribute("class", "table-bordered");

                        var rows = e.target.result.split("\n");
                        for (var i = 0; i < rows.length; i++) {
                            var row = table.insertRow(-1);
                            var cells = rows[i].split(",");
                            for (var j = 0; j < cells.length; j++) {
                                var cell = row.insertCell(-1);
                                cell.innerHTML = cells[j];
                            }
                        }
                        var dvCSV = document.getElementById("dvCSV");
                        dvCSV.innerHTML = "";
                        dvCSV.appendChild(table);
                    }
                    reader.readAsText(fileUpload.files[0]);
                } else {
                    alert("This browser does not support HTML5.");
                }
            } else {
                alert("Please upload a valid CSV file.");
            }
        }
    </script>
</asp:Content>
