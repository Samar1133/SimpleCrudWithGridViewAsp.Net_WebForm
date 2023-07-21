using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Connectionstring"].ConnectionString);
        DataTable dt = new DataTable();
        bool isnew;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Grid();
                clear();

            }

        }

        public void Grid()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();

            SqlDataAdapter da = new SqlDataAdapter("Sp_Getemployee", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                grdview.DataSource = dt;
                grdview.DataBind();
            }
        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();

            if (btnsubmit.Text  == "Submit")
            {
                isnew = true;
            }
            else
            {
                isnew = false;

            }

            if (isnew == true)
            {
                SqlCommand cmd = new SqlCommand("Sp_insertemployee", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@insertorUpdate", "Insert");
                cmd.Parameters.AddWithValue("@eid", txteid.Text);
                cmd.Parameters.AddWithValue("@ename", txtename.Text);
                cmd.Parameters.AddWithValue("@edob", txtdob.Text);
                cmd.Parameters.AddWithValue("@epassword", txtpassword.Text);
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "messege", "Employee Added successfully !!", true);
                    Grid();
                    clear();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "messege", "Employee Addition Faild !!", true);

                }

            }
            else
            {
                SqlCommand cmd = new SqlCommand("Sp_insertemployee", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@insertorUpdate", "Update");
                cmd.Parameters.AddWithValue("@eid", txteid.Text);
                cmd.Parameters.AddWithValue("@ename", txtename.Text);
                cmd.Parameters.AddWithValue("@edob", txtdob.Text);
                cmd.Parameters.AddWithValue("@epassword", txtpassword.Text);
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "messege", "Employee Updated successfully !!", true);
                    Grid();
                    clear();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "messege", "Employee Updation Faild !!", true);

                }
            }

        }


        public void clear()
        {
            txteid.Text = txtename.Text = txtdob.Text = txtpassword.Text = "";
        }

        protected void grdview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                isnew = false;
                txteid.Enabled = true;
                btnsubmit.Text = "update";
                SqlDataAdapter da = new SqlDataAdapter("Sp_GetemployeeById", conn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@EID", e.CommandArgument);
                da.Fill(dt);

                txtename.Text = dt.Rows[0]["ename"].ToString();
                txteid.Text = dt.Rows[0]["eid"].ToString();
                txtpassword.Text = dt.Rows[0]["epassword"].ToString();
                txtdob.Text = dt.Rows[0]["edob"].ToString();

            }

            else
            {
                isnew = true;
            }
        }
    }
}