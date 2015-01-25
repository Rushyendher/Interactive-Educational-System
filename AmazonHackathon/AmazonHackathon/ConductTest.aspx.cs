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
    public partial class ConductTest : System.Web.UI.Page
    {
        void Reset()
        {
            txt_conductexam_ques.Text = "";
            txt_cexam_q1.Text = "";
            txt_cexam_q2.Text = "";
            txt_cexam_q3.Text = "";
            txt_cexam_q4.Text = "";
            txt_test_ans.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_questions_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            try
            {
                string query = "INSERT INTO CONDUCTEXAM VALUES (@TESTNAME,@QUESTION,@OP1,@OP2,@OP3,@OP4,@RESULT)";
                SqlCommand cmnd = new SqlCommand(query,con);
                cmnd.Parameters.AddWithValue("@TESTNAME", txt_examname.Text);
                cmnd.Parameters.AddWithValue("@QUESTION", txt_conductexam_ques.Text);
                cmnd.Parameters.AddWithValue("@OP1", txt_cexam_q1.Text);
                cmnd.Parameters.AddWithValue("@OP2", txt_cexam_q2.Text);
                cmnd.Parameters.AddWithValue("@OP3", txt_cexam_q3.Text);
                cmnd.Parameters.AddWithValue("@OP4", txt_cexam_q4.Text);
                cmnd.Parameters.AddWithValue("@RESULT", txt_test_ans.Text);
                con.Open();
                int result = cmnd.ExecuteNonQuery();
                if (result >= 1)
                {
                    lb_err.Visible = true;
                    lb_err.Text = "Question submited";
                    lb_err.ForeColor = System.Drawing.Color.Green;
                    Reset();
                }
                else
                {
                    lb_err.Visible = true;
                    lb_err.Text = "Question submission failed";
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
    }
}