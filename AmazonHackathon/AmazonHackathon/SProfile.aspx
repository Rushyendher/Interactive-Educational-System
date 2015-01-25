<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SProfile.aspx.cs" Inherits="AmazonHackathon.SProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Student Profile</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css" />
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <style type="text/css">
        #welcome_msg {
            margin-left: 20px;
            margin-top: 10px;
        }

        #image_upload {
            margin-top: 10px;
        }

        #notification {
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }

        #td:hover {
            background-color: #FF7F27;
        }

        #td1:hover {
            background-color: #00A2E8;
        }

        #td2:hover {
            background-color: #A349A4;
        }

        #td3:hover {
            background-color: #B97A57;
        }

        #log {
            margin-left: 900px;
        }
    </style>
</head>
<body>
    <div id="page">
        <div id="navigation_bar">
            <table id="table">
                <tbody>
                    <tr>
                        <td class="col-lg-8 col-md-4">
                            <p><span id="header-style">Interactive</span><span id="remaining-name">ES</span></p>
                        </td>
                        <td id="empty"></td>
                        <td>
                            <ul>
                                <li><a href="SHome.aspx">Home</a></li>
                                <li><a href="AboutIES.aspx">About IES</a></li>
                                <li><a href="SProfile.aspx">Profile</a></li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <form id="form1" runat="server">
            <div id="welcome_msg">
                <asp:Label ID="lb_name" runat="server" Font-Size="X-Large"></asp:Label>
            </div>
            <div id="notification">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"></asp:GridView>
            </div>
            <div>
                <table id="image-table">
                    <tr>
                        <td id="td">
                            <a href="StudentDashboard.aspx">
                                <img src="Images/Dashboard.jpg" /></a>
                        </td>
                        <td id="td1">
                            <a href="StudentAttendance.aspx">
                                <img src="Images/Attendance.jpg" /></a>
                        </td>
                        <td id="td2">
                            <a href="StudentResources.aspx">
                                <img src="Images/Resources.jpg" /></a>
                        </td>
                        <td id="td3">
                            <a href="StudentSettings.aspx">
                                <img src="Images/Settings.jpg" /></a>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table>
                    <tr>
                        <td id="mail">
                            <a href="SendMail.aspx">
                                <img src="Images/sendmail.png" /></a>
                        </td>
                        <td class="col-xs-6 col-md-4">
                            <asp:ImageButton ID="btn_logout" runat="server" ImageUrl="~/Images/Logout.jpg" OnClick="btn_logout_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
</html>
