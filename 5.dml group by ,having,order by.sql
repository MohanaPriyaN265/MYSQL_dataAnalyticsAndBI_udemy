USE EMPLOYEES;
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'kellie' AND gender = 'F';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'kellie' or first_name = 'Aruna';

SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'kellie' or first_name = 'Aruna') and gender = 'f';
/*in faster than using or   */
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('kellie' , 'aruna');
    
select * 
from employees
where first_name in ('Denis','Alvis');

select * 
from employees
where first_name  not in ('john','mark','jacob');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE '%jack%';
select *
from employees
where first_name not like '%jack%';
select *
from employees
where hire_date like '%2000%';
select *
from employees
where emp_no like '1000_';

select * from salaries
where emp_no not between 10004 and 10012;

select dept_name from departments
where dept_no is not null;

select * from employees 
where gender = 'f' and hire_date >= '2000-01-01';
select * from salaries
where salary > 150000;
select distinct hire_date
from employees;
select count(distinct salary) from salaries
where salary >= 100000;
select count(*) from dept_manager;
SELECT 
    *
FROM
    employees
ORDER BY hire_date desc;
select first_name from employees
group by first_name;
#same as applying 
select distinct first_name
from employees;
select first_name, count(first_name) as names_count 
from employees
group by first_name
order by first_name;
select salary, count(salary) as emps_with_same_salary
from salaries
where salary>80000
group by salary
order by salary; 
select first_name, count(first_name) as names_count 
from employees
group by first_name
having names_count > 250
order by first_name;
select emp_no,avg(salary) as avg_salary
from salaries
group by emp_no
having  avg_salary > 120000;
select *,avg(salary)
from salaries
where salary > 120000
group by emp_no
order by emp_no;
select emp_no, count(dept_no) as no_of_contracts 
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having no_of_contracts > 1
order by emp_no;
select emp_no, count(dept_no) as no_of_contracts 
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having no_of_contracts > 1
order by emp_no;
select emp_no, count(dept_no) as no_of_contracts 
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having no_of_contracts > 1
order by emp_no;
select emp_no, count(dept_no) as no_of_contracts 
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having no_of_contracts > 1
order by emp_no;
select emp_no
from dept_emp
where from_date > '2000-01-01'
group by emp_no
having count(from_date) > 1
order by emp_no;
SELECT 
    *
FROM
    dept_emp
LIMIT 100;
select * from dept_emp where dept_no = 'd001';


 

