--Write a SQL query to display only the details of employees who either earn the highest salary
--or the lowest salary in each department from the employee table.



select x.* from employee e join (
select *,
min(salary) over (partition by dept_name) as a,
max(salary) over (partition by dept_name) as b
from employee) x
on x.emp_ID = e.emp_ID
and (x.a=e.salary or x.b = e.salary)
order by dept_name,salary

