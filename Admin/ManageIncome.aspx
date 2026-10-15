<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ManageIncome.aspx.cs"
    Inherits="ExpenseWise.Admin.ManageIncome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0" />

    <title>ExpenseWise - Manage Income</title>

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

        /* MAIN CONTENT */

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

        /* TOTAL INCOME */

        .income-summary {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px 25px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .summary-icon {
            width: 50px;
            height: 50px;
            background: #dcfce7;
            color: #16a34a;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
        }

        .summary-text p {
            color: #64748b;
            font-size: 13px;
            margin-bottom: 5px;
        }

        .summary-text h2 {
            color: #1e293b;
            font-size: 24px;
        }

        /* SEARCH */

        .search-panel {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .search-box {
            display: flex;
            gap: 10px;
        }

        .search-input {
            flex: 1;
            padding: 12px 14px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            font-size: 14px;
        }

        .search-input:focus {
            outline: none;
            border-color: #2563eb;
        }

        .search-btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 7px;
            cursor: pointer;
            font-weight: bold;
        }

        .search-btn:hover {
            background: #1d4ed8;
        }

        .clear-btn {
            background: #64748b;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 7px;
            cursor: pointer;
        }

        .clear-btn:hover {
            background: #475569;
        }

        /* TABLE */

        .table-panel {
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 25px;
            overflow-x: auto;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .table-header h2 {
            font-size: 18px;
            color: #1e293b;
        }

        .income-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .income-grid th {
            background: #f8fafc;
            color: #475569;
            font-size: 13px;
            font-weight: bold;
            padding: 14px 12px;
            text-align: left;
            border-bottom: 2px solid #e5e7eb;
        }

        .income-grid td {
            padding: 14px 12px;
            font-size: 13px;
            color: #475569;
            border-bottom: 1px solid #e5e7eb;
        }

        .income-grid tr:hover td {
            background: #f8fafc;
        }

        .amount {
            font-weight: bold;
            color: #16a34a;
        }

        .delete-btn {
            background: #ef4444;
            color: white;
            border: none;
            padding: 7px 13px;
            border-radius: 5px;
            cursor: pointer;
        }

        .delete-btn:hover {
            background: #dc2626;
        }

        .message {
            display: block;
            margin-bottom: 15px;
            color: #dc2626;
            font-size: 14px;
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
           class="menu-item active">

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

            <h1>Manage Income</h1>

            <p>
                View and manage income records of all ExpenseWise users.
            </p>

        </div>


        <!-- TOTAL INCOME -->

        <div class="income-summary">

            <div class="summary-icon">
                ₹
            </div>

            <div class="summary-text">

                <p>
                    Total Income
                </p>

                <h2>

                    ₹
                    <asp:Label ID="lblTotalIncome"
                        runat="server"
                        Text="0.00">
                    </asp:Label>

                </h2>

            </div>

        </div>


        <!-- SEARCH -->

        <div class="search-panel">

            <div class="search-box">

                <asp:TextBox ID="txtSearch"
                    runat="server"
                    CssClass="search-input"
                    placeholder="Search by User ID, Category or Description...">
                </asp:TextBox>


                <asp:Button ID="btnSearch"
                    runat="server"
                    Text="Search"
                    CssClass="search-btn"
                    OnClick="btnSearch_Click" />


                <asp:Button ID="btnClear"
                    runat="server"
                    Text="Clear"
                    CssClass="clear-btn"
                    OnClick="btnClear_Click" />

            </div>

        </div>


        <!-- INCOME TABLE -->

        <div class="table-panel">

            <div class="table-header">

                <h2>
                    Income Records
                </h2>

            </div>


            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>


            <asp:GridView ID="gvIncome"
                runat="server"
                CssClass="income-grid"
                AutoGenerateColumns="False"
                GridLines="None"
                EmptyDataText="No income records found."
                OnRowCommand="gvIncome_RowCommand">

                <Columns>

                    <asp:BoundField
                        DataField="IncomeId"
                        HeaderText="Income ID" />

                    <asp:BoundField
                        DataField="UserId"
                        HeaderText="User ID" />

                    <asp:BoundField
                        DataField="Amount"
                        HeaderText="Amount"
                        ItemStyle-CssClass="amount" />

                    <asp:BoundField
                        DataField="Category"
                        HeaderText="Category" />

                    <asp:BoundField
                        DataField="Description"
                        HeaderText="Description" />

                    <asp:BoundField
                        DataField="IncomeDate"
                        HeaderText="Income Date"
                        DataFormatString="{0:dd-MM-yyyy}" />

                    <asp:TemplateField
                        HeaderText="Action">

                        <ItemTemplate>

                            <asp:Button ID="btnDelete"
                                runat="server"
                                Text="Delete"
                                CssClass="delete-btn"
                                CommandName="DeleteIncome"
                                CommandArgument='<%# Eval("IncomeId") %>'
                                OnClientClick="return confirm('Are you sure you want to delete this income record?');" />

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </main>

</form>

</body>

</html>