<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TestWebApp.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script>
        $(document).ready(function () {
            var iframe = $("#IframeId");
            //iframe.attr("src", URL);
            // debugger;
            var h = $(window).height() - 100;
            var w = $(window).width()
            if ($(window).width() > 800) {
                w = w - 280;
            }
            else {
                w = w - 40;
            }
            //alert(1)
            //alert(iframe)
            iframe.attr("src", "Profile.aspx");
            iframe.css("height", h + "px").css("width", "100%").css("overflow", "auto !important");
            //window.location.href = "Profile.aspx";
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="container-fluid mainPage d-flex">
        <div class="h3">
            <img src="imgs/49576_new_add_plus_user_icon.png" />
            <span id="user" runat="server" class="userName d-block"></span>
        </div>
        <h1 class="heading text-center"> Welcome to the C# App</h1>
    </div>--%>
    <iframe id="IframeId" ></iframe>
</asp:Content>
