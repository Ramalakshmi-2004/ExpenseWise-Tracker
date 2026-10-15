using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace ExpenseWise
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager
            .ConnectionStrings["ExpenseWiseDB"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = @"SELECT Userid, FullName, Username
                                     FROM Users
                                     WHERE Username = @Username
                                     AND Password = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Username",
                            txtUsername.Text.Trim());

                        cmd.Parameters.AddWithValue(
                            "@Password",
                            txtPassword.Text.Trim());

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                Session["UserId"] =
                                    dr["Userid"].ToString();

                                Session["Username"] =
                                    dr["Username"].ToString();

                                Session["FullName"] =
                                    dr["FullName"].ToString();

                                lblMessage.ForeColor = Color.Green;

                                lblMessage.Text =
                                    "✅ Login Successful! Redirecting...";

                                Response.AddHeader(
                                    "REFRESH",
                                    "2;URL=Dashboard.aspx");
                            }
                            else
                            {
                                lblMessage.ForeColor = Color.Red;

                                lblMessage.Text =
                                    "❌ Invalid Username or Password!";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = Color.Red;

                lblMessage.Text = ex.Message;
            }
        }
    }
}