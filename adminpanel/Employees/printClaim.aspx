<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printClaim.aspx.cs" Inherits="adminpanel.Employees.printClaim" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Claim</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" />

    <style>
        body {
            overflow-y: scroll;
        }
        .center {
            margin: auto;
            width: 80%;
            border: 1px solid black;
            padding: 10px;
        }
    </style>
</head>

<body>


    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <img alt="" src="../img/print-logo.png" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>


</body>

     <script src="../js/jquery-2.1.1.js"></script>

    <script>
        $(".claimId").html(localStorage.getItem("cliamId"));

        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        $(".bodyClass").html(getParameterByName('claimId'));

    </script>
</html>
