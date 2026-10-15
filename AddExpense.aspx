<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddExpense.aspx.cs" Inherits="ExpenseWise.AddExpense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Expense</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{
            background:linear-gradient(135deg,#0F172A,#2563EB);
            display:flex;
            justify-content:center;
            align-items:center;
            min-height:100vh;
        }

        .container{
            width:650px;
            background:white;
            padding:40px;
            border-radius:15px;
            box-shadow:0 15px 35px rgba(0,0,0,.25);
        }

        h2{
            text-align:center;
            color:#1E3A8A;
            margin-bottom:30px;
        }

        .group{
            margin-bottom:18px;
        }

        label{
            display:block;
            margin-bottom:8px;
            font-weight:bold;
        }

        .txt{
            width:100%;
            padding:12px;
            border:1px solid #ccc;
            border-radius:8px;
            font-size:15px;
        }

        .txt:focus{
            outline:none;
            border-color:#2563EB;
        }

        .btns{
            display:flex;
            gap:15px;
            margin-top:20px;
        }

        .btnSave{
            flex:1;
            padding:12px;
            background:#2563EB;
            color:white;
            border:none;
            border-radius:8px;
            cursor:pointer;
            font-size:17px;
        }

        .btnReset{
            flex:1;
            padding:12px;
            background:#E5E7EB;
            border:none;
            border-radius:8px;
            cursor:pointer;
            font-size:17px;
        }

        .validator{
            color:red;
            font-size:13px;
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

<div class="container">

<h2>Add Expense</h2>

<div class="group">

<label>Category</label>

<asp:TextBox ID="txtCategory" runat="server" CssClass="txt"></asp:TextBox>

<asp:RequiredFieldValidator
ID="rfvCategory"
runat="server"
ControlToValidate="txtCategory"
ErrorMessage="Category Required"
CssClass="validator" />

</div>

<div class="group">

<label>Amount</label>

<asp:TextBox ID="txtAmount" runat="server" CssClass="txt" TextMode="Number"></asp:TextBox>

<asp:RequiredFieldValidator
ID="rfvAmount"
runat="server"
ControlToValidate="txtAmount"
ErrorMessage="Amount Required"
CssClass="validator"/>

</div>

<div class="group">

<label>Date</label>

<asp:TextBox ID="txtDate" runat="server" CssClass="txt" TextMode="Date"></asp:TextBox>

<asp:RequiredFieldValidator
ID="rfvDate"
runat="server"
ControlToValidate="txtDate"
ErrorMessage="Date Required"
CssClass="validator"/>

</div>

<div class="group">

<label>Description</label>

<asp:TextBox
ID="txtDescription"
runat="server"
CssClass="txt"
TextMode="MultiLine"
Rows="4"></asp:TextBox>

</div>

<div class="btns">

<asp:Button
ID="btnSave"
runat="server"
Text="Save Expense"
CssClass="btnSave"
OnClick="btnSave_Click"/>

<asp:Button
ID="btnReset"
runat="server"
Text="Reset"
CssClass="btnReset"
CausesValidation="false"
OnClick="btnReset_Click"/>
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

<center>

<asp:Label
ID="lblMessage"
runat="server"
Font-Bold="true"></asp:Label>

</center>

</div>

</form>

</body>
</html>