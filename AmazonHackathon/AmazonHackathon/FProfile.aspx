<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FProfile.aspx.cs" Inherits="AmazonHackathon.FProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Faculty Profile</title>
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

        #page {
            height: 500px;
        }

        #ans {
            margin-left: 10px;
        }

        #log {
            margin-left: 900px;
        }

        #td:hover {
            background-color: #B5E61D;
        }

        #td1:hover {
            background-color: #C8BFE7;
        }

        #td2:hover {
            background-color: #7092BE;
        }

        #td3:hover {
            background-color: #B97A57;
        }
    </style>
</head>
<body>
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
                            <li><a href="FHome.aspx">Home</a></li>
                            <li><a href="FAboutIES.aspx">About IES</a></li>
                            <li><a href="FProfile.aspx">Profile</a></li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <form id="form1" runat="server">
        <div id="welcome_msg">
            <asp:Label ID="lb_msg" runat="server" Text="" Font-Size="X-Large"></asp:Label>
        </div>
        <div>
            <table id="image-table">
                <tr>
                    <td id="td">
                        <a href="FacultyUploadAttendance.aspx">
                            <img src="Images/UploadAttendace.jpg" /></a>
                    </td>
                    <td id="td1">
                        <a href="FacultyUploadMarks.aspx">
                            <img src="Images/UploadMarks.jpg" /></a>
                    </td>
                    <td id="td2">
                        <a href="FacultyNotifications.aspx">
                            <img src="Images/Notifications.jpg" /></a>
                    </td>
                    <td id="td3">
                        <a href="FacultySettings.aspx">
                            <img src="Images/Settings.jpg" /></a>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:ImageButton ID="btn_logout" runat="server" ImageUrl="~/Images/Logout.jpg" OnClick="btn_logout_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
