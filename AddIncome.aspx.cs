using System;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;
using System.Web.UI;

namespace ExpenseWise
{
    public partial class AddIncome : System.Web.UI.Page
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
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedIndex == 0)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Please select Income Category.";
                return;
            }


            if (txtAmount.Text.Trim() == "")
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Please enter Amount.";
                return;
            }


            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();


                    string query = @"INSERT INTO Income
                                    (UserId, Category, Amount, IncomeDate, Description)
                                    VALUES
                                    (@UserId, @Category, @Amount, @IncomeDate, @Description)";


                    SqlCommand cmd = new SqlCommand(query, con);


                    cmd.Parameters.AddWithValue("@UserId",
                        Convert.ToInt32(Session["UserId"]));


                    cmd.Parameters.AddWithValue("@Category",
                        ddlCategory.SelectedItem.Text);


                    cmd.Parameters.AddWithValue("@Amount",
                        Convert.ToDecimal(txtAmount.Text.Trim()));


                    cmd.Parameters.AddWithValue("@IncomeDate",
                        Convert.ToDateTime(txtDate.Text));


                    cmd.Parameters.AddWithValue("@Description",
                        txtDescription.Text.Trim());


                    int result = cmd.ExecuteNonQuery();


                    if (result > 0)
                    {
                        lblMessage.ForeColor = Color.Green;
                        lblMessage.Text = "✅ Income Added Successfully.";

                        ClearData();
                    }
                    else
                    {
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "❌ Income Not Added.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = ex.Message;
            }
        }



        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearData();
            lblMessage.Text = "";
        }



        private void ClearData()
        {
            ddlCategory.SelectedIndex = 0;

            txtAmount.Text = "";

            txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            txtDescription.Text = "";
        }
    }
}