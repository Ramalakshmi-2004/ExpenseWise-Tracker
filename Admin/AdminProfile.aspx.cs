using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ExpenseWise.Admin
{
    public partial class AdminProfile : System.Web.UI.Page
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
                LoadAdminProfile();
            }
        }


        // ==========================================
        // LOAD ADMIN PROFILE
        // ==========================================

        private void LoadAdminProfile()
        {
            try
            {
                int adminId =
                    Convert.ToInt32(Session["AdminId"]);


                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT
                            AdminId,
                            AdminName,
                            Username,
                            Password,
                            Email
                        FROM Admin
                        WHERE AdminId = @AdminId";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@AdminId",
                            adminId);


                        con.Open();


                        using (SqlDataReader reader =
                            cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Admin ID
                                txtAdminId.Text =
                                    reader["AdminId"].ToString();


                                // Admin Name
                                txtFullName.Text =
                                    reader["AdminName"].ToString();


                                // Email
                                txtEmail.Text =
                                    reader["Email"].ToString();


                                // Username
                                txtUsername.Text =
                                    reader["Username"].ToString();


                                // Password
                                txtPassword.Text =
                                    reader["Password"].ToString();


                                // Top bar name
                                lblAdminName.Text =
                                    reader["AdminName"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error loading profile: " + ex.Message;

                lblMessage.CssClass =
                    "message error-message";
            }
        }


        // ==========================================
        // UPDATE ADMIN PROFILE
        // ==========================================

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int adminId =
                    Convert.ToInt32(Session["AdminId"]);


                string adminName =
                    txtFullName.Text.Trim();


                string email =
                    txtEmail.Text.Trim();


                string username =
                    txtUsername.Text.Trim();


                string password =
                    txtPassword.Text.Trim();


                // VALIDATION

                if (string.IsNullOrEmpty(adminName))
                {
                    lblMessage.Text =
                        "Please enter Admin Name.";

                    lblMessage.CssClass =
                        "message error-message";

                    return;
                }


                if (string.IsNullOrEmpty(email))
                {
                    lblMessage.Text =
                        "Please enter Email.";

                    lblMessage.CssClass =
                        "message error-message";

                    return;
                }


                if (string.IsNullOrEmpty(username))
                {
                    lblMessage.Text =
                        "Please enter Username.";

                    lblMessage.CssClass =
                        "message error-message";

                    return;
                }


                if (string.IsNullOrEmpty(password))
                {
                    lblMessage.Text =
                        "Please enter Password.";

                    lblMessage.CssClass =
                        "message error-message";

                    return;
                }


                using (SqlConnection con =
                    new SqlConnection(connectionString))
                {
                    string query = @"
                        UPDATE Admin
                        SET
                            AdminName = @AdminName,
                            Username = @Username,
                            Password = @Password,
                            Email = @Email
                        WHERE AdminId = @AdminId";


                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@AdminName",
                            adminName);


                        cmd.Parameters.AddWithValue(
                            "@Username",
                            username);


                        cmd.Parameters.AddWithValue(
                            "@Password",
                            password);


                        cmd.Parameters.AddWithValue(
                            "@Email",
                            email);


                        cmd.Parameters.AddWithValue(
                            "@AdminId",
                            adminId);


                        con.Open();


                        int rows =
                            cmd.ExecuteNonQuery();


                        if (rows > 0)
                        {
                            // Update session
                            Session["AdminName"] =
                                adminName;


                            // Update top bar
                            lblAdminName.Text =
                                adminName;


                            lblMessage.Text =
                                "Profile updated successfully.";

                            lblMessage.CssClass =
                                "message";
                        }
                        else
                        {
                            lblMessage.Text =
                                "Profile could not be updated.";

                            lblMessage.CssClass =
                                "message error-message";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error updating profile: " + ex.Message;

                lblMessage.CssClass =
                    "message error-message";
            }
        }


        // ==========================================
        // LOGOUT
        // ==========================================

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