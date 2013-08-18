using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Questionair
{
    public partial class QN : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnStandard.Visible = true;

                Guid refID;
                string QueryString = Request.QueryString["ref"];
                if (Guid.TryParse(QueryString, out refID))
                {
                    QuestionairEntities dbContext = new QuestionairEntities();
                    var query = new tmp_Master();
                    query = (from c in dbContext.tmp_Master
                             where c.RefID == refID
                             select c).First();
                    txtNo.Text = query.Number;
                    txtNo0.Text = query.Unit;
                    RadDatePicker1.SelectedDate = query.CreateDate;
                    txtNo.Enabled = false;
                    txtNo0.Enabled = false;
                    RadDatePicker1.Enabled = false;
                    btnStandard.Visible = false;
                }
                else
                {
                    //Response.Redirect(ResolveUrl("Default.aspx"));
                }

            }
        }
        protected void btnStandard_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;
            QuestionairEntities dbContext = new QuestionairEntities();
            var obj = new tmp_Master();
            obj.RefID = Guid.NewGuid();
            obj.Number = txtNo.Text.Trim();
            obj.Unit = txtNo0.Text.Trim();
            obj.CreateDate = RadDatePicker1.SelectedDate.Value;
            dbContext.tmp_Master.Add(obj);

            dbContext.SaveChanges();
            Response.Redirect(ResolveUrl("Form1.aspx?ref=" + obj.RefID));
        }
    }
}