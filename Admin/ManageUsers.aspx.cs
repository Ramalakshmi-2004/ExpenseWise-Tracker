using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ExpenseWise.Admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        // Database connection
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
                LoadUsers();
                LoadTotalUsers();
            }
        }


        // ================= ADMIN NAME =================

        private void LoadAdminName()
        {
            if (Session["AdminName"] != null)
            {
                lblAdminName.Text = Session["AdminName"].ToString();
            }
            else
            {
                lblAdminName.Text = "Administrator";
            }
        }


        // ================= LOAD USERS =================

        private void LoadUsers()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            UserId,
                            FullName,
                            Email,
                            Mobile,
                            Username
                        FROM Users
                        ORDER BY UserId DESC";

                    using (SqlDataAdapter da =
                        new SqlDataAdapter(query, con))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        gvUsers.DataSource = dt;
                        gvUsers.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error loading users: " + ex.Message;
            }
        }


        // ================= TOTAL USERS =================

        private void LoadTotalUsers()
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query =
                        "SELECT COUNT(*) FROM Users";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        con.Open();

                        int totalUsers =
                            Convert.ToInt32(cmd.ExecuteScalar());

                        lblTotalUsers.Text =
                            totalUsers.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error loading user count: " + ex.Message;
            }
        }


        // ================= SEARCH =================

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText =
                txtSearch.Text.Trim();

            if (string.IsNullOrEmpty(searchText))
            {
                LoadUsers();
                return;
            }

            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            UserId,
                            FullName,
                            Email,
                            Mobile,
                            Username
                        FROM Users
                        WHERE FullName LIKE @Search
                           OR Email LIKE @Search
                           OR Username LIKE @Search
                        ORDER BY UserId DESC";

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

                            gvUsers.DataSource = dt;
                            gvUsers.DataBind();

                            if (dt.Rows.Count == 0)
                            {
                                lblMessage.Text =
                                    "No users found.";
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

            LoadUsers();
        }


        // ================= VIEW / DELETE =================

        protected void gvUsers_RowCommand(
            object sender,
            System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewUser")
            {
                string userId =
                    e.CommandArgument.ToString();

                Response.Redirect(
                    "ViewUser.aspx?UserId=" + userId);
            }


            if (e.CommandName == "DeleteUser")
            {
                string userId =
                    e.CommandArgument.ToString();

                DeleteUser(userId);
            }
        }


        // ================= DELETE USER =================

        private void DeleteUser(string userId)
        {
            try
            {
                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query =
                        "DELETE FROM Users WHERE UserId = @UserId";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@UserId",
                            userId);

                        con.Open();

                        int rows =
                            cmd.ExecuteNonQuery();

                        if (rows > 0)
                        {
                            lblMessage.Text =
                                "User deleted successfully.";

                            LoadUsers();
                            LoadTotalUsers();
                        }
                        else
                        {
                            lblMessage.Text =
                                "User not found.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error deleting user: " + ex.Message;
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