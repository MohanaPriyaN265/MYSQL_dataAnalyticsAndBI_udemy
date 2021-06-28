--  local variables
use employees;
drop function if exists f_emp_avg_salary;

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

select v_avg_salary;

-- session variables
set @s_var1 = 3;
select @s_var1;

-- global variables

set global max_connections = 1000;
-- dont execute
set @@global.max_connections = 1;






