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
    public partial class LetsGetCreative : System.Web.UI.Page
    {
        private void Reset()
        {
            txt_ideacontent.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }

        public void BindRepeater()
        {
            SqlConnection con = Connect();
            try
            {
                con.Open();
                SqlCommand cmnd = new SqlCommand("SELECT Content, USERID AS UserID FROM CREATIVE_PAGE", con);
                SqlDataReader da = cmnd.ExecuteReader();
                GridView1.DataSource = da;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                lb_error.Visible = true;
                lb_error.Text = ex.Message;
                lb_error.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();
            }
        }

        private static SqlConnection Connect()
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            return con;
        }

        protected void btn_postidea_Click(object sender, EventArgs e)
        {
            SqlConnection con = Connect();
            try
            {
                SqlCommand cmnd = new SqlCommand("INSERT INTO CREATIVE_PAGE VALUES(@CONTENT,@USERID)", con);
                cmnd.Parameters.AddWithValue("@CONTENT", txt_ideacontent.Text);
                cmnd.Parameters.AddWithValue("@USERID", Session["name"]);
                con.Open();
                int result = cmnd.ExecuteNonQuery();
                if (result >= 1)
                {
                    lb_error.Visible = true;
                    lb_error.Text = "Idea posted Successfully";
                    lb_error.ForeColor = System.Drawing.Color.Green;
                    Reset();
                    GridViewDataBind(con);
                }
                else
                {
                    lb_error.Visible = true;
                    lb_error.Text = "Idea couldn't post";
                    lb_error.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lb_error.Visible = true;
                lb_error.Text = ex.Message;
                lb_error.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();
            }
        }

        private void GridViewDataBind(SqlConnection con)
        {
            SqlCommand cmnd1 = new SqlCommand("SELECT Content, USERID AS UserID FROM CREATIVE_PAGE", con);
            SqlDataReader da = cmnd1.ExecuteReader();
            GridView1.DataSource = da;
            GridView1.DataBind();
        }
    }
}