using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Questionair
{
    public partial class Form2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(Request.QueryString["ref"]))
            {
                Response.Redirect(ResolveUrl("Default.aspx"));
            }
            else
            {
                Guid refID;
                string QueryString = Request.QueryString["ref"];
                if (Guid.TryParse(QueryString, out refID))
                {
                    QuestionairEntities dbContext = new QuestionairEntities();
                    var query = (from c in dbContext.tmp_PartOne
                                 where c.RefID == refID
                                 select c);

                    if (query.Count() > 0)
                    {
                        var obj = query.First();

                        if (!String.IsNullOrWhiteSpace(obj.BloodTest))
                        {
                            string[] bt = obj.BloodTest.Split(':');
                            BloodTest.SelectedValue = bt[0];
                            BloodTestAns.SelectedValue = bt[1];
                            BloodTestReason.Text = bt[2];
                        }
                        if (!String.IsNullOrWhiteSpace(obj.BloodPressure))
                        {
                            string[] bt = obj.BloodPressure.Split(':');
                            BloodPressure.SelectedValue = bt[0];
                            BloodPressureAns.SelectedValue = bt[1];
                            BloodPressureReason.Text = bt[2];
                        }
                        if (!String.IsNullOrWhiteSpace(obj.OtherExam))
                        {
                            string[] bt = obj.OtherExam.Split(':');
                            OtherExam.Text = bt[0];
                            OtherExamAns.SelectedValue = bt[1];
                            OtherExamReason.Text = bt[2];
                        }
                        if (obj.IsCongenitalDisease.HasValue)
                            rbIsCongenitalDisease.SelectedValue = obj.IsCongenitalDisease.Value ? "1" : "0";
                        rbHealth.SelectedValue = obj.Health;
                    }
                }
                else
                {
                    Response.Redirect(ResolveUrl("Default.aspx"));
                }
            }
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            Guid refID;
            string QueryString = Request.QueryString["ref"];
            if (!Guid.TryParse(QueryString, out refID))
            {
                return;
            }
            else
            {
                Response.Redirect(ResolveUrl("Form1.aspx?ref=" + refID));
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;
            Guid refID;
            string QueryString = Request.QueryString["ref"];
            if (!Guid.TryParse(QueryString, out refID))
            {
                return;
            }
            else
            {
                QuestionairEntities dbContext = new QuestionairEntities();
                var data = (from c in dbContext.tmp_Master
                            where c.RefID == refID
                            select c).Count();

                if (data > 0)
                {
                    var obj = (from c in dbContext.tmp_PartOne
                               where c.RefID == refID
                               select c).First();
                    if (BloodTest.SelectedValue == "1")
                    {
                        obj.BloodTest = BloodTest.SelectedValue + ":" + BloodTestAns.SelectedValue + ":" + BloodTestReason.Text;
                    }
                    if (BloodPressure.SelectedValue == "1")
                    {
                        obj.BloodPressure = BloodPressure.SelectedValue + ":" + BloodPressureAns.SelectedValue + ":" + BloodPressureReason.Text;
                    }
                    if (!string.IsNullOrEmpty(OtherExam.Text))
                    {
                        obj.OtherExam = OtherExam.Text + ":" + OtherExamAns.SelectedValue + ":" + OtherExamReason.Text;
                    }
                    obj.IsCongenitalDisease = rbIsCongenitalDisease.SelectedValue == "1" ? true : false;
                    obj.Health = rbHealth.SelectedValue;
                    dbContext.SaveChanges();
                    Response.Redirect(ResolveUrl("Form2.aspx?ref=" + obj.RefID));
                }
                else
                    return;
            }
        }
    }
}