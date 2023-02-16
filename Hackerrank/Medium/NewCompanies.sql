SELECT company_code, 
    (select founder from company as C1 where C1.company_code = E1.company_code) as founder,
    count(distinct(E1.lead_manager_code)),
    count(distinct(E1.senior_manager_code)),
    count(distinct(E1.manager_code)),
    count(distinct(E1.Employee_code))
from employee as E1
group by company_code, founder;


select c.company_code, 
    c.founder, 
    count(distinct e.lead_manager_code), 
    count(distinct e.senior_manager_code), 
    count(distinct e.manager_code), 
    count(distinct e.employee_code)
from company c
    inner join employee as e on e.company_code = c.company_code
group by c.company_code,c.founder
order by c.company_code;

