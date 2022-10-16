<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RedirectPage.aspx.cs" Inherits="TestWebApp.RedirectPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <link href="bootstrap-5.2.0-beta1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <script href="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.4/jquery.validate.min.js" type="text/javascript"></script>
    <script src="bootstrap-5.2.0-beta1-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    <script>
        $(document).ready(function () {
            var url = 'http://localhost:5000/python';
            var username = '<%=Session["UserName"].ToString()%>'
            var location = '<%=Session["client"].ToString()%>'
            var token = '<%=Session["token"].ToString()%>'
            var form = $('<form action="' + url + '" method="POST">' +
                '<input type="hidden" id="UserId" name="user" value="' + username + '" /> ' +
                '<input type="hidden" id="Client" name="client" value="' + location + '"/>' +
                '<input type="hidden" id="token" name="token" value="' + token + '"/> ' +
                '</form>');
            $('body').append(form);
            form.submit();
            _doPostBack();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
