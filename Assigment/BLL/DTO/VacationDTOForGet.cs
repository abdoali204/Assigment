using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assigment.BLL.DTO
{
    public class VacationDTOForGet
    {

        public int Id { get; set; }
        public System.DateTime SubmissionDate { get; set; }
        public string EmployeeName { get; set; }
        public string Title { get; set; }
        public System.DateTime VacationDateFrom { get; set; }
        public System.DateTime VacationDateTo { get; set; }
        public System.DateTime Returing { get; set; }
        public double TotalNumberOfDaysRequested { get; set; }
        public string Notes { get; set; }
        public string DepartmentName { get; set; }

    }
}