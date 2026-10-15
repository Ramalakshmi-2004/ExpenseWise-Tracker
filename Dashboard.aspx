<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ExpenseWise.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ExpenseWise Dashboard</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{
            background:#F3F6FB;
        }

        .header{
            width:100%;
            background:#2563EB;
            color:white;
            padding:20px 40px;
            display:flex;
            justify-content:space-between;
            align-items:center;
        }

        .header h2{
            font-size:30px;
        }

        .rightHeader{
            display:flex;
            align-items:center;
            gap:20px;
            font-size:18px;
            font-weight:bold;
        }

        .logoutBtn{
            background:#DC2626;
            color:white;
            border:none;
            padding:10px 20px;
            border-radius:8px;
            cursor:pointer;
            font-size:15px;
            font-weight:bold;
        }

        .logoutBtn:hover{
            background:#B91C1C;
        }

        .container{
            width:95%;
            margin:40px auto;
        }

        .cards{
            display:flex;
            justify-content:center;
            gap:25px;
            flex-wrap:wrap;
            margin-bottom:40px;
        }

        .card{
            width:300px;
            border-radius:15px;
            color:white;
            padding:30px;
            text-align:center;
            box-shadow:0 8px 20px rgba(0,0,0,.2);
        }

        .income{
            background:#22C55E;
        }

        .expense{
            background:#EF4444;
        }

        .balance{
            background:#2563EB;
        }

        .card h3{
            margin-bottom:20px;
            font-size:24px;
        }

        .value{
            font-size:34px;
            font-weight:bold;
        }

        .menu{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
            gap:20px;
        }

        .box{
            background:white;
            border-radius:12px;
            text-align:center;
            padding:25px;
            box-shadow:0 5px 15px rgba(0,0,0,.15);
            transition:.3s;
        }

        .box:hover{
            transform:translateY(-5px);
        }

        .box h4{
            color:#1E3A8A;
            margin-bottom:15px;
            font-size:22px;
        }

        .box p{
            color:#666;
            margin-bottom:15px;
            font-size:15px;
        }

        .btn{
            display:inline-block;
            padding:10px 22px;
            background:#2563EB;
            color:white;
            text-decoration:none;
            border-radius:8px;
            font-weight:bold;
        }

        .btn:hover{
            background:#1D4ED8;
        }

    </style>

</head>
    <body>

<form id="form1" runat="server">

    <div class="header">

        <h2>ExpenseWise Dashboard</h2>

        <div class="rightHeader">

            <span>
                Welcome,
                <asp:Label ID="lblUser" runat="server"></asp:Label> 👋
            </span>

            <asp:Button
                ID="btnLogout"
                runat="server"
                Text="Logout"
                CssClass="logoutBtn"
                PostBackUrl="~/Logout.aspx" />

        </div>

    </div>

    <div class="container">

        <div class="cards">

            <div class="card income">

                <h3>💰 Total Income</h3>

                <div class="value">
                    <asp:Label ID="lblIncome" runat="server" Text="₹0.00"></asp:Label>
                </div>

            </div>

            <div class="card expense">

                <h3>💸 Total Expense</h3>

                <div class="value">
                    <asp:Label ID="lblExpense" runat="server" Text="₹0.00"></asp:Label>
                </div>

            </div>

            <div class="card balance">

                <h3>💵 Current Balance</h3>

                <div class="value">
                    <asp:Label ID="lblBalance" runat="server" Text="₹0.00"></asp:Label>
                </div>

            </div>

        </div>

        <div class="menu">

            <div class="box">
                <h4>➕ Add Income</h4>
                <p>Add a new income record.</p>
                <a href="AddIncome.aspx" class="btn">Open</a>
            </div>

            <div class="box">
                <h4>➖ Add Expense</h4>
                <p>Add a new expense record.</p>
                <a href="AddExpense.aspx" class="btn">Open</a>
            </div>

            <div class="box">
                <h4>📈 Income History</h4>
                <p>View, edit and delete income records.</p>
                <a href="IncomeHistory.aspx" class="btn">Open</a>
            </div>

            <div class="box">
                <h4>📉 Expense History</h4>
                <p>View, edit and delete expense records.</p>
                <a href="ExpenseHistory.aspx" class="btn">Open</a>
            </div>

            <div class="box">
                <h4>👤 Profile</h4>
                <p>View and update your profile.</p>
                <a href="Profile.aspx" class="btn">Open</a>
            </div>

            <div class="box">
                <h4>🚪 Logout</h4>
                <p>Sign out of ExpenseWise.</p>
                <a href="Logout.aspx"
                   class="btn"
                   style="background:#DC2626;">Logout</a>
            </div>

        </div>

    </div>

</form>

</body>
</html>