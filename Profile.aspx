<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ExpenseWise.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{
            background:#EEF2FF;
        }

        .container{
            width:500px;
            margin:50px auto;
            background:#fff;
            padding:35px;
            border-radius:15px;
            box-shadow:0 5px 15px rgba(0,0,0,.2);
        }

        h2{
            text-align:center;
            color:#2563EB;
            margin-bottom:25px;
        }

        label{
            display:block;
            margin-top:15px;
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

        .btn{
            width:100%;
            margin-top:25px;
            padding:12px;
            background:#2563EB;
            color:white;
            border:none;
            border-radius:8px;
            font-size:17px;
            cursor:pointer;
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

        .btn:hover{
            background:#1D4ED8;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

<h2>My Profile</h2>

<label>Full Name</label>
<asp:TextBox ID="txtName" runat="server" CssClass="txt"></asp:TextBox>

<label>Email</label>
<asp:TextBox ID="txtEmail" runat="server" CssClass="txt"></asp:TextBox>

<label>Mobile</label>
<asp:TextBox ID="txtMobile" runat="server" CssClass="txt"></asp:TextBox>

<label>Username</label>
<asp:TextBox ID="txtUsername" runat="server" CssClass="txt" ReadOnly="true"></asp:TextBox>

<asp:Button
    ID="btnUpdate"
    runat="server"
    Text="Update Profile"
    CssClass="btn"
    OnClick="btnUpdate_Click"/>
        <div style="margin:20px;">
    <asp:HyperLink 
        ID="lnkDashboard" 
        runat="server" 
        NavigateUrl="Dashboard.aspx"
        Text="⬅ Back to Dashboard"
        CssClass="dashboardBtn">
    </asp:HyperLink>
</div>

<br /><br />

<center>
<asp:Label
    ID="lblMessage"
    runat="server"
    Font-Bold="true">
</asp:Label>
</center>

</div>

</form>

</body>
</html>