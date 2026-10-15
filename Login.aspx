<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ExpenseWise.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>ExpenseWise | Login</title>

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
            width:900px;
            background:#fff;
            border-radius:20px;
            overflow:hidden;
            display:flex;
            box-shadow:0 15px 40px rgba(0,0,0,.30);
        }

        .left{
            width:45%;
            background:linear-gradient(180deg,#2563EB,#1E3A8A);
            color:white;
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
            padding:50px;
            text-align:center;
        }

        .logo{
            font-size:90px;
        }

        .left h1{
            margin-top:20px;
            font-size:40px;
        }

        .left p{
            margin-top:20px;
            line-height:30px;
            font-size:18px;
            color:#E5E7EB;
        }

        .right{
            width:55%;
            padding:50px;
        }

        .heading{
            text-align:center;
            margin-bottom:35px;
        }

        .heading h2{
            color:#1E3A8A;
            font-size:34px;
        }

        .heading p{
            color:gray;
            margin-top:8px;
        }

        .group{
            margin-bottom:20px;
        }

        .group label{
            display:block;
            margin-bottom:8px;
            font-weight:bold;
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

        .links{
            display:flex;
            justify-content:space-between;
            margin-top:20px;
            font-size:15px;
        }

        .links a{
            text-decoration:none;
            color:#2563EB;
            font-weight:bold;
        }

        .message{
            text-align:center;
            margin-top:15px;
            font-weight:bold;
        }

        @media(max-width:900px){

            .container{
                width:100%;
                flex-direction:column;
            }

            .left,
            .right{
                width:100%;
            }

        }

    </style>

</head>

<body>

<form id="form1" runat="server" autocomplete="off">

    <div class="container">

        <div class="left">

            <div class="logo">💰</div>

            <h1>ExpenseWise</h1>

            <p>
                Welcome back!

                Login to manage your income, expenses and savings securely.
            </p>

        </div>


        <div class="right">

            <div class="heading">

                <h2>Login</h2>

                <p>Enter your credentials to continue</p>

            </div>


            <div class="group">

                <label>Username</label>

                <asp:TextBox
                    ID="txtUsername"
                    runat="server"
                    CssClass="txt"
                    placeholder="Enter Username"
                    autocomplete="off">
                </asp:TextBox>

            </div>


            <div class="group">

                <label>Password</label>

                <asp:TextBox
                    ID="txtPassword"
                    runat="server"
                    CssClass="txt"
                    TextMode="Password"
                    placeholder="Enter Password"
                    autocomplete="new-password">
                </asp:TextBox>

            </div>


            <div style="margin-bottom:20px;">

                <asp:CheckBox
                    ID="chkShowPassword"
                    runat="server"
                    Text=" Show Password"
                    onclick="togglePassword();" />

            </div>


            <asp:Button
                ID="btnLogin"
                runat="server"
                Text="Login"
                CssClass="btn"
                OnClick="btnLogin_Click" />


            <br />
            <br />


            <center>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    Font-Bold="true"
                    ForeColor="Red">
                </asp:Label>

            </center>


            <div class="links">

                <a href="Register.aspx">
                    Create Account
                </a>

                <a href="ForgotPassword.aspx">
                    Forgot Password?
                </a>

            </div>

        </div>

    </div>

</form>


<script>

    function togglePassword() {

    var txt = document.getElementById("<%= txtPassword.ClientID %>");

    if (txt.type == "password")
        txt.type = "text";
    else
        txt.type = "password";

}

</script>

</body>

</html>