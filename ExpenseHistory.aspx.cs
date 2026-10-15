using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ExpenseWise
{
    public partial class ExpenseHistory : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ExpenseWiseDB"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }


            if (!IsPostBack)
            {
                LoadExpenses();
            }
        }



        private void LoadExpenses()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT * FROM Expenses", con);

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
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT * FROM Expenses WHERE Category LIKE @Category", con);


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
            LoadExpenses();
        }




        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadExpenses();
        }



        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadExpenses();
        }




        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);


            GridViewRow row = GridView1.Rows[e.RowIndex];


            string category =
                ((TextBox)row.Cells[2].Controls[0]).Text;


            decimal amount =
                Convert.ToDecimal(((TextBox)row.Cells[3].Controls[0]).Text);


            string date =
                ((TextBox)row.Cells[4].Controls[0]).Text;


            string description =
                ((TextBox)row.Cells[5].Controls[0]).Text;



            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();


                SqlCommand cmd = new SqlCommand(
                @"UPDATE Expenses
                  SET Category=@Category,
                      Amount=@Amount,
                      ExpenseDate=@ExpenseDate,
                      Description=@Description
                  WHERE ExpenseID=@ExpenseID", con);



                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Amount", amount);
                cmd.Parameters.AddWithValue("@ExpenseDate", date);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@ExpenseID", id);


                cmd.ExecuteNonQuery();
            }


            GridView1.EditIndex = -1;

            LoadExpenses();
        }




        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);


            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();


                SqlCommand cmd = new SqlCommand(
                    "DELETE FROM Expenses WHERE ExpenseID=@ExpenseID",
                    con);


                cmd.Parameters.AddWithValue("@ExpenseID", id);


                cmd.ExecuteNonQuery();
            }


            LoadExpenses();
        }
    }
}