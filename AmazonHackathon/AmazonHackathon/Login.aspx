<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AmazonHackathon.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IES-Login</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <style type="text/css">
        #sublink {
            margin-left: 1180px;
            font-size: larger;
        }

        #header {
            height: 180px;
        }

        #container {
            margin-left: 150px;
            margin-top: 50px;
            width: 250px;
            height: 200px;
            float: left;
        }

        #image{
            margin-left:100px;
        }
    </style>
        <script>
        function StoreUserName() {
            var username = document.getElementById("txt_login_uid").value;
            document.cookie = "Username " + username;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" class="jumbotron">
            <h1>Interactive Educational System</h1>
            <div id="sublink">
                <a href="Registration.aspx" id="link_btn">Create account</a>
            </div>
        </div>
        <div id="container">
            <div class="group">
                <label for="userid">UserID</label>
                <asp:TextBox ID="txt_login_uid" runat="server" CssClass="form-control" Width="230px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ForeColor="Red" ControlToValidate="txt_login_uid"></asp:RequiredFieldValidator>
            </div>
            <div class="group">
                <label for="pwd">Password</label>
                <asp:TextBox ID="txt_login_pwd" runat="server" TextMode="Password" CssClass="form-control" Width="230px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ForeColor="Red" ControlToValidate="txt_login_pwd"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div class="group">
                <asp:Button ID="btn_login_submit" CssClass="btn btn-default" runat="server" Text="Login" OnClientClick="return StoreUserName();" OnClick="btn_login_submit_Click" />
            </div>
            <asp:Label ID="lb_error" runat="server" Visible="False"></asp:Label><br />
        </div>
    </form>
    <div id="image">
        <img src="Images/interactive.png" />
    </div>
        <div id="fb">
    </div>
</body>
</html>
