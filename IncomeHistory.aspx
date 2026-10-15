<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="IncomeHistory.aspx.cs"
    Inherits="ExpenseWise.IncomeHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>ExpenseWise | Income History</title>

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

        /* EDIT BOX */

        .edit-box {
            width: 100%;
            padding: 8px;
            border: 1px solid #CBD5E1;
            border-radius: 6px;
            font-size: 14px;
        }

        .edit-box:focus {
            outline: none;
            border-color: #2563EB;
        }

        .empty-message {
            text-align: center;
            padding: 25px;
            color: #6B7280;
            font-size: 16px;
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

            <span>Income Management</span>

        </div>

        <a href="Dashboard.aspx" class="back-btn">
            ← Back to Dashboard
        </a>

    </div>


    <!-- MAIN CONTENT -->

    <div class="main">

        <div class="title-section">

            <h2>Income History</h2>

            <p>
                View, search and manage your income records
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


        <!-- INCOME TABLE -->

        <div class="table-container">

            <asp:GridView
                ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="grid"
                DataKeyNames="IncomeId"
                OnRowEditing="GridView1_RowEditing"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowUpdating="GridView1_RowUpdating"
                OnRowDeleting="GridView1_RowDeleting"
                EmptyDataText="No income records found.">

                <Columns>

                    <asp:BoundField
                        DataField="IncomeId"
                        HeaderText="Income ID"
                        ReadOnly="True" />


                    <asp:BoundField
                        DataField="UserId"
                        HeaderText="User ID"
                        ReadOnly="True" />


                    <asp:TemplateField HeaderText="Amount">

                        <ItemTemplate>

                            <%# Eval("Amount") %>

                        </ItemTemplate>


                        <EditItemTemplate>

                            <asp:TextBox
                                ID="txtAmount"
                                runat="server"
                                CssClass="edit-box"
                                Text='<%# Bind("Amount") %>'>
                            </asp:TextBox>

                        </EditItemTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Category">

                        <ItemTemplate>

                            <%# Eval("Category") %>

                        </ItemTemplate>


                        <EditItemTemplate>

                            <asp:TextBox
                                ID="txtCategory"
                                runat="server"
                                CssClass="edit-box"
                                Text='<%# Bind("Category") %>'>
                            </asp:TextBox>

                        </EditItemTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Description">

                        <ItemTemplate>

                            <%# Eval("Description") %>

                        </ItemTemplate>


                        <EditItemTemplate>

                            <asp:TextBox
                                ID="txtDescription"
                                runat="server"
                                CssClass="edit-box"
                                Text='<%# Bind("Description") %>'>
                            </asp:TextBox>

                        </EditItemTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Income Date">

                        <ItemTemplate>

                            <%# Eval("IncomeDate", "{0:dd-MM-yyyy}") %>

                        </ItemTemplate>


                        <EditItemTemplate>

                            <asp:TextBox
                                ID="txtIncomeDate"
                                runat="server"
                                CssClass="edit-box"
                                Text='<%# Bind("IncomeDate", "{0:yyyy-MM-dd}") %>'
                                TextMode="Date">
                            </asp:TextBox>

                        </EditItemTemplate>

                    </asp:TemplateField>


                    <asp:CommandField
                        ShowEditButton="True"
                        ShowDeleteButton="True"
                        HeaderText="Actions"
                        ButtonType="Link"
                        EditText="Edit"
                        DeleteText="Delete"
                        UpdateText="Update"
                        CancelText="Cancel" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</form>

</body>

</html>