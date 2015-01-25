<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AmazonHackathon.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Registration</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <style>
        #header {
            font-family: Arial, Helvetica, sans-serif;
            font-size: xx-large;
                        margin-left:400px;
            margin-top:60px;
        }

        #content{
            margin-left:450px;
            margin-top:50px;
        }

        #imgbtn{
            margin-left:660px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
            <p>Sign Up</p>
        </div>
        <div id="content">
            <table>
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:Label ID="lb_uid" runat="server" Text="User ID"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_uid" runat="server" CssClass="form-control" Width="230px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_uid" ErrorMessage="*required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:Label ID="lb_pwd" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_pwd" runat="server" CssClass="form-control" Width="230px"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_conpwd" ControlToValidate="txt_pwd" ErrorMessage="password didnot match" ForeColor="Red"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_pwd" ErrorMessage="*required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:Label ID="lb_conpwd" runat="server" Text="Confirm Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_conpwd" runat="server" CssClass="form-control" Width="230px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_conpwd" ErrorMessage="*required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:Label ID="lb_email" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" Width="230px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_email" ErrorMessage="*required" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="*invalid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <br />
                    </td>
                </tr>

                
                <tr>
                    <td class="col-xs-6 col-md-4">
                        <asp:Label ID="lb_category" runat="server" Text="Category"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddl_category" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select category" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Faculty" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Student" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddl_category" ErrorMessage="Category required"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
        <div id="imgbtn">
            <asp:ImageButton ID="btn_create_user" runat="server" ImageUrl="~/Images/Createuser.png" OnClick="btn_create_user_Click" />
        </div>
        <div>
            <asp:Label ID="lb_err" runat="server" Text="" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
