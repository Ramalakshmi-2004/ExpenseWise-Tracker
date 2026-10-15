using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ExpenseWise.Admin
{
    public partial class ViewUser : System.Web.UI.Page
    {
        string connectionString =
            ConfigurationManager.ConnectionStrings["ExpenseWiseDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check admin login
            if (Session["AdminId"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadAdminName();
                LoadUserDetails();
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


        // ================= LOAD USER =================

        private void LoadUserDetails()
        {
            string userId = Request.QueryString["UserId"];

            if (string.IsNullOrEmpty(userId))
            {
                lblMessage.Text = "User ID is missing.";
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
                        WHERE UserId = @UserId";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@UserId",
                            userId);

                        con.Open();

                        using (SqlDataReader dr =
                            cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                lblUserId.Text =
                                    dr["UserId"].ToString();

                                lblFullName.Text =
                                    dr["FullName"].ToString();

                                lblName.Text =
                                    dr["FullName"].ToString();

                                lblEmail.Text =
                                    dr["Email"].ToString();

                                lblMobile.Text =
                                    dr["Mobile"].ToString();

                                lblUsername.Text =
                                    dr["Username"].ToString();

                                lblMessage.Text = "";
                            }
                            else
                            {
                                lblMessage.Text =
                                    "User not found.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error loading user: " + ex.Message;
            }
        }


        // ================= BACK BUTTON =================

        protected void btnBack_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect("ManageUsers.aspx");
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