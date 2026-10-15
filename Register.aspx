<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ExpenseWise.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ExpenseWise - Register</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',Tahoma,sans-serif;
        }

        body{

            background:linear-gradient(135deg,#0F172A,#2563EB);
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            padding:30px;

        }

        .container{

            width:1000px;
            background:#fff;
            border-radius:20px;
            overflow:hidden;
            display:flex;
            box-shadow:0 15px 40px rgba(0,0,0,.3);

        }

        .left{

            width:42%;
            background:linear-gradient(180deg,#2563EB,#1E3A8A);

            color:#fff;

            padding:60px 40px;

            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;

        }

        .left h1{

            font-size:40px;
            margin-top:20px;

        }

        .left p{

            margin-top:20px;
            text-align:center;
            line-height:30px;
            font-size:18px;

        }

        .logo{

            font-size:90px;

        }

        .right{

            width:58%;
            padding:45px;

        }

        .heading{

            text-align:center;
            margin-bottom:30px;

        }

        .heading h2{

            color:#1E3A8A;
            font-size:34px;

        }

        .heading p{

            color:gray;
            margin-top:10px;

        }

        .row{

            display:flex;
            gap:15px;
            margin-bottom:18px;

        }

        .group{

            width:100%;

        }

        .group label{

            display:block;
            margin-bottom:8px;
            font-weight:600;
            color:#374151;

        }

        .txt{

            width:100%;
            padding:13px;
            border:1px solid #D1D5DB;
            border-radius:10px;
            font-size:15px;
            transition:.3s;

        }

        .txt:focus{

            outline:none;
            border-color:#2563EB;
            box-shadow:0 0 10px rgba(37,99,235,.25);

        }

        .btn{

            width:100%;
            padding:14px;
            background:#2563EB;
            color:white;
            border:none;
            border-radius:10px;
            font-size:18px;
            cursor:pointer;
            transition:.3s;

        }

        .btn:hover{

            background:#1D4ED8;

        }

        .btnReset{

            width:100%;
            padding:14px;
            background:#E5E7EB;
            color:#111827;
            border:none;
            border-radius:10px;
            font-size:18px;
            cursor:pointer;
            transition:.3s;

        }

        .btnReset:hover{

            background:#D1D5DB;

        }

        .buttons{

            display:flex;
            gap:15px;
            margin-top:15px;

        }

        .login{

            margin-top:20px;
            text-align:center;

        }

        .login a{

            text-decoration:none;
            color:#2563EB;
            font-weight:bold;

        }

        .validator{

            color:red;
            font-size:13px;

        }

        @media(max-width:900px){

            .container{

                flex-direction:column;
                width:100%;

            }

            .left,
            .right{

                width:100%;

            }

            .row{

                flex-direction:column;

            }

        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

<div class="left">

<div class="logo">💰</div>

<h1>ExpenseWise</h1>

<p>

Manage your income and expenses efficiently.

Track your financial journey with a secure and professional expense management system.

</p>

</div>

<div class="right">

<div class="heading">

<h2>Create Account</h2>

<p>Register to access ExpenseWise</p>

</div>

<div class="row">

    <div class="group">

        <label>Full Name</label>

        <asp:TextBox ID="txtName" runat="server"
            CssClass="txt"
            placeholder="Enter Full Name"></asp:TextBox>

        <asp:RequiredFieldValidator
            ID="rfvName"
            runat="server"
            ControlToValidate="txtName"
            ErrorMessage="* Required"
            CssClass="validator"
            Display="Dynamic">
        </asp:RequiredFieldValidator>

    </div>

</div>

<div class="row">

    <div class="group">

        <label>Email</label>

        <asp:TextBox ID="txtEmail" runat="server"
            CssClass="txt"
            TextMode="Email"
            placeholder="Enter Email"></asp:TextBox>

        <asp:RequiredFieldValidator
            ID="rfvEmail"
            runat="server"
            ControlToValidate="txtEmail"
            ErrorMessage="* Required"
            CssClass="validator">
        </asp:RequiredFieldValidator>

    </div>

    <div class="group">

        <label>Mobile Number</label>

        <asp:TextBox ID="txtMobile"
            runat="server"
            CssClass="txt"
            MaxLength="10"
            placeholder="9876543210"></asp:TextBox>

        <asp:RequiredFieldValidator
            ID="rfvMobile"
            runat="server"
            ControlToValidate="txtMobile"
            ErrorMessage="* Required"
            CssClass="validator">
        </asp:RequiredFieldValidator>

    </div>

</div>

<div class="row">

    <div class="group">

        <label>Username</label>

        <asp:TextBox ID="txtUsername"
            runat="server"
            CssClass="txt"
            placeholder="Username"></asp:TextBox>

        <asp:RequiredFieldValidator
            ID="rfvUsername"
            runat="server"
            ControlToValidate="txtUsername"
            ErrorMessage="* Required"
            CssClass="validator">
        </asp:RequiredFieldValidator>

    </div>

</div>

<div class="row">

    <div class="group">

        <label>Password</label>

        <asp:TextBox ID="txtPassword"
            runat="server"
            CssClass="txt"
            TextMode="Password"
            placeholder="Password"></asp:TextBox>

        <asp:RequiredFieldValidator
            ID="rfvPassword"
            runat="server"
            ControlToValidate="txtPassword"
            ErrorMessage="* Required"
            CssClass="validator">
        </asp:RequiredFieldValidator>

    </div>

    <div class="group">

        <label>Confirm Password</label>

        <asp:TextBox ID="txtConfirmPassword"
            runat="server"
            CssClass="txt"
            TextMode="Password"
            placeholder="Confirm Password"></asp:TextBox>

        <asp:CompareValidator
            ID="cvPassword"
            runat="server"
            ControlToCompare="txtPassword"
            ControlToValidate="txtConfirmPassword"
            ErrorMessage="Passwords do not match"
            CssClass="validator">
        </asp:CompareValidator>

    </div>

</div>

<div class="buttons">

    <asp:Button
        ID="btnRegister"
        runat="server"
        Text="Register"
        CssClass="btn"
        OnClick="btnRegister_Click" />

    <asp:Button
    ID="btnReset"
    runat="server"
    Text="Reset"
    CssClass="btnReset"
    CausesValidation="false"
    OnClick="btnReset_Click" />
</div>

<br />

<center>

<asp:Label
    ID="lblMessage"
    runat="server"
    Font-Bold="true"
    ForeColor="Green">
</asp:Label>

</center>

<div class="login">

Already have an account?

<a href="Login.aspx">

Login Here

</a>

</div>

</div>

</div>

</form>

</body>
</html>