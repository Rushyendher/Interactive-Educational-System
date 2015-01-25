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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            CheckAuthorization();
        }


        private void CheckAuthorization()
        {

            string app_id = "326520894204867";

            string app_secret = "db19c1855a9efd5442df840a4aeb53e7";

            string scope = "publish_stream,manage_pages";



            if (Request["code"] == null)
            {

                Response.Redirect(string.Format(

                    "https://graph.facebook.com/oauth/authorize?client_id={0}&redirect_uri={1}&scope={2}",

                    app_id, Request.Url.AbsoluteUri, scope));

            }

            else
            {

                Dictionary<string, string> tokens = new Dictionary<string, string>();



                string url = string.Format("https://graph.facebook.com/oauth/access_token?client_id={0}&redirect_uri={1}&scope={2}&code={3}&client_secret={4}",

                    app_id, Request.Url.AbsoluteUri, scope, Request["code"].ToString(), app_secret);



                HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;



                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {

                    StreamReader reader = new StreamReader(response.GetResponseStream());



                    string vals = reader.ReadToEnd();



                    foreach (string token in vals.Split('&'))
                    {

                        tokens.Add(token.Substring(0, token.IndexOf("=")),
                            token.Substring(token.IndexOf("=") + 1, token.Length - token.IndexOf("=") - 1));
                    }
                }
                string access_token = tokens["access_token"];
                var client = new FacebookClient(access_token);
                
                client.Post("/me/feed", new { message = "Login success..." });

            }

        }
        protected void btn_login_submit_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SQLCON"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            try
            {
                SqlCommand cmnd = new SqlCommand("RETRIEVE_INFO", con);
                cmnd.CommandType = CommandType.StoredProcedure;
                cmnd.Parameters.AddWithValue("@USERID", txt_login_uid.Text);
                cmnd.Parameters.AddWithValue("@PWD", txt_login_pwd.Text);
                con.Open();
                Session["name"] = txt_login_uid.Text;
                string name = (string)cmnd.ExecuteScalar();
                SqlDataReader dr = cmnd.ExecuteReader();
                if (dr.Read())
                {
                    if (name == "Faculty")
                    {
                        Response.Redirect("FHome.aspx");
                    }
                    else
                    {
                        Response.Redirect("SHome.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
                lb_error.Visible = true;
                lb_error.Text = "Login failed.";
                lb_error.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                con.Close();
            }
        }
    }
}