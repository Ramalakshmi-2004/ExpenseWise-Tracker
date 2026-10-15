using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace ExpenseWise
{
    public partial class Profile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ExpenseWiseDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        void LoadProfile()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM Users WHERE Username=@Username", con);

                cmd.Parameters.AddWithValue("@Username", Session["Username"].ToString());

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtName.Text = dr["FullName"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtMobile.Text = dr["Mobile"].ToString();
                    txtUsername.Text = dr["Username"].ToString();
                }

                dr.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    @"UPDATE Users
                      SET FullName=@FullName,
                          Email=@Email,
                          Mobile=@Mobile
                      WHERE Username=@Username", con);

                cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    Session["FullName"] = txtName.Text.Trim();

                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Text = "Profile Updated Successfully.";
                }
                else
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Profile Update Failed.";
                }
            }
        }
    }
}