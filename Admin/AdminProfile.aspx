<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminProfile.aspx.cs"
    Inherits="ExpenseWise.Admin.AdminProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Admin Profile - ExpenseWise</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f6f9;
            color: #333;
        }

        /* TOP BAR */

        .topbar {
            height: 70px;
            background: #ffffff;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 30px;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
            color: #2563eb;
        }

        .admin-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .admin-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #2563eb;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .admin-name {
            font-weight: bold;
            color: #374151;
        }

        .logout-btn {
            background: #ef4444;
            color: white;
            border: none;
            padding: 9px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .logout-btn:hover {
            background: #dc2626;
        }

        /* SIDEBAR */

        .sidebar {
            position: fixed;
            top: 70px;
            left: 0;
            bottom: 0;
            width: 230px;
            background: #1e293b;
            padding: 25px 15px;
        }

        .menu-title {
            color: #94a3b8;
            font-size: 12px;
            margin-bottom: 15px;
            padding-left: 12px;
            font-weight: bold;
        }

        .menu-item {
            display: block;
            color: #cbd5e1;
            text-decoration: none;
            padding: 13px 15px;
            margin-bottom: 6px;
            border-radius: 7px;
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

        /* MAIN */

        .main {
            margin-left: 230px;
            padding: 100px 40px 40px;
        }

        .page-title {
            margin-bottom: 25px;
        }

        .page-title h1 {
            font-size: 28px;
            color: #1e293b;
            margin-bottom: 6px;
        }

        .page-title p {
            color: #64748b;
            font-size: 14px;
        }

        /* CARD */

        .profile-card {
            background: white;
            max-width: 850px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.06);
        }

        .profile-heading {
            display: flex;
            align-items: center;
            gap: 18px;
            padding-bottom: 25px;
            margin-bottom: 25px;
            border-bottom: 1px solid #e5e7eb;
        }

        .profile-avatar {
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

        .profile-heading h2 {
            color: #1e293b;
            margin-bottom: 5px;
        }

        .profile-heading p {
            color: #64748b;
            font-size: 13px;
        }

        /* FORM */

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            font-size: 13px;
            font-weight: bold;
            color: #475569;
            margin-bottom: 7px;
        }

        .input-box {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
            background: white;
        }

        .input-box:focus {
            outline: none;
            border-color: #2563eb;
        }

        .readonly {
            background: #e5e7eb;
            color: #64748b;
            cursor: not-allowed;
        }

        .button-area {
            margin-top: 25px;
        }

        .update-btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .update-btn:hover {
            background: #1d4ed8;
        }

        .message {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #16a34a;
        }

        .error-message {
            color: #dc2626;
        }

        @media (max-width: 800px) {

            .sidebar {
                width: 65px;
            }

            .main {
                margin-left: 65px;
                padding: 95px 20px;
            }

            .menu-title {
                display: none;
            }

            .menu-item {
                font-size: 0;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .admin-name {
                display: none;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <!-- TOP BAR -->

    <div class="topbar">

        <div class="logo">
            ExpenseWise
        </div>

        <div class="admin-info">

            <div class="admin-avatar">
                A
            </div>

            <asp:Label
                ID="lblAdminName"
                runat="server"
                CssClass="admin-name">
            </asp:Label>

            <asp:Button
                ID="btnLogout"
                runat="server"
                Text="Logout"
                CssClass="logout-btn"
                OnClick="btnLogout_Click" />

        </div>

    </div>


    <!-- SIDEBAR -->

    <div class="sidebar">

        <div class="menu-title">
            ADMIN MENU
        </div>

        <a href="AdminDashboard.aspx"
           class="menu-item">
            Dashboard
        </a>

        <a href="ManageUsers.aspx"
           class="menu-item">
            Manage Users
        </a>

        <a href="ManageIncome.aspx"
           class="menu-item">
            Manage Income
        </a>

        <a href="ManageExpenses.aspx"
           class="menu-item">
            Manage Expenses
        </a>

        <a href="Reports.aspx"
           class="menu-item">
            Reports
        </a>

        <a href="AdminProfile.aspx"
           class="menu-item active">
            Admin Profile
        </a>

    </div>


    <!-- MAIN CONTENT -->

    <div class="main">

        <div class="page-title">

            <h1>Admin Profile</h1>

            <p>
                View and update administrator account details.
            </p>

        </div>


        <div class="profile-card">

            <!-- PROFILE HEADER -->

            <div class="profile-heading">

                <div class="profile-avatar">
                    A
                </div>

                <div>

                    <h2>Administrator Profile</h2>

                    <p>
                        Manage your ExpenseWise administrator account.
                    </p>

                </div>

            </div>


            <!-- FORM -->

            <div class="form-grid">


                <!-- ADMIN ID -->

                <div class="form-group">

                    <label>
                        Admin ID
                    </label>

                    <asp:TextBox
                        ID="txtAdminId"
                        runat="server"
                        CssClass="input-box readonly"
                        ReadOnly="true">
                    </asp:TextBox>

                </div>


                <!-- ADMIN NAME -->

                <div class="form-group">

                    <label>
                        Full Name
                    </label>

                    <asp:TextBox
                        ID="txtFullName"
                        runat="server"
                        CssClass="input-box">
                    </asp:TextBox>

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label>
                        Email
                    </label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="input-box">
                    </asp:TextBox>

                </div>


                <!-- USERNAME -->

                <div class="form-group">

                    <label>
                        Username
                    </label>

                    <asp:TextBox
                        ID="txtUsername"
                        runat="server"
                        CssClass="input-box">
                    </asp:TextBox>

                </div>


                <!-- PASSWORD -->

                <div class="form-group">

                    <label>
                        Password
                    </label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        CssClass="input-box">
                    </asp:TextBox>

                </div>

            </div>


            <!-- BUTTON -->

            <div class="button-area">

                <asp:Button
                    ID="btnUpdate"
                    runat="server"
                    Text="Update Profile"
                    CssClass="update-btn"
                    OnClick="btnUpdate_Click" />

            </div>


            <!-- MESSAGE -->

            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</form>

</body>
</html>