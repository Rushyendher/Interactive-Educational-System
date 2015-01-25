<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WriteOnlineExam.aspx.cs" Inherits="AmazonHackathon.WriteOnlineExam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Online Exam</title>
        <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css" />
    <style type="text/css">
        #questions {
            margin-left: 20px;
        }
        
        #next {
            margin-left: 1300px;
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
                                <li><a href="Home.aspx">Home</a></li>
                                <li><a href="AboutIes.aspx">About IES</a></li>
                                <li><a href="Profile.aspx">Profile</a></li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br />

        <form id="form1" runat="server">
            <div id="header1">
                <p>Online Test</p>
            </div>
            <hr />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Large" ForeColor="#00CC00"></asp:Label>
                    <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
            <hr />
            <div id="questions">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lb_qno" runat="server" Text="Label :-"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lb_ques" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <asp:RadioButton ID="rb_op1" runat="server" Text="Optionn1" GroupName="Radio" OnCheckedChanged="rb_op1_CheckedChanged1" /><br />
                    </tr>
                    <tr>
                        <asp:RadioButton ID="rb_op2" runat="server" Text=" " GroupName="Radio" OnCheckedChanged="rb_op2_CheckedChanged" /><br />
                    </tr>
                    <tr>
                        <asp:RadioButton ID="rb_op3" runat="server" Text="" GroupName="Radio" OnCheckedChanged="rb_op3_CheckedChanged" /><br />
                    </tr>
                    <tr>
                        <asp:RadioButton ID="rb_op4" runat="server" Text="" GroupName="Radio" OnCheckedChanged="rb_op4_CheckedChanged" /><br />
                    </tr>
                </table>
            </div>
                        <div id="next">
                <asp:Button ID="btn_next_ques" runat="server" Text="Next" CssClass="btn btn-info" OnClick="btn_next_ques_Click" />
            </div>
            <hr />

        </form>
    </div>
</body>
</html>
