<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyUploadAttendance.aspx.cs" Inherits="AmazonHackathon.FacultyUploadAttendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Upload Attendance</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css" />
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
                                <li><a href="FHome.aspx">Home</a></li>
                                <li><a href="FAboutIES.aspx">About IES</a></li>
                                <li><a href="FProfile.aspx">Profile</a></li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="student_id">
            <table>
                <tbody>
                    <tr>
                        <td class="col-xs-6 col-md-4">
                            <asp:Label ID="lb_uid" runat="server" Text="Student ID"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_attendance_uid" runat="server" CssClass="form-control" Width="255px"></asp:TextBox>

                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <hr />
        <div id="add_textboxes">
            <asp:Label ID="lb_code" runat="server" Text="Course Code"></asp:Label><asp:TextBox ID="txt_ccode" runat="server" CssClass="form-control" Width="255px"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="Course Name"></asp:Label><asp:TextBox ID="txt_cname" runat="server" CssClass="form-control" Width="255px"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Total Classes"></asp:Label><asp:TextBox ID="txt_total" runat="server" CssClass="form-control" Width="255px"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="Total Attend"></asp:Label><asp:TextBox ID="txt_attend" runat="server" CssClass="form-control" Width="255px"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lb_err" runat="server" Visible="False"></asp:Label>
        </div>
        <br />
        <div id="upload">
            <asp:Button ID="btn_upload_attend" runat="server" Text="Upload Attendance" CssClass="btn btn-info" OnClick="btn_upload_attend_Click" />
        </div>
    </form>
</body>
</html>
