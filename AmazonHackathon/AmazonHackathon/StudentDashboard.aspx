<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="AmazonHackathon.StudentDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Student Marks</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css" />
    <style type="text/css">
        #gridview {
            margin-top: 30px;
            margin-left: 0px;
            width: 700px;
            padding: 20px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
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
                                <li><a href="AboutIes.aspx">About IES</a></li>
                                <li><a href="SProfile.aspx">Profile</a></li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br />
        <div id="gridview">
            <asp:GridView ID="gd_marks" runat="server" CssClass="table table-hover table-bordered">
            </asp:GridView>
        </div>
        <div id="marks">
            <asp:Label ID="lb_stud_onlinemarks" runat="server" Text=""></asp:Label>
        </div>
            <asp:Label ID="lblShare" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
