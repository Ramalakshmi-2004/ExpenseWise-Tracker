<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddIncome.aspx.cs" Inherits="ExpenseWise.AddIncome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ExpenseWise | Add Income</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{

            background:#F3F4F6;

        }

        .wrapper{

            display:flex;
            height:100vh;

        }

        /* Sidebar */

        .sidebar{

            width:250px;
            background:#14532D;
            color:white;

        }

        .logo{

            padding:25px;
            text-align:center;
            font-size:28px;
            font-weight:bold;
            background:#166534;

        }

        .menu{

            list-style:none;

        }

        .menu li{

            border-bottom:1px solid rgba(255,255,255,.10);

        }

        .menu li a{

            display:block;
            padding:18px 25px;
            color:white;
            text-decoration:none;
            transition:.3s;

        }

        .menu li a:hover{

            background:#22C55E;
            padding-left:35px;

        }

        /* Main */

        .main{

            flex:1;
            padding:40px;

        }

        .title{

            font-size:32px;
            color:#166534;
            margin-bottom:30px;

        }

        .card{

            width:650px;
            background:white;
            border-radius:15px;
            padding:35px;
            box-shadow:0 10px 25px rgba(0,0,0,.08);

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

        .txt,.ddl{

            width:100%;
            padding:12px;
            border:1px solid #D1D5DB;
            border-radius:8px;
            font-size:15px;

        }

        .txt:focus,.ddl:focus{

            outline:none;
            border-color:#16A34A;
            box-shadow:0 0 10px rgba(22,163,74,.30);

        }

        .buttons{

            display:flex;
            gap:15px;
            margin-top:25px;

        }

        .btnSave{

            background:#16A34A;
            color:white;
            border:none;
            padding:13px 25px;
            border-radius:8px;
            cursor:pointer;
            font-size:16px;

        }

        .btnSave:hover{

            background:#15803D;

        }

        .btnReset{

            background:#6B7280;
            color:white;
            border:none;
            padding:13px 25px;
            border-radius:8px;
            cursor:pointer;
            font-size:16px;

        }

        .btnReset:hover{

            background:#4B5563;

        }

        .msg{

            margin-top:20px;
            font-weight:bold;
            font-size:17px;

        }
        .dashboardBtn
{
    display:inline-block;
    background:#2563EB;
    color:white;
    padding:10px 20px;
    border-radius:8px;
    text-decoration:none;
    font-weight:bold;
}

.dashboardBtn:hover
{
    background:#1D4ED8;
}

    </style>

</head>

<body>

<form id="form1" runat="server">
    <div class="wrapper">
        <div class="sidebar">

<div class="logo">

💰 ExpenseWise

</div>

<ul class="menu">

<li><a href="Dashboard.aspx">🏠 Dashboard</a></li>

<li><a href="AddIncome.aspx">💰 Add Income</a></li>

<li><a href="AddExpense.aspx">💸 Add Expense</a></li>

<li><a href="IncomeHistory.aspx">📈 Income History</a></li>

<li><a href="ExpenseHistory.aspx">📉 Expense History</a></li>

<li><a href="Profile.aspx">👤 Profile</a></li>

</ul>

</div>

<div class="main">

<h1 class="title">💰 Add Income</h1>

<div class="card">

<div class="group">

<label>Income Category</label>

<asp:DropDownList ID="ddlCategory" runat="server" CssClass="ddl">

<asp:ListItem>Select Category</asp:ListItem>
<asp:ListItem>Salary</asp:ListItem>
<asp:ListItem>Business</asp:ListItem>
<asp:ListItem>Freelance</asp:ListItem>
<asp:ListItem>Gift</asp:ListItem>
<asp:ListItem>Interest</asp:ListItem>
<asp:ListItem>Other</asp:ListItem>

</asp:DropDownList>

</div>

<div class="group">

<label>Amount</label>

<asp:TextBox ID="txtAmount"
runat="server"
CssClass="txt"
TextMode="Number"
placeholder="Enter Amount">
</asp:TextBox>

</div>

<div class="group">

<label>Income Date</label>

<asp:TextBox ID="txtDate"
runat="server"
CssClass="txt"
TextMode="Date">
</asp:TextBox>

</div>

<div class="group">

<label>Description</label>

<asp:TextBox ID="txtDescription"
runat="server"
CssClass="txt"
TextMode="MultiLine"
Rows="4"
placeholder="Enter Description">
</asp:TextBox>

</div>

<div class="buttons">

<asp:Button
ID="btnSave"
runat="server"
Text="Save Income"
CssClass="btnSave"
OnClick="btnSave_Click" />

<asp:Button
ID="btnReset"
runat="server"
Text="Reset"
CssClass="btnReset"
CausesValidation="false"
OnClick="btnReset_Click" />
    <div style="margin:20px;">
    <asp:HyperLink 
        ID="lnkDashboard" 
        runat="server" 
        NavigateUrl="Dashboard.aspx"
        Text="⬅ Back to Dashboard"
        CssClass="dashboardBtn">
    </asp:HyperLink>
</div>

</div>

<br />

<asp:Label
ID="lblMessage"
runat="server"
CssClass="msg">
</asp:Label>

</div>

</div>

</div>

</form>

</body>

</html>
