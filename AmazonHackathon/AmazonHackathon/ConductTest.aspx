<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConductTest.aspx.cs" Inherits="AmazonHackathon.ConductTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES Conduct Test</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="Amazon.css" />
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
            <div id="questions">
                <table>
                    <tbody>
                        <tr>
                            <td class="col-lg-1 col-md-4">
                                <asp:Label ID="Label1" runat="server" Text="Exam Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_examname" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_conductexam_ques" ErrorMessage="*Exam name needed" ForeColor="Red"></asp:RequiredFieldValidator>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-1 col-md-4">
                                <asp:Label ID="lb_uid" runat="server" Text="Question"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_conductexam_ques" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_conductexam_ques" ErrorMessage="*Question needed" ForeColor="Red"></asp:RequiredFieldValidator>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-1 col-md-4">
                                <asp:Label ID="lb_q1" runat="server" Text="Option 1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_cexam_q1" runat="server" CssClass="form-control" Width="225px"></asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-1 col-md-4">
                                <asp:Label ID="lb_q2" runat="server" Text="Option 2"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_cexam_q2" runat="server" CssClass="form-control" Width="225px"></asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-1 col-md-4">
                                <asp:Label ID="lb_q3" runat="server" Text="Option 3"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_cexam_q3" runat="server" CssClass="form-control" Width="225px"></asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-1 col-md-4">
                                <asp:Label ID="lb_q4" runat="server" Text="Option 4"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_cexam_q4" runat="server" CssClass="form-control" Width="225px"></asp:TextBox><br />
                            </td>
                        </tr>
                        <tr>
                            <td class="col-lg-1 col-md-4">
                                <asp:Label ID="lb_ans" runat="server" Text="Answer" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_test_ans" runat="server" CssClass="form-control" Width="225px"></asp:TextBox><br />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="btn">
                <asp:Button ID="btn_submit_questions" runat="server" Text="Submit" CssClass="btn btn-info" OnClick="btn_submit_questions_Click" />
            </div>
            <div>
                <asp:Label ID="lb_err" runat="server" Text="" Visible="false"></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>
