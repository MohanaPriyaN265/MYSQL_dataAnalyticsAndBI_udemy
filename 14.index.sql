use employees;
select * 
from employees
where hire_date > '2000-01-01';
create index i_hire_date on employees(hire_date);
drop index i_hire_date on employees;

select *
from employees
where
	first_name = 'Georgi'
    and last_name = 'Facello';
create index i_composite_name on employees(first_name,last_name);

show index from employees from employees;

select * from salaries
where salary > 89000;

create index i_salary_high_low on salaries(salary desc);




