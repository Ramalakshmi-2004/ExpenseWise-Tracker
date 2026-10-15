<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ExpenseWise.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ExpenseWise | Smart Expense Management</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet" />

    <link href="Content/main.css" rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

    <div class="page">

        <!-- NAVBAR -->
        <nav class="navbar">

            <div class="logo">
                <span class="logo-icon">₹</span>
                <span>Expense<span class="logo-highlight">Wise</span></span>
            </div>

            <div class="nav-text">
                Smart Finance Management
            </div>

        </nav>


        <!-- HERO SECTION -->
        <section class="hero">

            <div class="hero-content">

                <div class="small-title">
                    WELCOME TO EXPENSEWISE
                </div>

                <h1>
                    Manage Your Money
                    <span>Smarter.</span>
                </h1>

                <p class="description">
                    Track your income, control your expenses and
                    understand your financial habits — all in one place.
                </p>


                <!-- LOGIN CARDS -->
                <div class="login-container">

                    <!-- USER CARD -->
                    <div class="login-card">

                        <div class="card-icon user-icon">
                            👤
                        </div>

                        <div class="card-content">

                            <h2>User</h2>

                            <p>
                                Track income, manage expenses and
                                monitor your financial activity.
                            </p>

                            <asp:Button
                                ID="btnUserLogin"
                                runat="server"
                                Text="Continue as User  →"
                                CssClass="login-btn user-btn"
                                OnClick="btnUserLogin_Click" />

                        </div>

                    </div>


                    <!-- ADMIN CARD -->
                    <div class="login-card">

                        <div class="card-icon admin-icon">
                            🛡
                        </div>

                        <div class="card-content">

                            <h2>Administrator</h2>

                            <p>
                                Manage users, transactions and
                                system reports from the admin panel.
                            </p>

                            <asp:Button
                                ID="btnAdminLogin"
                                runat="server"
                                Text="Continue as Admin  →"
                                CssClass="login-btn admin-btn"
                                OnClick="btnAdminLogin_Click" />

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- FOOTER -->
        <footer>

            <div>
                Smart <span>•</span> Simple <span>•</span> Secure
            </div>

            <p>
                © 2026 ExpenseWise. All rights reserved.
            </p>

        </footer>

    </div>

</form>

</body>
</html>