using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ExpenseWise.Admin
{
    public partial class ManageExpenses : System.Web.UI.Page
    {
        string connectionString =
            ConfigurationManager.ConnectionStrings["ExpenseWiseDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminId"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadAdminName();
                LoadExpenses();
                LoadTotalExpenses();
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

        // ================= LOAD EXPENSES =================

        private void LoadExpenses()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            ExpenseId,
                            UserId,
                            Category,
                            Amount,
                            ExpenseDate,
                            Description
                        FROM Expenses
                        ORDER BY ExpenseDate DESC, ExpenseId DESC";

                    using (SqlDataAdapter da =
                        new SqlDataAdapter(query, con))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        gvExpenses.DataSource = dt;
                        gvExpenses.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error loading expenses: " + ex.Message;
            }
        }

        // ================= TOTAL EXPENSES =================

        private void LoadTotalExpenses()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query =
                        "SELECT ISNULL(SUM(Amount), 0) FROM Expenses";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        con.Open();

                        decimal total =
                            Convert.ToDecimal(cmd.ExecuteScalar());

                        lblTotalExpenses.Text =
                            total.ToString("N2");
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error loading total expenses: " + ex.Message;
            }
        }

        // ================= SEARCH =================

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText =
                txtSearch.Text.Trim();

            if (string.IsNullOrEmpty(searchText))
            {
                LoadExpenses();
                return;
            }

            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            ExpenseId,
                            UserId,
                            Category,
                            Amount,
                            ExpenseDate,
                            Description
                        FROM Expenses
                        WHERE CAST(UserId AS VARCHAR(50)) LIKE @Search
                           OR Category LIKE @Search
                           OR Description LIKE @Search
                        ORDER BY ExpenseDate DESC, ExpenseId DESC";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Search",
                            "%" + searchText + "%");

                        using (SqlDataAdapter da =
                            new SqlDataAdapter(cmd))
                        {
                            DataTable dt =
                                new DataTable();

                            da.Fill(dt);

                            gvExpenses.DataSource = dt;
                            gvExpenses.DataBind();

                            if (dt.Rows.Count == 0)
                            {
                                lblMessage.Text =
                                    "No expense records found.";
                            }
                            else
                            {
                                lblMessage.Text = "";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Search error: " + ex.Message;
            }
        }

        // ================= CLEAR SEARCH =================

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            lblMessage.Text = "";

            LoadExpenses();
        }

        // ================= DELETE COMMAND =================

        protected void gvExpenses_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteExpense")
            {
                string expenseId =
                    e.CommandArgument.ToString();

                DeleteExpense(expenseId);
            }
        }

        // ================= DELETE EXPENSE =================

        private void DeleteExpense(string expenseId)
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query =
                        "DELETE FROM Expenses WHERE ExpenseId = @ExpenseId";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@ExpenseId",
                            expenseId);

                        con.Open();

                        int rows =
                            cmd.ExecuteNonQuery();

                        if (rows > 0)
                        {
                            lblMessage.Text =
                                "Expense record deleted successfully.";

                            LoadExpenses();
                            LoadTotalExpenses();
                        }
                        else
                        {
                            lblMessage.Text =
                                "Expense record not found.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error deleting expense: " + ex.Message;
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