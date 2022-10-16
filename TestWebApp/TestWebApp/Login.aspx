<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TestWebApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Page</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <link href="bootstrap-5.2.0-beta1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <script href="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.4/jquery.validate.min.js" type="text/javascript"></script>
    <script src="bootstrap-5.2.0-beta1-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="bootstrap-5.2.0-beta1-dist/js/md5.js"></script>
    
    <style>
        .loginform{
            width:35%;
            height:30%;
            border: 3px solid;
        }
        .btn{
            width:100%;
        }
        .row{
            align-items:center;
        }
    </style>
    <script>
        function checkpass() {
            //alert('1');
            // btnobj.disabled = true; btnobj.value = 'Sign In';
            var pass = $('#<%=pass.ClientID%>').val();
            if (pass.length >= 8) {
                //alert(pass);
                $('#<%=pass.ClientID%>').val($.md5(pass));

            }
            //__doPostBack('Sub', '')
        }
        //const { parseJSON } = require("jquery");
       <%-- $(document).ready(function () {
            //UserLogin();
        });

        function UserLogin() {
            //alert(1);
            debugger;
            var UserName = $('#<%=logid.ClientID%>').val();
            var Password = $('#<%=pass.ClientID%>').val();
            $.ajax({
                url: "Login.aspx/ConfirmLogins",
                type: 'POST',
                dataType: 'JSON',
                contentType: "application/json; charset=utf-8",
                data: "{'UserName': '" + UserName + "','Password':'" + Password + "'}",
                success: function (value) {
                    //alert(2);
                    alert(value.d)
                    //let data = {
                    //    username: UserName,
                    //    pwd: Password
                    //}
                    ////debugger;
                    //if (value.d == "Login Successful") {
                    //    window.location.replace("Home.aspx", {user : data });
                    //}
                    //else {
                    //    alert("Bad Credentials");
                    //}
                    if (value.d == 'success') {
                        window.location.replace("Home.aspx");
                    } else {
                        alert("Bad Credentials");
                    }
                },
                error: function (value) {
                    alert("Login Error:" + value.error);
                },
            })
        }--%>

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-sm|md|lg|xl justify-content-center align-items-center h-100">
            <div class="container-fluid-sm|md|lg|xl d-flex justify-content-center align-items-center">
                <div class="form-control loginform mt-5 justify-content-center align-items-center border-primary">
                    <div class="logo justify-content-center text-center">
                        <img src="imgs/87402_admin_icon.png" />
                        <h3 class="h3 text-center mt-2 pb-2">Admin Login</h3>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-sm-3">
                            <asp:Label ID="Label1" runat="server" Text="Login ID" CssClass=""></asp:Label>
                        </div>
                        <div class="col-sm-8 d-flex">
                            <asp:TextBox ID="logid" runat="server" CssClass="form-control "></asp:TextBox>
                        </div>
                    </div>
                    <div class="row justify-content-center mt-2">
                        <div class="col-sm-3">
                            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:TextBox ID="pass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row justify-content-center mt-2">
                        <div class="col-sm-3 dropdown">
                            <asp:Label ID="Label3" runat="server" Text="Location"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="drop" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Please Select" Value="Please Select" Enabled="true" Selected="False"></asp:ListItem>
                                <asp:ListItem Text="Amazon" Value="Amazon" Enabled="true" Selected="False"></asp:ListItem>
                                <asp:ListItem Text="Flipkart" Value="Flipkart" Enabled="true" Selected="False"></asp:ListItem>
                                <asp:ListItem Text="Myntra" Value="Pyrops" Enabled="true" Selected="False"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="L1" runat="server" EnableViewState="False"></asp:Label> 
                        </div>
                    </div>
                    <div class="w-100 mt-2 pb-1">
                        <asp:Button ID="Log" runat="server" Text="Login"  CssClass="btn btn-primary text-decoration-none abtns"
                            OnClientClick="checkpass();" OnClick="Log_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
