//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Assigment.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Vacation
    {
        public int Id { get; set; }
        public System.DateTime SubmissionDate { get; set; }
        public string EmployeeName { get; set; }
        public string Title { get; set; }
        public System.DateTime VacationDateFrom { get; set; }
        public System.DateTime VacationDateTo { get; set; }
        public string Notes { get; set; }
        public int DepartmentId { get; set; }
        public System.DateTime Returning { get; set; }
        public int TotalNumberOfDaysRequested { get; set; }
    
        public virtual Department Department { get; set; }
    }
}
