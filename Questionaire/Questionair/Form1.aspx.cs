using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Questionair
{
    public partial class Form1 : System.Web.UI.Page
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
                        rbGender.SelectedValue = obj.Gender.Value ? "1" : "0";
                        txtAge.Text = obj.Age.Value.ToString();
                        txtWeight.Text = obj.Weight.Value.ToString();
                        txtHeight.Text = obj.Height.Value.ToString();
                        rbStatus.SelectedValue = obj.Status;
                        rbEducation.SelectedValue = obj.Education;
                        rbPosition.SelectedValue = obj.Position;
                        rbIsMedicalExam.SelectedValue = obj.IsMedicalExamination.Value ? "1" : "0";
                    }
                }
                else
                {
                    Response.Redirect(ResolveUrl("Default.aspx"));
                }
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
                    var check = (from c in dbContext.tmp_PartOne
                                 where c.RefID == refID
                                 select c);
                    if (check.Count() == 0)
                    {
                        var obj = new tmp_PartOne();
                        obj.RefID = refID;
                        obj.Gender = rbGender.SelectedValue == "1" ? true : false;
                        obj.Age = int.Parse(txtAge.Text.Trim());
                        obj.Weight = decimal.Parse(txtWeight.Text.Trim());
                        obj.Height = decimal.Parse(txtHeight.Text.Trim());
                        obj.Status = rbStatus.SelectedValue;
                        obj.Education = rbEducation.SelectedValue;
                        obj.Position = rbPosition.SelectedValue;
                        obj.IsMedicalExamination = rbIsMedicalExam.SelectedValue == "1" ? true : false;
                        dbContext.tmp_PartOne.Add(obj);
                        dbContext.SaveChanges();
                        Response.Redirect(ResolveUrl("Form2.aspx?ref=" + obj.RefID));
                    }
                    else
                    {
                        var obj = (from c in dbContext.tmp_PartOne
                                   where c.RefID == refID
                                   select c).First();
                        obj.Gender = rbGender.SelectedValue == "1" ? true : false;
                        obj.Age = int.Parse(txtAge.Text.Trim());
                        obj.Weight = decimal.Parse(txtWeight.Text.Trim());
                        obj.Height = decimal.Parse(txtHeight.Text.Trim());
                        obj.Status = rbStatus.SelectedValue;
                        obj.Education = rbEducation.SelectedValue;
                        obj.Position = rbPosition.SelectedValue;
                        obj.IsMedicalExamination = rbIsMedicalExam.SelectedValue == "1" ? true : false;
                        dbContext.SaveChanges();
                        Response.Redirect(ResolveUrl("Form2.aspx?ref=" + obj.RefID));
                    }
                }
                else
                    return;
            }
        }
    }
}