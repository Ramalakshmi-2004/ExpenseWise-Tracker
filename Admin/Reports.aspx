<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Reports.aspx.cs"
    Inherits="ExpenseWise.Admin.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0" />

    <title>ExpenseWise - Reports</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f5f7fb;
            color: #333;
        }

        /* TOP BAR */

        .topbar {
            height: 70px;
            width: 100%;
            background: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 30px;
            border-bottom: 1px solid #e5e7eb;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .brand-icon {
            width: 42px;
            height: 42px;
            background: #2563eb;
            color: white;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 21px;
            font-weight: bold;
        }

        .brand-name {
            font-size: 24px;
            font-weight: bold;
            color: #1e293b;
        }

        .admin-area {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .admin-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #dbeafe;
            color: #2563eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .admin-name {
            font-size: 14px;
            font-weight: bold;
            color: #334155;
        }

        .logout-btn {
            border: none;
            background: #ef4444;
            color: white;
            padding: 9px 16px;
            border-radius: 7px;
            cursor: pointer;
        }

        .logout-btn:hover {
            background: #dc2626;
        }

        /* SIDEBAR */

        .sidebar {
            position: fixed;
            top: 70px;
            left: 0;
            width: 235px;
            height: calc(100vh - 70px);
            background: #1e293b;
            padding: 25px 15px;
        }

        .menu-title {
            color: #94a3b8;
            font-size: 11px;
            font-weight: bold;
            text-transform: uppercase;
            padding: 0 15px 12px;
            letter-spacing: 1px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            gap: 13px;
            width: 100%;
            padding: 13px 15px;
            margin-bottom: 6px;
            color: #cbd5e1;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
        }

        .menu-item:hover {
            background: #334155;
            color: white;
        }

        .menu-item.active {
            background: #2563eb;
            color: white;
        }

        .menu-icon {
            width: 20px;
            text-align: center;
        }

        /* MAIN */

        .main-content {
            margin-left: 235px;
            padding: 100px 35px 35px;
        }

        .page-header {
            margin-bottom: 25px;
        }

        .page-header h1 {
            font-size: 28px;
            color: #1e293b;
            margin-bottom: 7px;
        }

        .page-header p {
            color: #64748b;
            font-size: 14px;
        }

        /* SUMMARY CARDS */

        .cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 25px;
        }

        .card {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 22px;
        }

        .card-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .card-title {
            color: #64748b;
            font-size: 13px;
        }

        .card-icon {
            width: 42px;
            height: 42px;
            border-radius: 9px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 19px;
        }

        .users-icon {
            background: #dbeafe;
            color: #2563eb;
        }

        .income-icon {
            background: #dcfce7;
            color: #16a34a;
        }

        .expense-icon {
            background: #fee2e2;
            color: #dc2626;
        }

        .balance-icon {
            background: #fef3c7;
            color: #d97706;
        }

        .card-value {
            font-size: 25px;
            font-weight: bold;
            color: #1e293b;
        }

        /* REPORT BOX */

        .report-box {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
        }

        .report-box h2 {
            font-size: 18px;
            color: #1e293b;
            margin-bottom: 20px;
        }

        .comparison {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .comparison-item {
            padding: 20px;
            border-radius: 10px;
        }

        .income-box {
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
        }

        .expense-box {
            background: #fef2f2;
            border: 1px solid #fecaca;
        }

        .comparison-item h3 {
            font-size: 14px;
            color: #64748b;
            margin-bottom: 8px;
        }

        .comparison-item .value {
            font-size: 25px;
            font-weight: bold;
        }

        .income-value {
            color: #16a34a;
        }

        .expense-value {
            color: #dc2626;
        }

        /* MESSAGE */

        .message {
            display: block;
            margin-bottom: 15px;
            color: #dc2626;
        }

        /* RESPONSIVE */

        @media (max-width: 1100px) {

            .cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 800px) {

            .sidebar {
                width: 65px;
                padding: 20px 8px;
            }

            .menu-title {
                display: none;
            }

            .menu-item {
                justify-content: center;
                padding: 13px 5px;
            }

            .menu-item span:not(.menu-icon) {
                display: none;
            }

            .main-content {
                margin-left: 65px;
                padding: 95px 15px 25px;
            }

            .admin-name {
                display: none;
            }

            .brand-name {
                font-size: 20px;
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .comparison {
                grid-template-columns: 1fr;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <!-- TOP BAR -->

    <header class="topbar">

        <div class="brand">

            <div class="brand-icon">
                E
            </div>

            <div class="brand-name">
                ExpenseWise
            </div>

        </div>


        <div class="admin-area">

            <div class="admin-avatar">
                A
            </div>

            <asp:Label ID="lblAdminName"
                runat="server"
                CssClass="admin-name"
                Text="Administrator">
            </asp:Label>

            <asp:Button ID="btnLogout"
                runat="server"
                Text="Logout"
                CssClass="logout-btn"
                OnClick="btnLogout_Click" />

        </div>

    </header>


    <!-- SIDEBAR -->

    <aside class="sidebar">

        <div class="menu-title">
            Main Menu
        </div>


        <a href="AdminDashboard.aspx"
           class="menu-item">

            <span class="menu-icon">⌂</span>
            <span>Dashboard</span>

        </a>


        <a href="ManageUsers.aspx"
           class="menu-item">

            <span class="menu-icon">♟</span>
            <span>Manage Users</span>

        </a>


        <a href="ManageIncome.aspx"
           class="menu-item">

            <span class="menu-icon">₹</span>
            <span>Income</span>

        </a>


        <a href="ManageExpenses.aspx"
           class="menu-item">

            <span class="menu-icon">−</span>
            <span>Expenses</span>

        </a>


        <a href="Reports.aspx"
           class="menu-item active">

            <span class="menu-icon">▥</span>
            <span>Reports</span>

        </a>


        <a href="AdminProfile.aspx"
           class="menu-item">

            <span class="menu-icon">●</span>
            <span>Admin Profile</span>

        </a>

    </aside>


    <!-- MAIN CONTENT -->

    <main class="main-content">

        <div class="page-header">

            <h1>Reports</h1>

            <p>
                Overall ExpenseWise financial summary.
            </p>

        </div>


        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>


        <!-- SUMMARY CARDS -->

        <div class="cards">


            <!-- USERS -->

            <div class="card">

                <div class="card-top">

                    <span class="card-title">
                        Total Users
                    </span>

                    <div class="card-icon users-icon">
                        ♟
                    </div>

                </div>

                <div class="card-value">

                    <asp:Label ID="lblTotalUsers"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </div>

            </div>


            <!-- INCOME -->

            <div class="card">

                <div class="card-top">

                    <span class="card-title">
                        Total Income
                    </span>

                    <div class="card-icon income-icon">
                        ₹
                    </div>

                </div>

                <div class="card-value">

                    ₹
                    <asp:Label ID="lblTotalIncome"
                        runat="server"
                        Text="0.00">
                    </asp:Label>

                </div>

            </div>


            <!-- EXPENSE -->

            <div class="card">

                <div class="card-top">

                    <span class="card-title">
                        Total Expenses
                    </span>

                    <div class="card-icon expense-icon">
                        ₹
                    </div>

                </div>

                <div class="card-value">

                    ₹
                    <asp:Label ID="lblTotalExpenses"
                        runat="server"
                        Text="0.00">
                    </asp:Label>

                </div>

            </div>


            <!-- BALANCE -->

            <div class="card">

                <div class="card-top">

                    <span class="card-title">
                        Overall Balance
                    </span>

                    <div class="card-icon balance-icon">
                        ₹
                    </div>

                </div>

                <div class="card-value">

                    ₹
                    <asp:Label ID="lblBalance"
                        runat="server"
                        Text="0.00">
                    </asp:Label>

                </div>

            </div>

        </div>


        <!-- COMPARISON -->

        <div class="report-box">

            <h2>
                Income vs Expenses
            </h2>

            <div class="comparison">


                <div class="comparison-item income-box">

                    <h3>
                        Total Income
                    </h3>

                    <div class="value income-value">

                        ₹
                        <asp:Label ID="lblIncomeSummary"
                            runat="server"
                            Text="0.00">
                        </asp:Label>

                    </div>

                </div>


                <div class="comparison-item expense-box">

                    <h3>
                        Total Expenses
                    </h3>

                    <div class="value expense-value">

                        ₹
                        <asp:Label ID="lblExpenseSummary"
                            runat="server"
                            Text="0.00">
                        </asp:Label>

                    </div>

                </div>

            </div>

        </div>

    </main>

</form>

</body>

</html>