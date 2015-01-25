using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.IO;
using Facebook;

namespace AmazonHackathon
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

      
        protected void btn_create_user_Click(object sender, ImageClickEventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            try
            {
                SqlCommand cmnd = new SqlCommand("INSERT_REG", con);
                cmnd.CommandType = CommandType.StoredProcedure;
                cmnd.Parameters.AddWithValue("@USERID", txt_uid.Text);
                cmnd.Parameters.AddWithValue("@PWD", txt_pwd.Text);
                cmnd.Parameters.AddWithValue("@EMAIL", txt_email.Text);
                cmnd.Parameters.AddWithValue("@CATEGORY", ddl_category.SelectedItem.Text);
                con.Open();
                int result = cmnd.ExecuteNonQuery();
                if(result >= 1)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lb_err.Visible = true;
                    lb_err.Text = "Registration failed";
                    lb_err.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch(Exception ex)
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