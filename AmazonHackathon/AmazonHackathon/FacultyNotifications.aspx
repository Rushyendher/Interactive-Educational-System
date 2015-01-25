<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyNotifications.aspx.cs" Inherits="AmazonHackathon.FacultyNotifications" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Notifications</title>
     <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css" />

        <style type="text/css">
        #date_txt{
            margin-top:100px;
            margin-left:480px;
        }

        #cal{
            margin-left:380px;
            margin-top:20px;
        }
        #notify{
            margin-top:20px;
            margin-left:270px;
        }

        #btn{
            margin-left:900px;
        }
    </style>
</head>
<body>
 <div>
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
            <br />
            <div id ="date_txt">
                <table>
                    <tbody>
                        <tr>
                            <td class="col-lg-1 col-md-4">
                                <asp:Label ID="lb_uid" runat="server" Text="Date"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_date" runat="server" CssClass="form-control" Width="255px"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_date" ErrorMessage="* select date" ForeColor="Red"></asp:RequiredFieldValidator>
                                
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="cal">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" >
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
            </div>
            <div id="notify">
                <table>
                    <tbody>
                        <tr>
                            <td class="col-lg-1 col-md-4">
                                <asp:Label ID="lb_notify" runat="server" Text="Notify Student"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_notify" runat="server" CssClass="form-control" Width="600px" TextMode="MultiLine" Height="100px"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_notify" ErrorMessage="*Notify some message" ForeColor="Red"></asp:RequiredFieldValidator>
                                
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <br />
            <div id="btn">
                <asp:Button ID="btn_notify" runat="server" Text="Notify" CssClass="btn btn-info" OnClick="btn_notify_Click" />
            </div>
            <div>
                <asp:Label ID="lb_err" runat="server" Text="" Visible="false"></asp:Label>
            </div>
        </form>
    </div>
</body>
</html>
