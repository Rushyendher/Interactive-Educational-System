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
    public partial class WriteOnlineExam : System.Web.UI.Page
    {
        DataSet ds = new DataSet();

        int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            Label1.Text = DateTime.Now.ToString();
            if (!IsPostBack)
            {
                

                ViewState["i"] = 0;
                SqlDataAdapter da = new SqlDataAdapter("SELECT QID,QUESTION,OP1,OP2,OP3,OP4 FROM CONDUCTEXAM", con);
                DataSet ds = new DataSet();
                da.Fill(ds, "CONDUCTEXAM");
                lb_qno.Text = ds.Tables[0].Rows[0]["QID"].ToString() + ":-";
                lb_ques.Text = ds.Tables[0].Rows[0]["QUESTION"].ToString();
                rb_op1.Text = ds.Tables[0].Rows[0]["OP1"].ToString();
                rb_op2.Text = ds.Tables[0].Rows[0]["OP2"].ToString();
                rb_op3.Text = ds.Tables[0].Rows[0]["OP3"].ToString();
                rb_op4.Text = ds.Tables[0].Rows[0]["OP4"].ToString();
            }

            con.Close(); 
        }


        protected void rb_op1_CheckedChanged1(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string query = "INSERT INTO USER_ANS_INSERT VALUES(@QID,@USERANS,@USERID)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@QID", lb_qno.Text);
            cmd.Parameters.AddWithValue("@USERANS", rb_op1.Text);
            cmd.Parameters.AddWithValue("@USERID", Session["name"]);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void rb_op2_CheckedChanged(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string query = "INSERT INTO USER_ANS_INSERT VALUES(@QID,@USERANS,@USERID)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@QID", lb_qno.Text);
            cmd.Parameters.AddWithValue("@USERANS", rb_op2.Text);
            cmd.Parameters.AddWithValue("@USERID", Session["name"]);
            cmd.ExecuteNonQuery();

            con.Close();

        }

        protected void rb_op3_CheckedChanged(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string query = "INSERT INTO USER_ANS_INSERT VALUES(@QID,@USERANS,@USERID)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@QID", lb_qno.Text);
            cmd.Parameters.AddWithValue("@USERANS", rb_op3.Text);
            cmd.Parameters.AddWithValue("@USERID", Session["name"]);
            cmd.ExecuteNonQuery();

            con.Close();
        }

        protected void rb_op4_CheckedChanged(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string query = "INSERT INTO USER_ANS_INSERT VALUES(@QID,@USERANS,@USERID)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@QID", lb_qno.Text);
            cmd.Parameters.AddWithValue("@USERANS", rb_op4.Text);
            cmd.Parameters.AddWithValue("@USERID", Session["name"]);
            cmd.ExecuteNonQuery();

            con.Close();
        }

        protected void btn_next_ques_Click(object sender, EventArgs e)
        {
            rb_op1.Checked = false;
            rb_op2.Checked = false;
            rb_op3.Checked = false;
            rb_op4.Checked = false;

            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();

            i = Convert.ToInt32(ViewState["i"]) + 1;
            SqlDataAdapter da = new SqlDataAdapter("SELECT QID,QUESTION,OP1,OP2,OP3,OP4 FROM CONDUCTEXAM", con);
            da.Fill(ds, "CONDUCTEXAM");
            ViewState["i"] = (int)ViewState["i"] + 1;
            if (ds != null && (int)ViewState["i"] < ds.Tables[0].Rows.Count)
            {
                lb_qno.Text = ds.Tables[0].Rows[i]["QID"].ToString();
                lb_ques.Text = ds.Tables[0].Rows[i]["QUESTION"].ToString();
                rb_op1.Text = ds.Tables[0].Rows[i]["OP1"].ToString();
                rb_op2.Text = ds.Tables[0].Rows[i]["OP2"].ToString();
                rb_op3.Text = ds.Tables[0].Rows[i]["OP3"].ToString();
                rb_op4.Text = ds.Tables[0].Rows[i]["OP4"].ToString();
            }
            else
            {
                Response.Redirect("StudentTestResults.aspx");

            }
            con.Close();
        }
    }
}