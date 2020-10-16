using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assigment.DAL
{
    public class DepartmentRepository
    {
        public List<Department> GetDepartments()
        {
            using ( var context =new VacationEntities())
            {
                return context.Departments.ToList();
            }
        }
    }
}