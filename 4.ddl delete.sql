select *
from employees
where emp_no = 999903;
select *
from titles
where emp_no = 999903;
commit;
delete from employees
where emp_no = 999903;
rollback;
-- without where condition
select * from departments_dup
order by dept_no; 
delete from departments_dup;
rollback;
select * from departments;
commit;
delete from departments
where dept_no = 'd001' 
