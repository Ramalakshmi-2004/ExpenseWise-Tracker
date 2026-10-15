<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="ExpenseWise.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password - ExpenseWise</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{
            background:linear-gradient(135deg,#2563EB,#1E3A8A);
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }

        .container{
            width:450px;
            background:white;
            padding:35px;
            border-radius:15px;
            box-shadow:0 10px 25px rgba(0,0,0,.25);
        }

        h2{
            text-align:center;
            color:#2563EB;
            margin-bottom:25px;
        }

        label{
            display:block;
            margin-top:15px;
            margin-bottom:5px;
            font-weight:bold;
        }

        .txt{
            width:100%;
            padding:12px;
            border:1px solid #ccc;
            border-radius:8px;
            font-size:15px;
        }

        .btn{
            width:100%;
            padding:13px;
            margin-top:25px;
            border:none;
            background:#2563EB;
            color:white;
            border-radius:8px;
            cursor:pointer;
            font-size:17px;
        }

        .btn:hover{
            background:#1D4ED8;
        }

        .msg{
            margin-top:15px;
            text-align:center;
            font-weight:bold;
        }

        .login{
            text-align:center;
            margin-top:20px;
        }

        .login a{
            text-decoration:none;
            color:#2563EB;
            font-weight:bold;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

<h2>Forgot Password</h2>

<label>Username</label>

<asp:TextBox ID="txtUsername" runat="server" CssClass="txt"></asp:TextBox>

<label>Registered Email</label>

<asp:TextBox ID="txtEmail" runat="server" CssClass="txt"></asp:TextBox>

<label>New Password</label>

<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txt"></asp:TextBox>

<label>Confirm Password</label>

<asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="txt"></asp:TextBox>

<br /><br />

<asp:Button
    ID="btnReset"
    runat="server"
    Text="Reset Password"
    CssClass="btn"
    OnClick="btnReset_Click" />

<br />

<asp:Label
    ID="lblMessage"
    runat="server"
    CssClass="msg">
</asp:Label>

<div class="login">

<a href="Login.aspx">Back to Login</a>

</div>

</div>

</form>

</body>
</html>