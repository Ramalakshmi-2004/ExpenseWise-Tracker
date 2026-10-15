using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ExpenseWise.Admin
{
    public partial class ManageIncome : System.Web.UI.Page
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
                LoadIncome();
                LoadTotalIncome();
            }
        }

        private void LoadAdminName()
        {
            if (Session["AdminName"] != null)
                lblAdminName.Text = Session["AdminName"].ToString();
            else
                lblAdminName.Text = "Administrator";
        }

        private void LoadIncome()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            IncomeId,
                            UserId,
                            Amount,
                            Category,
                            Description,
                            IncomeDate
                        FROM Income
                        ORDER BY IncomeDate DESC, IncomeId DESC";

                    using (SqlDataAdapter da =
                        new SqlDataAdapter(query, con))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        gvIncome.DataSource = dt;
                        gvIncome.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error loading income: " + ex.Message;
            }
        }

        private void LoadTotalIncome()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query =
                        "SELECT ISNULL(SUM(Amount), 0) FROM Income";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        con.Open();

                        decimal total =
                            Convert.ToDecimal(cmd.ExecuteScalar());

                        lblTotalIncome.Text =
                            total.ToString("N2");
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error loading total income: " + ex.Message;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();

            if (string.IsNullOrEmpty(searchText))
            {
                LoadIncome();
                return;
            }

            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            IncomeId,
                            UserId,
                            Amount,
                            Category,
                            Description,
                            IncomeDate
                        FROM Income
                        WHERE CAST(UserId AS VARCHAR(50)) LIKE @Search
                           OR Category LIKE @Search
                           OR Description LIKE @Search
                        ORDER BY IncomeDate DESC, IncomeId DESC";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Search",
                            "%" + searchText + "%");

                        using (SqlDataAdapter da =
                            new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();

                            da.Fill(dt);

                            gvIncome.DataSource = dt;
                            gvIncome.DataBind();

                            if (dt.Rows.Count == 0)
                                lblMessage.Text = "No income records found.";
                            else
                                lblMessage.Text = "";
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            lblMessage.Text = "";

            LoadIncome();
        }

        protected void gvIncome_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteIncome")
            {
                string incomeId =
                    e.CommandArgument.ToString();

                DeleteIncome(incomeId);
            }
        }

        private void DeleteIncome(string incomeId)
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query =
                        "DELETE FROM Income WHERE IncomeId = @IncomeId";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@IncomeId",
                            incomeId);

                        con.Open();

                        int rows =
                            cmd.ExecuteNonQuery();

                        if (rows > 0)
                        {
                            lblMessage.Text =
                                "Income record deleted successfully.";

                            LoadIncome();
                            LoadTotalIncome();
                        }
                        else
                        {
                            lblMessage.Text =
                                "Income record not found.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error deleting income: " + ex.Message;
            }
        }

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