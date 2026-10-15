using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ExpenseWise.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (username == "" || password == "")
            {
                lblMessage.Text = "Please enter username and password.";
                return;
            }

            string connectionString =
                ConfigurationManager.ConnectionStrings["ExpenseWiseDB"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT AdminId, AdminName
                                 FROM Admin
                                 WHERE Username = @Username
                                 AND Password = @Password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        Session["AdminId"] = dr["AdminId"].ToString();
                        Session["AdminName"] = dr["AdminName"].ToString();

                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password.";
                    }

                    dr.Close();
                }
            }
        }
    }
}