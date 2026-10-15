<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminDashboard.aspx.cs"
    Inherits="ExpenseWise.Admin.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <title>ExpenseWise - Admin Dashboard</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f5f7fb;
            color: #333;
        }

        /* ================= HEADER ================= */

        .topbar {
            height: 70px;
            width: 100%;
            background-color: #ffffff;
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
            background-color: #2563eb;
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
            gap: 15px;
        }

        .admin-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #dbeafe;
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
            background-color: #ef4444;
            color: white;
            padding: 9px 16px;
            border-radius: 7px;
            cursor: pointer;
            font-size: 14px;
        }

        .logout-btn:hover {
            background-color: #dc2626;
        }


        /* ================= SIDEBAR ================= */

        .sidebar {
            position: fixed;
            top: 70px;
            left: 0;
            width: 235px;
            height: calc(100vh - 70px);
            background-color: #1e293b;
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
            transition: 0.2s;
        }

        .menu-item:hover {
            background-color: #334155;
            color: white;
        }

        .menu-item.active {
            background-color: #2563eb;
            color: white;
        }

        .menu-icon {
            width: 20px;
            text-align: center;
            font-size: 16px;
        }


        /* ================= MAIN ================= */

        .main-content {
            margin-left: 235px;
            padding: 100px 35px 35px;
        }

        .page-header {
            margin-bottom: 30px;
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


        /* ================= CARDS ================= */

        .cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background-color: white;
            border-radius: 12px;
            padding: 23px;
            border: 1px solid #e5e7eb;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-info p {
            color: #64748b;
            font-size: 13px;
            margin-bottom: 10px;
        }

        .card-info h2 {
            font-size: 25px;
            color: #1e293b;
        }

        .card-icon {
            width: 48px;
            height: 48px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }

        .users-icon {
            background-color: #dbeafe;
            color: #2563eb;
        }

        .income-icon {
            background-color: #dcfce7;
            color: #16a34a;
        }

        .expense-icon {
            background-color: #fee2e2;
            color: #dc2626;
        }

        .balance-icon {
            background-color: #fef3c7;
            color: #d97706;
        }


        /* ================= CONTENT GRID ================= */

        .content-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
        }

        .panel {
            background-color: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 25px;
        }

        .panel-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .panel-header h2 {
            font-size: 18px;
            color: #1e293b;
        }

        .panel-header span {
            color: #64748b;
            font-size: 13px;
        }


        /* ================= QUICK ACTIONS ================= */

        .quick-action {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px;
            border: 1px solid #e5e7eb;
            border-radius: 9px;
            text-decoration: none;
            margin-bottom: 12px;
            transition: 0.2s;
        }

        .quick-action:hover {
            border-color: #2563eb;
            background-color: #f8fafc;
        }

        .action-icon {
            width: 42px;
            height: 42px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #eff6ff;
            color: #2563eb;
            font-size: 18px;
        }

        .action-text h3 {
            color: #334155;
            font-size: 14px;
            margin-bottom: 4px;
        }

        .action-text p {
            color: #94a3b8;
            font-size: 12px;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 1100px) {

            .cards {
                grid-template-columns: repeat(2, 1fr);
            }

            .content-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 700px) {

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

            .cards {
                grid-template-columns: 1fr;
            }

            .admin-name {
                display: none;
            }

            .brand-name {
                font-size: 20px;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <!-- ================= TOP BAR ================= -->

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


    <!-- ================= SIDEBAR ================= -->

    <aside class="sidebar">

        <div class="menu-title">
            Main Menu
        </div>


        <a href="AdminDashboard.aspx"
           class="menu-item active">

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
           class="menu-item">

            <span class="menu-icon">▥</span>

            <span>Reports</span>

        </a>


        <a href="AdminProfile.aspx"
           class="menu-item">

            <span class="menu-icon">●</span>

            <span>Admin Profile</span>

        </a>

    </aside>


    <!-- ================= MAIN CONTENT ================= -->

    <main class="main-content">


        <!-- Page Heading -->

        <div class="page-header">

            <h1>Dashboard</h1>

            <p>
                Welcome back! Here's what's happening with ExpenseWise.
            </p>

        </div>


        <!-- ================= STATISTICS ================= -->

        <div class="cards">


            <!-- USERS -->

            <div class="card">

                <div class="card-info">

                    <p>Total Users</p>

                    <h2>

                        <asp:Label ID="lblTotalUsers"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </h2>

                </div>

                <div class="card-icon users-icon">
                    ♟
                </div>

            </div>


            <!-- INCOME -->

            <div class="card">

                <div class="card-info">

                    <p>Total Income</p>

                    <h2>

                        <asp:Label ID="lblTotalIncome"
                            runat="server"
                            Text="₹0">
                        </asp:Label>

                    </h2>

                </div>

                <div class="card-icon income-icon">
                    ₹
                </div>

            </div>


            <!-- EXPENSE -->

            <div class="card">

                <div class="card-info">

                    <p>Total Expenses</p>

                    <h2>

                        <asp:Label ID="lblTotalExpenses"
                            runat="server"
                            Text="₹0">
                        </asp:Label>

                    </h2>

                </div>

                <div class="card-icon expense-icon">
                    −
                </div>

            </div>


            <!-- BALANCE -->

            <div class="card">

                <div class="card-info">

                    <p>Overall Balance</p>

                    <h2>

                        <asp:Label ID="lblBalance"
                            runat="server"
                            Text="₹0">
                        </asp:Label>

                    </h2>

                </div>

                <div class="card-icon balance-icon">
                    =
                </div>

            </div>

        </div>


        <!-- ================= LOWER SECTION ================= -->

        <div class="content-grid">


            <!-- SYSTEM OVERVIEW -->

            <div class="panel">

                <div class="panel-header">

                    <h2>
                        ExpenseWise Overview
                    </h2>

                    <span>
                        Admin Panel
                    </span>

                </div>

                <p style="color:#64748b; line-height:1.8; font-size:14px;">

                    ExpenseWise helps users manage their income
                    and expenses efficiently. As an administrator,
                    you can monitor registered users, income,
                    expenses and generate reports from this panel.

                </p>

            </div>


            <!-- QUICK ACTIONS -->

            <div class="panel">

                <div class="panel-header">

                    <h2>
                        Quick Actions
                    </h2>

                </div>


                <a href="ManageUsers.aspx"
                   class="quick-action">

                    <div class="action-icon">
                        ♟
                    </div>

                    <div class="action-text">

                        <h3>
                            Manage Users
                        </h3>

                        <p>
                            View registered users
                        </p>

                    </div>

                </a>


                <a href="ManageIncome.aspx"
                   class="quick-action">

                    <div class="action-icon">
                        ₹
                    </div>

                    <div class="action-text">

                        <h3>
                            View Income
                        </h3>

                        <p>
                            Monitor user income
                        </p>

                    </div>

                </a>


                <a href="ManageExpenses.aspx"
                   class="quick-action">

                    <div class="action-icon">
                        −
                    </div>

                    <div class="action-text">

                        <h3>
                            View Expenses
                        </h3>

                        <p>
                            Monitor user expenses
                        </p>

                    </div>

                </a>


                <a href="Reports.aspx"
                   class="quick-action">

                    <div class="action-icon">
                        ▥
                    </div>

                    <div class="action-text">

                        <h3>
                            Reports
                        </h3>

                        <p>
                            View financial reports
                        </p>

                    </div>

                </a>

            </div>

        </div>

    </main>

</form>

</body>

</html>