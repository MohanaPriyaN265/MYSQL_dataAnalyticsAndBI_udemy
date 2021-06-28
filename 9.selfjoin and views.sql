-- self join
 select * from emp_manager;
 select e1.*
 from
	emp_manager e1
		join
	emp_manager e2 on e1.emp_no = e2.manager_no
where
	e2.emp_no in
		(select manager_no
			from emp_manager);
-- views
select * 
from dept_emp;
select 
	emp_no,from_date,to_date,count(emp_no) as num
from
	dept_emp
group by emp_no
having num > 1;
create or replace view v_dept_emp_latest_date as
	select
		emp_no,max(from_date) as from_date,max(to_date) as to_date
	from
		dept_emp
	group by
		emp_no;
select *
from employees.v_dept_emp_latest_date;

create or replace view v_avg_managers_salary as
    select round(avg(salary),2)
	from salaries s
	where s.emp_no in(
		select emp_no 
		from dept_manager);
select * from employees.v_avg_managers_salary;
        
            