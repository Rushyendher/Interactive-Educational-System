<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentExam.aspx.cs" Inherits="AmazonHackathon.StudentExam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Online Exam</title>
    <meta charset="utf-8" />
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
            <div id="all">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="TESTNAME" HeaderText="Test Name" />
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnKEXAM" runat="server" Text="Take Test" OnClick="lnKEXAM_Click"
                                    CommandArgument='<%# Eval("TESTNAME") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </form>
    </div>
</body>
</html>
