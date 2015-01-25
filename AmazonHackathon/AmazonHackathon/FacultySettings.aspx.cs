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
    public partial class FacultySettings : System.Web.UI.Page
    {
        void Reset()
        {
            txt_changepwd_cnfpwd.Text = "";
            txt_changepwd_pwd.Text = "";
        }

        void Reset2()
        {
            txt_settings_email.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_settings_update_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            try
            {
                string query = "UPDATE REGISTRATION SET EMAIL = @EMAIL WHERE  USERID = @USERID";
                SqlCommand cmnd = new SqlCommand(query, con);
                cmnd.Parameters.AddWithValue("@EMAIL", txt_settings_email.Text);
                cmnd.Parameters.AddWithValue("@USERID", Session["name"]);

                con.Open();
                int result = cmnd.ExecuteNonQuery();
                if (result >= 1)
                {
                    lb_updated.Visible = true;
                    lb_updated.Text = "Successfully changed";
                    lb_updated.ForeColor = System.Drawing.Color.Green;
                    Reset2();

                }
                else
                {
                    lb_updated.Visible = true;
                    lb_updated.Text = "Didnot update";
                    lb_updated.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lb_updated.Visible = true;
                lb_updated.Text = ex.Message;
                lb_updated.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btn_changepwd_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            try
            {
                string query = "UPDATE REGISTRATION SET PWD = @PWD WHERE USERID = @USERID";
                SqlCommand cmnd = new SqlCommand(query, con);
                cmnd.Parameters.AddWithValue("@PWD", txt_changepwd_pwd.Text);
                cmnd.Parameters.AddWithValue("@USERID", Session["name"]);
                con.Open();
                int result = cmnd.ExecuteNonQuery();
                if (result >= 1)
                {
                    lb_succespwd.Visible = true;
                    lb_succespwd.Text = "Successfully changed";
                    lb_succespwd.ForeColor = System.Drawing.Color.Green;
                    Reset();

                }
            }
            catch (Exception ex)
            {
                lb_succespwd.Visible = true;
                lb_succespwd.Text = ex.Message;
                lb_succespwd.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();
            }
        }
    }
}