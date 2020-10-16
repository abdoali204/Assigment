using Assigment.BLL.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assigment.DAL
{
    public class VacationRepository
    {
        public VacationDTOForGet GetVacation(int id) 
        {
            
            var vacationDTO = new VacationDTOForGet();
            if (id == 0)
                return null;
            using (var context =new VacationEntities())
            {
                var vacation = context.Vacations.SingleOrDefault(v => v.Id == id);
                vacationDTO = Mapping(vacation);
            }
            return vacationDTO;
        }
        public List<Vacation> GetVacations()
        {
            using(var context = new VacationEntities())
            {
                return context.Vacations.ToList();
            }
        }
        public void Add(Vacation vacation)
        {
            vacation.SubmissionDate = DateTime.Now;
            vacation.Returning = CalcReturingDay(vacation.VacationDateTo);
            vacation.TotalNumberOfDaysRequested = (Int32)CalcTotalRequestedDays(vacation.VacationDateFrom, vacation.VacationDateTo);
            using(var context = new VacationEntities())
            {
                context.Vacations.Add(vacation);
                context.SaveChanges();
            }
            
        }
        private VacationDTOForGet Mapping(Vacation v)
        {
            var vacationDTO = new VacationDTOForGet();
            vacationDTO.DepartmentName = v.Department.Name;
            vacationDTO.EmployeeName = v.EmployeeName;
            vacationDTO.Id = v.Id;
            vacationDTO.Notes = v.Notes;
            vacationDTO.SubmissionDate = v.SubmissionDate;
            vacationDTO.Title = v.Title;
            vacationDTO.Returing = CalcReturingDay(v.VacationDateTo);
            vacationDTO.TotalNumberOfDaysRequested = CalcTotalRequestedDays(v.VacationDateFrom, v.VacationDateTo);
            return vacationDTO;

        }
        public DateTime CalcReturingDay(DateTime DateTo)
        {
            if(DateTo.DayOfWeek == DayOfWeek.Thursday || DateTo.DayOfWeek == DayOfWeek.Friday || DateTo.DayOfWeek == DayOfWeek.Saturday)
            {
                int start = (int)DateTo.DayOfWeek;
                int target = (int)DayOfWeek.Sunday;
                if (target <= start)
                    target += 7;
                DateTo.AddDays((target - start)-1);
            }
            return DateTo.AddDays(1);
        }
        public double CalcTotalRequestedDays(DateTime from ,DateTime to)
        {
            return (to - from).TotalDays;
        }
        public DateTime GetCurrentDate()
        {
            return DateTime.Now;
        }

    }
}