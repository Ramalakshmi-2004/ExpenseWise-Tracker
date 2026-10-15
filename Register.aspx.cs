using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


namespace ExpenseWise
{
    public partial class Register : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ExpenseWiseDB"].ConnectionString;
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Check if Username or Email already exists
                    string checkQuery = "SELECT COUNT(*) FROM Users WHERE Username=@Username OR Email=@Email";
                    SqlCommand checkCmd = new SqlCommand(checkQuery, con);

                    checkCmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                    int count = (int)checkCmd.ExecuteScalar();

                    if (count > 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Username or Email already exists. Please use a different one.";
                        return;
                    }

                    // Insert new user
                    string query = @"INSERT INTO Users
                            (FullName, Email, Mobile, Username, Password)
                            VALUES
                            (@FullName, @Email, @Mobile, @Username, @Password)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Registration Successful!";

                        // Clear textboxes
                        txtName.Text = "";
                        txtEmail.Text = "";
                        txtMobile.Text = "";
                        txtUsername.Text = "";
                        txtPassword.Text = "";
                        txtConfirmPassword.Text = "";
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Registration Failed!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            lblMessage.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
    }
}