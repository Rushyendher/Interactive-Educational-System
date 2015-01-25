<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyUplaods.aspx.cs" Inherits="AmazonHackathon.FacultyUplaods" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title> IES-File Uploads </title>
     <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css" />
    <style type="text/css">
        #upload{
            margin-top:200px;
            margin-left:550px;
        }
        #page{
            height:300px;
        }
    </style>

</head>
<body>
    <div id="page">
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
            <div id="upload">
                <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                <asp:Button ID="btn_upload" runat="server" Text="Upload File" CssClass="btn btn-info" OnClick="btn_upload_Click" />
                <asp:Label ID="lb_msg" runat="server" Text=""></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>
