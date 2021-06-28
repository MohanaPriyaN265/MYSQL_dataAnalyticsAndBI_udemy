use employees;
select * from employees
where emp_no = 999901;
Update employees
set
	first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'f'
where 
	emp_no = 999901;
-- using rollback and commit    
select *
from departments_dup
order by dept_no;

commit;

update departments_dup
set 
	dept_no = 'd011',
    dept_name = 'Quality Control';
rollback;

select * from departments
order by dept_no;
commit;

update departments
set
 dept_name = 'Data Analysis'
where 
	dept_no = 'd010';
commit;
    
	
