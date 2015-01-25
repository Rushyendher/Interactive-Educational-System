<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FHome.aspx.cs" Inherits="AmazonHackathon.FHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Faculty Home</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css" />

    <style>
        #td:hover {
            background-color: rgb(255,174,201);
        }

        #td1:hover {
            background-color: rgb(239,228,176);
        }

        #td2:hover {
            background-color: rgb(0,0,0);
        }

        #td3:hover {
            background-color: rgb(255,255,128);
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
                                <li><a href="FHome.aspx">Home</a></li>
                                <li><a href="FAboutIES.aspx">About IES</a></li>
                                <li><a href="FProfile.aspx">Profile</a></li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <form id="faculty_container" runat="server">
            <div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>
                        <asp:Image ID="Image1" runat="server" Height="560px" Width="1345px" CssClass="img-responsive" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="header">
                <h1>Into The 4</h1>
            </div>
            <hr />
            <div>
                <table id="image-table">
                    <tr>
                        <td id="td">
                            <a href="FacultyUplaods.aspx">
                                <img src="Images/FacultyUploads.jpg" /></a>
                        </td>
                        <td id="td1">
                            <a href="ConductTest.aspx">
                                <img src="Images/FacultyConductTest.jpg" /></a>
                        </td>
                        <td id="td2">
                            <a href="DiscussHereForums.aspx">
                                <img src="Images/DiscussHere.jpg" /></a>
                        </td>
                        <td id="td3">
                            <a href="index.html">
                                <img src="Images/AllChats.jpg" /></a>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
</html>
