<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultySettings.aspx.cs" Inherits="AmazonHackathon.FacultySettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Settings</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css" />
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
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="group">
                        <div id="edit_profile">
                            <h3>Edit Profile</h3>
                        </div>
                        <table>
                            <tbody>
                                <tr>
                                    <td class="col-xs-6 col-md-4">
                                        <asp:Label ID="lb_email" runat="server" Text="Email"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_settings_email" runat="server" CssClass="form-control" Width="255px"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_settings_email" ErrorMessage="Invalid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        <br />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </ContentTemplate>

            </asp:UpdatePanel>

            <div id="update">
                <asp:Button ID="btn_settings_update" runat="server" Text="Update Profile" CssClass="btn btn-info" OnClick="btn_settings_update_Click" />
                <asp:Label ID="lb_updated" runat="server" Visible="False"></asp:Label>
            </div>
            <hr />
            <div id="chage_pwd">
                <div id="pwd_header">
                    <h3>Change Password</h3>
                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table>
                            <tbody>
                                <tr>
                                    <td class="col-xs-6 col-md-4">
                                        <asp:Label ID="Label2" runat="server" Text="New Password"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_changepwd_pwd" runat="server" CssClass="form-control" Width="255px" AutoPostBack="false"></asp:TextBox>
                                        <br />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="col-xs-6 col-md-4">
                                        <asp:Label ID="Label3" runat="server" Text="Confirm password"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_changepwd_cnfpwd" runat="server" CssClass="form-control" Width="255px" AutoPostBack="false"></asp:TextBox>
                                        <br />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
            <div id="changepwd_btn">
                <asp:Button ID="btn_changepwd" runat="server" Text="Change Password" CssClass="btn btn-info" OnClick="btn_changepwd_Click"  />
                <asp:Label ID="lb_succespwd" runat="server" Visible="False"></asp:Label>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_changepwd_cnfpwd" ControlToValidate="txt_changepwd_pwd" ErrorMessage="Passwords didnot match" ForeColor="Red"></asp:CompareValidator>
            </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </form>
    </div>
</body>
</html>
