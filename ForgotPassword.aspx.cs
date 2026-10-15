using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace ExpenseWise
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ExpenseWiseDB"].ConnectionString;

        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Username=@Username AND Email=@Email";

                SqlCommand checkCmd = new SqlCommand(checkQuery, con);

                checkCmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                if (count > 0)
                {
                    string updateQuery = "UPDATE Users SET Password=@Password WHERE Username=@Username";

                    SqlCommand updateCmd = new SqlCommand(updateQuery, con);

                    updateCmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    updateCmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());

                    updateCmd.ExecuteNonQuery();

                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Text = "Password updated successfully.";

                    Response.AddHeader("REFRESH", "2;URL=Login.aspx");
                }
                else
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Invalid Username or Email.";
                }
            }
        }
    }
}