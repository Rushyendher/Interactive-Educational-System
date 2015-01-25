using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AmazonHackathon
{
    public partial class FHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Slider();
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Slider();
        }

        private void Slider()
        {
            Random rand = new Random();
            int i = rand.Next(1, 4);
            Image1.ImageUrl = "~/SliderImages/" + i.ToString() + ".jpg";
        }
    }
}