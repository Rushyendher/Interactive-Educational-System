<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAboutIES.aspx.cs" Inherits="AmazonHackathon.FAboutIES" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>About IES</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Amazon.css" />
    <style type="text/css">
        #content{
            width:800px;
            margin-left:260px;
             font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
        }
    </style>

</head>
<body>
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
                                <li><a href="SHome.aspx">Home</a></li>
                                <li><a href="AboutIes.aspx">About IES</a></li>
                                <li><a href="SProfile.aspx">Profile</a></li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <img src="Images/LogoFactory.jpg" />
        </div>
        <div id="content">
            <p>
                IES stands for Interactive Educational System. This is developed by Rushyendher Reddy. The main concept of IES is to provide an interaction between a student and faculty.
                    <span>This is just a protocol for future college websites. As we can see, now a days, the student and faculty interaction has went down. Most of the students spends their time in other social network websites rather than college websites. The IES lets the students to interact with in the college, 
                        and this looks almost like a social network site for college. When the students are liked to use this type of college website, most of the students gets most of them. They will come to know 
                        about their carrer, the things going outside etc.. by discussing with the students and their faculty instead of browsing them.
                    </span>
            </p>
        </div>
    </form>
</body>
</html>
