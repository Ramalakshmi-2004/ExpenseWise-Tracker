using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ExpenseWise.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        string connectionString =
            ConfigurationManager.ConnectionStrings["ExpenseWiseDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check whether admin is logged in
            if (Session["AdminId"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadAdminName();
                LoadDashboardData();
            }
        }

        // Display Admin Name
        private void LoadAdminName()
        {
            if (Session["AdminName"] != null)
            {
                lblAdminName.Text = Session["AdminName"].ToString();
            }
        }

        // Load Dashboard Statistics
        private void LoadDashboardData()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // ================= TOTAL USERS =================

                string userQuery = "SELECT COUNT(*) FROM Users";

                using (SqlCommand cmd = new SqlCommand(userQuery, con))
                {
                    int totalUsers = Convert.ToInt32(cmd.ExecuteScalar());

                    lblTotalUsers.Text = totalUsers.ToString();
                }


                // ================= TOTAL INCOME =================

                string incomeQuery =
                    "SELECT ISNULL(SUM(Amount), 0) FROM Income";

                using (SqlCommand cmd = new SqlCommand(incomeQuery, con))
                {
                    decimal totalIncome =
                        Convert.ToDecimal(cmd.ExecuteScalar());

                    lblTotalIncome.Text =
                        "₹" + totalIncome.ToString("N2");
                }


                // ================= TOTAL EXPENSES =================

                string expenseQuery =
                    "SELECT ISNULL(SUM(Amount), 0) FROM Expenses";

                using (SqlCommand cmd = new SqlCommand(expenseQuery, con))
                {
                    decimal totalExpenses =
                        Convert.ToDecimal(cmd.ExecuteScalar());

                    lblTotalExpenses.Text =
                        "₹" + totalExpenses.ToString("N2");
                }


                // ================= OVERALL BALANCE =================

                string balanceQuery = @"
                    SELECT
                    (SELECT ISNULL(SUM(Amount), 0)
                     FROM Income)
                    -
                    (SELECT ISNULL(SUM(Amount), 0)
                     FROM Expenses)";

                using (SqlCommand cmd =
                       new SqlCommand(balanceQuery, con))
                {
                    decimal balance =
                        Convert.ToDecimal(cmd.ExecuteScalar());

                    lblBalance.Text =
                        "₹" + balance.ToString("N2");
                }
            }
        }


        // ================= LOGOUT =================

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("AdminLogin.aspx");
        }
    }
}