<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="ExpenseHistory.aspx.cs"
    Inherits="ExpenseWise.ExpenseHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>ExpenseWise | Expense History</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, sans-serif;
        }

        body {
            background: #F4F7FB;
            min-height: 100vh;
        }

        /* HEADER */

        .header {
            background: linear-gradient(135deg, #0F172A, #2563EB);
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 28px;
        }

        .header span {
            display: block;
            font-size: 15px;
            color: #E5E7EB;
            margin-top: 4px;
        }

        /* BACK BUTTON */

        .back-btn {
            text-decoration: none;
            background: white;
            color: #1E3A8A;
            padding: 10px 18px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            transition: .3s;
        }

        .back-btn:hover {
            background: #E5E7EB;
            color: #1D4ED8;
        }

        /* MAIN */

        .main {
            width: 95%;
            max-width: 1200px;
            margin: 35px auto;
        }

        .title-section {
            margin-bottom: 25px;
        }

        .title-section h2 {
            color: #1E3A8A;
            font-size: 30px;
        }

        .title-section p {
            color: #6B7280;
            margin-top: 5px;
        }

        /* SEARCH */

        .search-box {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,.08);
            margin-bottom: 25px;
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .search-input {
            flex: 1;
            padding: 12px 15px;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            font-size: 15px;
        }

        .search-input:focus {
            outline: none;
            border-color: #2563EB;
            box-shadow: 0 0 8px rgba(37,99,235,.15);
        }

        /* BUTTONS */

        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: .3s;
        }

        .search-btn {
            background: #2563EB;
        }

        .search-btn:hover {
            background: #1D4ED8;
        }

        .refresh-btn {
            background: #64748B;
        }

        .refresh-btn:hover {
            background: #475569;
        }

        /* TABLE */

        .table-container {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,.08);
            overflow-x: auto;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th {
            background: #1E3A8A;
            color: white;
            padding: 14px;
            text-align: left;
            font-size: 14px;
        }

        .grid td {
            padding: 13px;
            border-bottom: 1px solid #E5E7EB;
            color: #374151;
            font-size: 14px;
        }

        .grid tr:hover td {
            background: #F8FAFC;
        }

        /* GRID BUTTONS */

        .grid a {
            color: #2563EB;
            text-decoration: none;
            font-weight: bold;
            margin-right: 10px;
        }

        .grid a:hover {
            color: #1D4ED8;
            text-decoration: underline;
        }

        /* EDIT TEXTBOX */

        .grid input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #CBD5E1;
            border-radius: 6px;
            font-size: 14px;
        }

        .grid input[type="text"]:focus {
            outline: none;
            border-color: #2563EB;
        }

        /* MOBILE */

        @media(max-width:700px) {

            .header {
                padding: 18px 20px;
                flex-direction: column;
                gap: 10px;
                text-align: center;
            }

            .back-btn {
                margin-top: 5px;
            }

            .main {
                width: 95%;
            }

            .search-box {
                flex-direction: column;
                align-items: stretch;
            }

            .search-input {
                width: 100%;
            }

            .btn {
                width: 100%;
            }

        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <!-- HEADER -->

    <div class="header">

        <div>

            <h1>💰 ExpenseWise</h1>

            <span>Expense Management</span>

        </div>

        <a href="Dashboard.aspx" class="back-btn">
            ← Back to Dashboard
        </a>

    </div>


    <!-- MAIN CONTENT -->

    <div class="main">

        <div class="title-section">

            <h2>Expense History</h2>

            <p>
                View, search and manage your expense records
            </p>

        </div>


        <!-- SEARCH -->

        <div class="search-box">

            <asp:TextBox
                ID="txtSearch"
                runat="server"
                CssClass="search-input"
                placeholder="Search by category...">
            </asp:TextBox>


            <asp:Button
                ID="btnSearch"
                runat="server"
                Text="Search"
                CssClass="btn search-btn"
                OnClick="btnSearch_Click" />


            <asp:Button
                ID="btnRefresh"
                runat="server"
                Text="Refresh"
                CssClass="btn refresh-btn"
                OnClick="btnRefresh_Click" />

        </div>


        <!-- EXPENSE TABLE -->

        <div class="table-container">

            <asp:GridView
                ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="ExpenseID"
                CssClass="grid"
                AutoGenerateEditButton="True"
                AutoGenerateDeleteButton="True"
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowDeleting="GridView1_RowDeleting">

                <Columns>

                    <asp:BoundField
                        DataField="ExpenseID"
                        HeaderText="ID"
                        ReadOnly="True" />

                    <asp:BoundField
                        DataField="Category"
                        HeaderText="Category" />

                    <asp:BoundField
                        DataField="Amount"
                        HeaderText="Amount" />

                    <asp:BoundField
                        DataField="ExpenseDate"
                        HeaderText="Date" />

                    <asp:BoundField
                        DataField="Description"
                        HeaderText="Description" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</form>

</body>

</html>