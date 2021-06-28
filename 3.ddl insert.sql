use employees;
insert into employees 
(
 emp_no,
 birth_date,
 first_name,
 last_name,
 gender,
 hire_date
)
values
(
	999902,
    '1973-03-26',
    'Patricia',
    'Lawrence',
    'f',
    '2005-01-01'
);
insert into employees 
values
(
	999904,
    '1977-01-01',
    'Johnathan',
    'Abby',
    'f',
    '1999-01-01'
);
select * from employees
order by emp_no desc;
select * from dept_emp
order by emp_no desc
limit 10;
insert into titles 
(
	emp_no,
    title,
    from_date
)
values(
	999904,
    'Senior Engineer',
    '1977-01-01'
);
insert into dept_emp
values
(
	999904,
    'd005',
    '1977-01-01',
    '9999-01-01'
);

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);
INSERT INTO departments_dup
(
	dept_no,
    dept_name
)
SELECT *
FROM departments;

select * from departments_dup;

insert into departments values ('d010','Business Analysis'); 

 