<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LetsGetCreative.aspx.cs" Inherits="AmazonHackathon.LetsGetCreative" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Lets Get Creative
    </title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css" />
    <style type="text/css">
        .form-control {
        }

        #idea_content {
            margin-left: 50px;
        }

        #post-idea {
            margin-left: 558px;
            margin-top: 10px;
        }

        #repeater {
            background-color: #E6E6FA;
        }

        #lb_name {
            font-size: medium;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
  <div id="page">
        <form id="creative_form" runat="server">
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
            <div id="creative_quote">
                <h1>Share your Ideas and give them a Life.</h1>
            </div>
            <br />
            <div id="idea_content">
                <table class="group">
                    <tbody>
                        <tr>
                            <td id="idea_label" class="col-lg-1 col-md-4">
                                <asp:Label ID="Label1" runat="server" Text="Your Idea"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_ideacontent" runat="server" TextMode="MultiLine" CssClass="form-control" Height="107px" Width="470px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_ideacontent" ErrorMessage="*Give some text" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="post-idea">
                <asp:Button ID="btn_postidea" runat="server" Text="Post" CssClass="btn btn-info" OnClick="btn_postidea_Click" />
            </div>
            <asp:Label ID="lb_error" runat="server" Visible="False"></asp:Label><br />
            <div id="repeater">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered">
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </form>
    </div>
</body>
</html>
