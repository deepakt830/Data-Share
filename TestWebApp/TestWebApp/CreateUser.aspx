<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="TestWebApp.CreateUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New User</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <script href="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.4/jquery.validate.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="bootstrap-5.2.0-beta1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap-5.2.0-beta1-dist/js/bootstrap.min.js"></script>
    <script src="bootstrap-5.2.0-beta1-dist/js/md5.js"></script>
    <style>
        .registerform{
            width:40%;
            height:50%;
            border: 3px solid;
        }
    </style>
    <script type="text/javascript">

        function checkpass() {
            //alert('1');
            // btnobj.disabled = true; btnobj.value = 'Sign In';
            var pass = $('#<%=pass.ClientID%>').val();
            if (pass.length >= 8) {
                //alert(pass);
                $('#<%=pass.ClientID%>').val($.md5(pass));

            }
            __doPostBack('Sub', '')
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid mt-2 justify-content-center">
        <div class="container-fluid form-check">
            <div class="container-fluid registerform form-control  mt-5 border-primary">
                <div class="myForm">
                    <h3 class="">Create New User</h3><br />
                    <div class="row-cols-3">
                        <asp:Label ID="Label1" runat="server" Text="USERNAME"></asp:Label>
                        <asp:TextBox ID="user" runat="server" CssClass="form-control"></asp:TextBox><br />
                    </div>
                    <div class="row-cols-3">
                        <asp:Label ID="Label2" runat="server" Text="PASSWORD"></asp:Label>
                        <asp:TextBox ID="pass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator id="passcheck" runat="server" ErrorMessage=""
                            ControlToValidate="pass" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$"></asp:RegularExpressionValidator><br />
                    </div>
                    <div class="row-cols-3">
                        <asp:Label ID="Label3" runat="server" Text="CLIENT"></asp:Label>
                        <%--<asp:TextBox ID="clints" runat="server" CssClass="form-control"></asp:TextBox>--%>
                        <asp:DropDownList ID="drop" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Please Select" Value="Please Select" Enabled="true" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="Amazon" Value="Amazon" Enabled="true" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="Flipkart" Value="Flipkart" Enabled="true" Selected="False"></asp:ListItem>
                            <asp:ListItem Text="Myntra" Value="Pyrops" Enabled="true" Selected="False"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="L1" runat="server" EnableViewState="False"></asp:Label>
                    </div>
                </div>
                <div class="w-100 mt-1">
                    <asp:Button ID="Sub" runat="server" Text="Submit" OnClientClick="checkpass();" OnClick="Sub_Click" CssClass="btn btn-primary text-center mt-2 w-100" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
