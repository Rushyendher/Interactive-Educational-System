<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMail.aspx.cs" Inherits="AmazonHackathon.SendMail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Send Mail</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css"/>
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
        <div>
            <table>
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:Label ID="lb_to" runat="server" Text="To"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_to" runat="server" CssClass="form-control" Width="230px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:Label ID="lb_uid" runat="server" Text="Subject"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_subject" runat="server" CssClass="form-control" Width="230px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:Label ID="Label1" runat="server" Text="Body"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_body" TextMode="MultiLine" runat="server" CssClass="form-control" Width="230px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:Label ID="Label2" runat="server" Text="Attachments"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                                <br />
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:Label ID="Label3" runat="server" Text="Your Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" Width="230px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:Label ID="Label4" runat="server" Text="Gmail password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_pwd" runat="server" CssClass="form-control" Width="230px" TextMode="Password"></asp:TextBox>
                        <br />
                    </td>
                </tr>
            </table>
            <div id="btn">
                <asp:Button ID="btn_sendmail" runat="server" CssClass="btn btn-default" Text="Send Mail" OnClick="btn_sendmail_Click" />
            </div>
        </div>
    </form>
</body>
</html>
