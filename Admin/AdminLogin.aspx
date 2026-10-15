<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="AdminLogin.aspx.cs"
Inherits="ExpenseWise.Admin.AdminLogin" %>

<!DOCTYPE html>

<html>
<head runat="server">

```
<title>ExpenseWise - Admin Login</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />

<style>

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: Arial, sans-serif;
        background: #f4f6f9;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-container {
        width: 380px;
        background: white;
        padding: 35px;
        border-radius: 12px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.15);
    }

    .logo {
        text-align: center;
        margin-bottom: 25px;
    }

    .logo h1 {
        font-size: 30px;
        color: #2c3e50;
    }

    .logo p {
        color: #777;
        margin-top: 5px;
    }

    .form-group {
        margin-bottom: 18px;
    }

    .form-group label {
        display: block;
        margin-bottom: 7px;
        font-weight: bold;
        color: #333;
    }

    .input-box {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 15px;
    }

    .input-box:focus {
        outline: none;
        border-color: #3498db;
    }

    .login-btn {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 6px;
        background: #3498db;
        color: white;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
    }

    .login-btn:hover {
        background: #2980b9;
    }

    .message {
        display: block;
        text-align: center;
        margin-top: 15px;
        color: red;
    }

    .admin-icon {
        font-size: 45px;
        margin-bottom: 10px;
    }

</style>
```

</head>

<body>

```
<form id="form1" runat="server" autocomplete="off">

    <div class="login-container">

        <div class="logo">

            <div class="admin-icon">👨‍💼</div>

            <h1>ExpenseWise</h1>

            <p>Admin Login</p>

        </div>


        <div class="form-group">

            <asp:Label ID="lblUsername"
                runat="server"
                Text="Username">
            </asp:Label>

            <asp:TextBox ID="txtUsername"
                runat="server"
                CssClass="input-box"
                placeholder="Enter admin username"
                autocomplete="off">
            </asp:TextBox>

        </div>


        <div class="form-group">

            <asp:Label ID="lblPassword"
                runat="server"
                Text="Password">
            </asp:Label>

            <asp:TextBox ID="txtPassword"
                runat="server"
                TextMode="Password"
                CssClass="input-box"
                placeholder="Enter admin password"
                autocomplete="new-password">
            </asp:TextBox>

        </div>


        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="login-btn"
            OnClick="btnLogin_Click" />


        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>

    </div>

</form>
```

</body>
</html>
