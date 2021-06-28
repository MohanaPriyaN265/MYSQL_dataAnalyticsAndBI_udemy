set @p_avg_salary = 0;
call employees.emp_avg_salary_out(11030, @p_avg_salary);
select @p_avg_salary;

set @v_emp_no = 0;
call employees.emp_info('Aruna','journel',@v_emp_no);
select @v_emp_no;

use employees;
delimiter $$
create function f_emp_avg_salary(p_emp_no integer) returns decimal(10,2)
deterministic
begin
declare v_avg_salary decimal(10,2);
select
	avg(s.salary)
into v_avg_salary from
	employees e
		join
	salaries s on e.emp_no = s.emp_no
where 
	e.emp_no = p.emp_no;
return v_avg_salary;
end $$
delimiter ;

select employees.f_emp_avg_salary(11300);

use employees;

delimiter $$

create function emp_info (p_first_name varchar(16),p_last_name varchar(16)) returns decimal(10,2)
deterministic
begin
declare v_max_from_date date ;
declare v_salary decimal(10,2);
select max(s.from_date)
into v_max_from_date
from
	employees e
    join
    salaries s on e.emp_no = s.emp_no
where
	e.first_name = p_first_name
    and
    e.last_name = p_last_name;
    
select
	s.salary
    into v_salary
from
	employees e
		join
	salaries s on e.emp_no = s.emp_no
where
	e.first_name = p_first_name and
    e.last_name = p_last_name and
    s.from_date = v_max_from_date; 
     
return v_salary;
end $$

delimiter ;

select emp_info('Aruna','journel');
