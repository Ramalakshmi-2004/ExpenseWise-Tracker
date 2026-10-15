using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ExpenseWise
{
    public partial class IncomeHistory : System.Web.UI.Page
    {
        string cs = ConfigurationManager
            .ConnectionStrings["ExpenseWiseDB"]
            .ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadIncome();
            }
        }


        private void LoadIncome()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT
                                IncomeId,
                                UserId,
                                Amount,
                                Category,
                                Description,
                                IncomeDate
                                FROM Income
                                WHERE UserId = @UserId";

                SqlDataAdapter da =
                    new SqlDataAdapter(query, con);

                da.SelectCommand.Parameters.AddWithValue(
                    "@UserId",
                    Convert.ToInt32(Session["UserId"])
                );

                DataTable dt = new DataTable();

                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT
                                IncomeId,
                                UserId,
                                Amount,
                                Category,
                                Description,
                                IncomeDate
                                FROM Income
                                WHERE UserId = @UserId
                                AND Category LIKE @Category";

                SqlDataAdapter da =
                    new SqlDataAdapter(query, con);

                da.SelectCommand.Parameters.AddWithValue(
                    "@UserId",
                    Convert.ToInt32(Session["UserId"])
                );

                da.SelectCommand.Parameters.AddWithValue(
                    "@Category",
                    "%" + txtSearch.Text.Trim() + "%"
                );

                DataTable dt = new DataTable();

                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }


        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";

            GridView1.EditIndex = -1;

            LoadIncome();
        }


        protected void GridView1_RowEditing(
            object sender,
            GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;

            LoadIncome();
        }


        protected void GridView1_RowCancelingEdit(
            object sender,
            GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;

            LoadIncome();
        }


        protected void GridView1_RowUpdating(
            object sender,
            GridViewUpdateEventArgs e)
        {
            try
            {
                // Get IncomeId from DataKeys
                int incomeId = Convert.ToInt32(
                    GridView1.DataKeys[e.RowIndex].Value
                );

                GridViewRow row = GridView1.Rows[e.RowIndex];

                /*
                 * IMPORTANT:
                 * UserId is NOT taken from the GridView.
                 * It comes from the logged-in user's session.
                 */
                int userId = Convert.ToInt32(
                    Session["UserId"]
                );


                // Get the edited values from the GridView
                TextBox txtAmount =
                    row.FindControl("txtAmount") as TextBox;

                TextBox txtCategory =
                    row.FindControl("txtCategory") as TextBox;

                TextBox txtDescription =
                    row.FindControl("txtDescription") as TextBox;

                TextBox txtDate =
                    row.FindControl("txtIncomeDate") as TextBox;


                // Check controls
                if (txtAmount == null ||
                    txtCategory == null ||
                    txtDescription == null ||
                    txtDate == null)
                {
                    throw new Exception(
                        "Unable to find the edit controls in the GridView. " +
                        "Please check the TemplateField IDs in IncomeHistory.aspx."
                    );
                }


                // Validate Amount
                decimal amount;

                if (!decimal.TryParse(
                    txtAmount.Text.Trim(),
                    out amount))
                {
                    throw new Exception(
                        "Please enter a valid amount."
                    );
                }


                // Validate Date
                DateTime incomeDate;

                if (!DateTime.TryParse(
                    txtDate.Text.Trim(),
                    out incomeDate))
                {
                    throw new Exception(
                        "Please enter a valid date."
                    );
                }


                using (SqlConnection con =
                       new SqlConnection(cs))
                {
                    con.Open();


                    string query = @"UPDATE Income
                                     SET
                                         Amount = @Amount,
                                         Category = @Category,
                                         Description = @Description,
                                         IncomeDate = @IncomeDate
                                     WHERE IncomeId = @IncomeId
                                     AND UserId = @UserId";


                    using (SqlCommand cmd =
                           new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Amount",
                            amount
                        );

                        cmd.Parameters.AddWithValue(
                            "@Category",
                            txtCategory.Text.Trim()
                        );

                        cmd.Parameters.AddWithValue(
                            "@Description",
                            txtDescription.Text.Trim()
                        );

                        cmd.Parameters.AddWithValue(
                            "@IncomeDate",
                            incomeDate
                        );

                        cmd.Parameters.AddWithValue(
                            "@IncomeId",
                            incomeId
                        );

                        cmd.Parameters.AddWithValue(
                            "@UserId",
                            userId
                        );


                        cmd.ExecuteNonQuery();
                    }
                }


                GridView1.EditIndex = -1;

                LoadIncome();
            }
            catch (Exception ex)
            {
                // Display error message
                Response.Write(
                    "<script>alert('" +
                    ex.Message.Replace("'", "\\'") +
                    "');</script>"
                );
            }
        }


        protected void GridView1_RowDeleting(
            object sender,
            GridViewDeleteEventArgs e)
        {
            int incomeId = Convert.ToInt32(
                GridView1.DataKeys[e.RowIndex].Value
            );

            int userId = Convert.ToInt32(
                Session["UserId"]
            );


            using (SqlConnection con =
                   new SqlConnection(cs))
            {
                con.Open();


                SqlCommand cmd = new SqlCommand(
                    @"DELETE FROM Income
                      WHERE IncomeId = @IncomeId
                      AND UserId = @UserId",
                    con
                );


                cmd.Parameters.AddWithValue(
                    "@IncomeId",
                    incomeId
                );

                cmd.Parameters.AddWithValue(
                    "@UserId",
                    userId
                );


                cmd.ExecuteNonQuery();
            }


            LoadIncome();
        }
    }
}