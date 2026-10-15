<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ViewUser.aspx.cs"
    Inherits="ExpenseWise.Admin.ViewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0" />

    <title>ExpenseWise - View User</title>

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

        /* USER CARD */

        .user-card {
            max-width: 800px;
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 30px;
        }

        .profile-section {
            display: flex;
            align-items: center;
            gap: 20px;
            padding-bottom: 25px;
            border-bottom: 1px solid #e5e7eb;
            margin-bottom: 25px;
        }

        .profile-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: #dbeafe;
            color: #2563eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            font-weight: bold;
        }

        .profile-section h2 {
            color: #1e293b;
            font-size: 22px;
            margin-bottom: 5px;
        }

        .profile-section p {
            color: #64748b;
            font-size: 13px;
        }

        /* DETAILS */

        .details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .detail-box {
            background: #f8fafc;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 18px;
        }

        .detail-label {
            display: block;
            color: #64748b;
            font-size: 12px;
            margin-bottom: 8px;
        }

        .detail-value {
            color: #1e293b;
            font-size: 15px;
            font-weight: bold;
        }

        /* BUTTONS */

        .actions {
            margin-top: 25px;
            display: flex;
            gap: 10px;
        }

        .back-btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 11px 20px;
            border-radius: 7px;
            cursor: pointer;
            font-size: 14px;
        }

        .back-btn:hover {
            background: #1d4ed8;
        }

        .message {
            color: #dc2626;
            margin-bottom: 15px;
            display: block;
        }

        /* RESPONSIVE */

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

            .details {
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
           class="menu-item active">

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


    <!-- MAIN CONTENT -->

    <main class="main-content">

        <div class="page-header">

            <h1>View User</h1>

            <p>
                View registered user information.
            </p>

        </div>


        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>


        <div class="user-card">

            <div class="profile-section">

                <div class="profile-icon">
                    U
                </div>

                <div>

                    <h2>
                        <asp:Label ID="lblFullName"
                            runat="server"
                            Text="User Name">
                        </asp:Label>
                    </h2>

                    <p>
                        ExpenseWise User
                    </p>

                </div>

            </div>


            <div class="details">

                <div class="detail-box">

                    <span class="detail-label">
                        User ID
                    </span>

                    <asp:Label ID="lblUserId"
                        runat="server"
                        CssClass="detail-value">
                    </asp:Label>

                </div>


                <div class="detail-box">

                    <span class="detail-label">
                        Full Name
                    </span>

                    <asp:Label ID="lblName"
                        runat="server"
                        CssClass="detail-value">
                    </asp:Label>

                </div>


                <div class="detail-box">

                    <span class="detail-label">
                        Email
                    </span>

                    <asp:Label ID="lblEmail"
                        runat="server"
                        CssClass="detail-value">
                    </asp:Label>

                </div>


                <div class="detail-box">

                    <span class="detail-label">
                        Mobile
                    </span>

                    <asp:Label ID="lblMobile"
                        runat="server"
                        CssClass="detail-value">
                    </asp:Label>

                </div>


                <div class="detail-box">

                    <span class="detail-label">
                        Username
                    </span>

                    <asp:Label ID="lblUsername"
                        runat="server"
                        CssClass="detail-value">
                    </asp:Label>

                </div>

            </div>


            <div class="actions">

                <asp:Button ID="btnBack"
                    runat="server"
                    Text="← Back to Users"
                    CssClass="back-btn"
                    OnClick="btnBack_Click" />

            </div>

        </div>

    </main>

</form>

</body>

</html>