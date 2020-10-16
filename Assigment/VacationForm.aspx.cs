using Assigment.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assigment
{
    public partial class VacationForm : System.Web.UI.Page
    {
        Vacation vacation = new Vacation();
        VacationRepository vacationRepo = new VacationRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            CompareEndTodayValidator.ValueToCompare = DateTime.Now.ToShortDateString();

            SubmissionDateTxt.Text= DateTime.Now.ToShortDateString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                    Page.Validate();
                     if(Page.IsValid)
                     {
                         vacation.Notes = Notes.Text;
                         vacation.VacationDateTo = Convert.ToDateTime(DateTo.Text);
                         vacation.VacationDateFrom = Convert.ToDateTime(DateFrom.Text);
                         vacation.DepartmentId = Int32.Parse(Department.SelectedValue);
                         vacation.EmployeeName = EmployeeName.Text;
                         vacation.Title = TitleTxt.Text;
                         vacation.Returning = vacationRepo.CalcReturingDay(vacation.VacationDateTo);


                         vacationRepo.Add(vacation);
                          Response.Write("<script>alert('Vacation has been saved successfuly..');window.location.href= '/Default'   </script>");
                         

            }
        }

        protected void DateTo_SelectionChanged(object sender, EventArgs e)
        {
            if (CompareAfterFromDateValidator.IsValid && DateFrom.Text.Length >6 && CompareEndTodayValidator.IsValid)
            {
                DateTime returningDate = vacationRepo.CalcReturingDay(Convert.ToDateTime(DateTo.Text));
                lblReturning.Text = returningDate.DayOfWeek + "  " + returningDate.ToShortDateString();
                lblTotalDaysNumber.Text = vacationRepo.CalcTotalRequestedDays(Convert.ToDateTime(DateFrom.Text), Convert.ToDateTime(DateTo.Text)).ToString();
            }
        }

        protected void DateFrom_TextChanged(object sender, EventArgs e)
        {
        }
    }
}