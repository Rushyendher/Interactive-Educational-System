<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DiscussHereForums.aspx.cs" Inherits="AmazonHackathon.DiscussHereForums" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>IES Discuss Here</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css"/>

    <style type="text/css">
        #thread {
            margin-top: 20px;
            margin-left: 15px;
        }

        #forum {
            font-family: Arial, Helvetica, sans-serif;
            font-size: xx-large;
        }

        #ddl {
            margin-left: 20px;
        }

        #content {
            margin-left: 30px;
        }

        #gdview{
            margin-left:0px;
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
                                    <li><a href="Home.aspx">Home</a></li>
                                    <li><a href="AboutIES.aspx">About IES</a></li>
                                    <li>
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Profile</asp:LinkButton></li>
                                </ul>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="forum">
                <p>Forums</p>
            </div>
            <hr />
            <div>

                <div id="thread">
                    <table>
                        <tbody>
                            <tr>
                                <td class="col-lg-1 col-md-4">
                                    <asp:TextBox ID="txt_title" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btn_thread" runat="server" Text="Create Thread" CssClass="btn btn-default" OnClick="btn_thread_Click" />
                                </td>
                            </tr>
                                <asp:Label ID="lb_err" runat="server" Text="" Visible="false"></asp:Label>
                        </tbody>
                    </table>
                </div>
                <hr />
                <div id="ddl">
                    <table>
                        <tbody>
                            <tr>
                                <td class="col-lg-1 col-md-4">
                                    <asp:Label ID="lb_threads" runat="server" Text="Threads "></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_threads" runat="server" CssClass="dropdown-toggle" Width="225" AutoPostBack="true" OnSelectedIndexChanged="ddl_threads_SelectedIndexChanged"></asp:DropDownList>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <hr />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div id ="gdview">
                            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-hover table-bordered">
                                
                            </asp:GridView>
                        </div>
                        <div id="content">
                            <asp:TextBox ID="txt_content" runat="server" TextMode="MultiLine" Height="80px" Width="500px" CssClass="form-control"></asp:TextBox>
                            <br />
                            <asp:Button ID="btn_postcontent" runat="server" Text="Post" CssClass="btn btn-info" OnClick="btn_postcontent_Click" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </form>
    </div>
</body>
</html>
