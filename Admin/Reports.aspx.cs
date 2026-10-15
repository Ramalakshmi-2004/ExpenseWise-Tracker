using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ExpenseWise.Admin
{
    public partial class Reports : System.Web.UI.Page
    {
        string connectionString =
            ConfigurationManager.ConnectionStrings["ExpenseWiseDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check Admin Login
            if (Session["AdminId"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadAdminName();
                LoadReportData();
            }
        }

        // ================= ADMIN NAME =================

        private void LoadAdminName()
        {
            if (Session["AdminName"] != null)
            {
                lblAdminName.Text =
                    Session["AdminName"].ToString();
            }
            else
            {
                lblAdminName.Text = "Administrator";
            }
        }

        // ================= LOAD REPORT =================

        private void LoadReportData()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    con.Open();

                    // ================= TOTAL USERS =================

                    string userQuery =
                        "SELECT COUNT(*) FROM Users";

                    using (SqlCommand cmdUsers =
                        new SqlCommand(userQuery, con))
                    {
                        int totalUsers =
                            Convert.ToInt32(
                                cmdUsers.ExecuteScalar());

                        lblTotalUsers.Text =
                            totalUsers.ToString();
                    }


                    // ================= TOTAL INCOME =================

                    string incomeQuery =
                        "SELECT ISNULL(SUM(Amount), 0) FROM Income";

                    decimal totalIncome = 0;

                    using (SqlCommand cmdIncome =
                        new SqlCommand(incomeQuery, con))
                    {
                        totalIncome =
                            Convert.ToDecimal(
                                cmdIncome.ExecuteScalar());

                        lblTotalIncome.Text =
                            totalIncome.ToString("N2");

                        lblIncomeSummary.Text =
                            totalIncome.ToString("N2");
                    }


                    // ================= TOTAL EXPENSES =================

                    string expenseQuery =
                        "SELECT ISNULL(SUM(Amount), 0) FROM Expenses";

                    decimal totalExpenses = 0;

                    using (SqlCommand cmdExpense =
                        new SqlCommand(expenseQuery, con))
                    {
                        totalExpenses =
                            Convert.ToDecimal(
                                cmdExpense.ExecuteScalar());

                        lblTotalExpenses.Text =
                            totalExpenses.ToString("N2");

                        lblExpenseSummary.Text =
                            totalExpenses.ToString("N2");
                    }


                    // ================= BALANCE =================

                    decimal balance =
                        totalIncome - totalExpenses;

                    lblBalance.Text =
                        balance.ToString("N2");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error loading reports: " + ex.Message;
            }
        }

        // ================= LOGOUT =================

        protected void btnLogout_Click(
            object sender,
            EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("AdminLogin.aspx");
        }
    }
}