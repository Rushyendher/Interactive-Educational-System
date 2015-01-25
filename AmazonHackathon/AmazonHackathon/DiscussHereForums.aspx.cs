using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AmazonHackathon
{
    public partial class DiscussHereForums : System.Web.UI.Page
    {
        int rows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
SqlConnection con = Con();
                try
                {
                    string query = "select * from THREAD";
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ddl_threads.DataSource = dt;
                    ddl_threads.DataBind();
                    ddl_threads.DataTextField = "TITLE";
                    ddl_threads.DataValueField = "TITLEID";
                    ddl_threads.DataBind();
                }
                catch (Exception ex)
                {

                }
            }
            if (!Page.IsPostBack)
            {
                GettiingData();
            }
        }


        protected void btn_thread_Click(object sender, EventArgs e)
        {
            SqlConnection con = Con();
            try
            {
                string query = "INSERT INTO THREAD VALUES(@TITLE)";
                SqlCommand cmnd = new SqlCommand(query, con);
                cmnd.Parameters.AddWithValue("@TITLE", txt_title.Text);
                con.Open();
                int result = cmnd.ExecuteNonQuery();

                if (result >= 1)
                {
                    lb_err.Visible = true;
                    lb_err.Text = "created successfully";
                    lb_err.ForeColor = System.Drawing.Color.Green;
                    txt_title.Text = "";
                    string query2 = "select * from THREAD";
                    SqlDataAdapter da = new SqlDataAdapter(query2, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ddl_threads.DataSource = dt;
                    ddl_threads.DataBind();
                    ddl_threads.DataTextField = "TITLE";
                    ddl_threads.DataValueField = "TITLEID";
                    ddl_threads.DataBind();
                }
                else
                {
                    lb_err.Visible = true;
                    lb_err.Text = "Not created";
                    lb_err.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lb_err.Visible = true;
                lb_err.Text = ex.Message;
                lb_err.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();
            }
        }

        protected void btn_postcontent_Click(object sender, EventArgs e)
        {
            SqlConnection con = Con();
            DateTime dt = DateTime.Now;
            string tid = ddl_threads.Text;
            int t_id = Convert.ToInt32(tid);

            try
            {
                string query = "INSERT INTO FORUM VALUES(@TITLEID,@QUESTION,@POSTERNMAE,@DATE_TIME)";
                SqlCommand cmnd = new SqlCommand(query, con);
                con.Open();
                cmnd.Parameters.AddWithValue("@TITLEID", t_id);
                cmnd.Parameters.AddWithValue("@QUESTION", txt_content.Text);


                cmnd.Parameters.AddWithValue("@POSTERNMAE", Session["name"]);
                
                
                cmnd.Parameters.AddWithValue("@DATE_TIME", dt);

                rows = cmnd.ExecuteNonQuery();
                if (rows >= 1)
                {
                    txt_content.Text = "";
                    string query2 = "SELECT QUESTION,POSTERNMAE,DATE_TIME FROM FORUM WHERE TITLEID = @TITLEID";
                    SqlCommand cmnd2 = new SqlCommand(query2, con);
                    cmnd2.Parameters.AddWithValue("@TITLEID", ddl_threads.SelectedValue);
                    GridView1.DataSource = cmnd2.ExecuteReader();
                    GridView1.DataBind();
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        private static SqlConnection Con()
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            return con;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ddl_threads_SelectedIndexChanged(object sender, EventArgs e)
        {
            GettiingData();
        }


        public void GettiingData()
        {

            SqlConnection con = Con();
            try
            {
                string query2 = "SELECT QUESTION,POSTERNMAE,DATE_TIME FROM FORUM WHERE TITLEID = @TITLEID";
                SqlCommand cmnd2 = new SqlCommand(query2, con);
                con.Open();
                cmnd2.Parameters.AddWithValue("@TITLEID", ddl_threads.SelectedValue);
                GridView1.DataSource = cmnd2.ExecuteReader();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            SqlConnection con = Con();

            try
            {
                string query = "select CATEGORY from REGISTRATION where USERID = @USERID ";

                SqlCommand cmnd = new SqlCommand(query,con);
                cmnd.Parameters.AddWithValue("@USERID", Session["name"]);
                con.Open();
                string cat = (string)cmnd.ExecuteScalar();
                if(cat == "Faculty")
                {
                    Response.Redirect("FProfile.aspx");
                }
                else
                {
                    Response.Redirect("SProfile.aspx");
                }
            }
            catch(Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }
    }
}