-- case
select 
	emp_no,
    first_name,
    last_name,
    case
		when gender = 'm' then 'male'
        else 'female'
	end as gender
from employees;
select 
	emp_no,
    first_name,
    last_name,
    case gender
		when 'm' then 'male'
        else 'female'
	end as gender
from employees;

select 
	e.emp_no,
    e.first_name,
    e.last_name,
    case
		when dm.emp_no is not null then 'Manager'
        else 'employee'
	end as is_manager
    from
		employees e
			left join
		dept_manager dm on dm.emp_no = e.emp_no
	where
		e.emp_no > 109990;
        
select
	emp_no,
    first_name,
    last_name,
    if(gender = 'M','Male','Female') as gender
from employees;

select 
	dm.emp_no,
    e.first_name,
    e.last_name,
    max(s.salary)-min(s.salary) as salary_difference,
    case
		when max(s.salary) - min(s.salary) > 30000 then 'Salary was raised by more than $30,000'
        when max(s.salary) - min(s.salary) between 20000 and 30000 then 
									'Salary was raised by more than $20000 but less than $30,000'
		else 'salary was raised by less than $20000'
	end as salary_increase
from 
	dept_manager dm
		join
	employees e on e.emp_no = dm.emp_no
		join
	salaries s on s.emp_no = dm.emp_no
group by s.emp_no;

select 
	e.emp_no,
    e.first_name,
    e.last_name,
	case
		when max(d.to_date) > sysdate() then 'still employed'
        else 'not an emploee anymore'
	end as current_employee
from
	employees e
     join
	dept_manager d on d.emp_no = e.emp_no
group by d.emp_no
limit 100;