<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="ExpenseWise.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logout - ExpenseWise</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{
            background:linear-gradient(135deg,#2563EB,#1E3A8A);
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .box{
            width:420px;
            background:white;
            padding:40px;
            border-radius:15px;
            text-align:center;
            box-shadow:0 10px 25px rgba(0,0,0,.3);
        }

        .icon{
            font-size:70px;
            margin-bottom:20px;
        }

        h2{
            color:#2563EB;
            margin-bottom:15px;
        }

        p{
            color:#555;
            font-size:17px;
            margin-bottom:25px;
        }

        .loader{
            width:45px;
            height:45px;
            border:5px solid #ddd;
            border-top:5px solid #2563EB;
            border-radius:50%;
            animation:spin 1s linear infinite;
            margin:auto;
        }

        @keyframes spin{
            from{transform:rotate(0deg);}
            to{transform:rotate(360deg);}
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="box">

    <div class="icon">👋</div>

    <h2>Logging Out...</h2>

    <p>
        Thank you for using <b>ExpenseWise</b>.<br />
        You are being redirected to the Login page.
    </p>

    <div class="loader"></div>

</div>

</form>

</body>
</html>