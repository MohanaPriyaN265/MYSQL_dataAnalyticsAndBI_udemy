use employees;
select * from salaries
order by salary desc;
select count(salary)
from salaries;
select count(distinct from_date)
from salaries;
select count(distinct dept_no)
from dept_emp;
select sum(salary)
from salaries;
select sum(salary)
from salaries
where from_date > '1997-01-01';
select max(salary)
from salaries;
select min(salary)
from salaries;
select max(emp_no)
from employees;
select min(emp_no)
from employees;
select round(avg(salary),2)
from salaries
where from_date > '1997-01-01';
-- ifnull
SELECT 
    *
FROM
    departments_dup;
alter table departments_dup
change column dept_name dept_name varchar(255) null;
insert into departments_dup(dept_no) values ('d010'),('d011');
select 
	dept_no,
	ifnull(dept_name,'dpt name not provided') as dept_name
from
	departments_dup;
-- coalesce
alter table employees.departments_dup
add column dept_manager varchar(255) null after dept_name;
commit;
select 
	dept_no,
    dept_name,
	coalesce(dept_manager,dept_name,'n/a') as dept_manager
from
	departments_dup;
select 
	dept_no,
    dept_name,
	coalesce('department manager name') as fake_col
from
	departments_dup;
select 
	dept_no,
    dept_name,
	coalesce(dept_no,dept_name) as dept_info
from 
	departments_dup
order by dept_no desc;
select 
	ifnull(dept_no,'n/a'),
    ifnull(dept_name,'dept name not provided'),
	coalesce(dept_no,dept_name) as dept_info
from 
	departments_dup
order by dept_no desc;





