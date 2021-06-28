use employees;

-- stored procedure
drop procedure if exists select_employees;

delimiter $$
create procedure select_employees()
begin
	select * from employees
    limit 1000;
end $$
delimiter ;

call employees.select_employees();
call select_employees();

delimiter $$
create procedure avg_salary_employees()
begin
	select avg(salary)
    from salaries;
end $$

call avg_salary_employees();
drop procedure select_employees;

-- parametric procedures
use employees;
drop procedure if exists emp_salary;

delimiter $$
use employees $$
create procedure emp_salary(in p_emp_no integer)
begin
select 
	e.first_name,e.last_name,s.salary,s.from_date,s.to_date
from 
	employees e
    join
    salaries s on e.emp_no = s.emp_no
where
	e.emp_no = p_emp_no;
end $$
delimiter ;

select *from employees
limit 10 ;

-- variables






