using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ExpenseWise
{
    public partial class AddExpense : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ExpenseWiseDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = @"INSERT INTO Expenses
                            (UserId, Category, Amount, ExpenseDate, Description)
                            VALUES
                            (@UserId, @Category, @Amount, @ExpenseDate, @Description)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@UserId",
                        Convert.ToInt32(Session["UserId"]));

                    cmd.Parameters.AddWithValue("@Category", txtCategory.Text.Trim());
                    cmd.Parameters.AddWithValue("@Amount", Convert.ToDecimal(txtAmount.Text));
                    cmd.Parameters.AddWithValue("@ExpenseDate", Convert.ToDateTime(txtDate.Text));
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());

                    int result = cmd.ExecuteNonQuery();

                    if (result > 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Expense Added Successfully!";

                        txtCategory.Text = "";
                        txtAmount.Text = "";
                        txtDate.Text = "";
                        txtDescription.Text = "";
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Failed to Add Expense!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtCategory.Text = "";
            txtAmount.Text = "";
            txtDate.Text = "";
            txtDescription.Text = "";
            lblMessage.Text = "";
        }
    }
}