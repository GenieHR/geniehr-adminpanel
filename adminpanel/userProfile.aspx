<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" MasterPageFile="~/UbietyMenu.Master" Inherits="adminpanel.userProfile" %>


<asp:Content ID="Content1" ContentPlaceHolderID="body" Runat="Server">


    <form id="fileinfo" enctype="multipart/form-data" action="api/Upload" method="post" name="fileinfo">
    <label>Select File</label>
    <input type="file" name="filename" id="filename" required="required" />
        <%--<input type="hidden" name="hidfld" id="hidfld" value="hidfld_val" />--%>
    <input type="submit" id="uploadBTN" value="Upload"/>

    </form>
<div id="output"></div>

    <script>


     
        //$("#fileinfo").submit(function (event) {
        //    event.preventDefault();
        //});

           $('#uploadBTN').on('click', function () {
                
                var formData = new FormData();


                formData.append('image', $('input[type=file]')[0].files[0]);


                $.ajax({
                           url: 'api/Upload',
                    type: 'POST',
                    data: formData,
                    success: function (data) {
                        $('#output').html(data);
                    },
                    contentType: false,
                    processData: false
            });
        });
    </script>
</asp:Content>
