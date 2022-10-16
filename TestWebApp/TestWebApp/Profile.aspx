<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="TestWebApp.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile Page</title>
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
        body{
            margin:0%;
            left:0%;
            padding:0%;
            top:0%;
        }
        /*.pyImg {
            width: 60px;
            height: 60px;
        }*/

        .h3 {
            margin-left: 4vw;
            margin-top: 2vw;
            width: 16vw;
            text-align: center;
        }

        .heading {
            font-weight: bolder;
            margin-top: 9vw;
            font-size: 3.5rem;
            padding-left: 10vw;
            color: orangered;
        }

        .userName {
            color: coral;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid mainPage d-flex">
            <div class="h3">
                <img src="imgs/49576_new_add_plus_user_icon.png" />
                <span id="user" runat="server" class="userName d-block"></span>
            </div>
            <h1 class="heading text-center">Welcome to the C# App</h1>
        </div>
        <div>
            <span id="commentL">Add Comment</span>
            <textarea id="txtarea1" typeof="text" placeholder="Add Comment"></textarea>
           <%-- <span id="commentLabel" style="color: #a8adb4;">Add Comment</span>
            <textarea typeof="text" rows="4" class="form-control no-resize
                                                              comment-text hideMe"
                id="txtNotes1" placeholder="Add Comment"
                style="border: none;"></textarea>--%>
        </div>
    </form>
    <script>
        //$(document).ready(function () {
        //    var data = ["Boston Celtics", "Chicago Bulls", "Miami Heat", "Orlando Magic", "Atlanta Hawks", "Philadelphia Sixers", "New York Knicks", "Indiana Pacers", "Charlotte Bobcats", "Milwaukee Bucks", "Detroit Pistons", "New Jersey Nets", "Toronto Raptors", "Washington Wizards", "Cleveland Cavaliers"];
        //    $("#txtNotes1").autocomplete({ source: data });
        //});
         $('#txtNotes1').on('keyup',function() {
            var mentionID = $(this).val();
            //alert(mentionID)
            if (mentionID == '@') {
                alert($(this).val());
                //e.AssignTo();
            }
            else {
                alert('not')
            }
        });
    </script>
</body>
</html>
