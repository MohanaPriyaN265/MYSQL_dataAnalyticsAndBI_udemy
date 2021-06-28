use employees;
select * from departments_dup
order by dept_no;
alter table departments_dup
drop column dept_manager;
alter table departments_dup
change column dept_no dept_no char(4) null;
alter table departments_dup
change column dept_name dept_name varchar(40) null;
commit;
insert into departments_dup(dept_name) values('Public Relations');
delete from departments_dup
where dept_no = 'd002';
-- create departments_dup
DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);
INSERT INTO dept_manager_dup
select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES               
	(999904, '2017-01-01'),
    (999905, '2017-01-01'),
    (999906, '2017-01-01'),
	(999907, '2017-01-01');
 DELETE FROM dept_manager_dup
 WHERE
    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)
VALUEs('Public Relations');

DELETE FROM departments_dup
WHERE
    dept_no = 'd002'; 

select * from departments_dup
order by dept_no;
select * from dept_manager_dup
order by emp_no;
-- inner join
select m.dept_no, m.emp_no,d.dept_name
from dept_manager_dup m
inner join
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;
select e.emp_no,e.first_name,e.last_name,dm.dept_no,e.hire_date
from employees e
 join
dept_manager dm on e.emp_no = dm.emp_no
order by e.emp_no;
-- duplicate records handling
insert into dept_manager_dup
values ('110228','d003','1992-03-21','9999-01-01');
insert into departments_dup
values ('d009','customer service');
select *
from 
	dept_manager_dup
order by dept_no asc;
select *
from 
	departments_dup
order by dept_no asc;
select m.dept_no, m.emp_no,d.dept_name
from dept_manager_dup m
inner join
departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;
-- handling duplicate records
-- group by column that differs the most 
select m.dept_no, m.emp_no,d.dept_name
from dept_manager_dup m
join
departments_dup d on m.dept_no = d.dept_no
group by m.emp_no
order by m.dept_no;
-- left join 
delete from dept_manager_dup
where emp_no = '110228';
delete from departments_dup
where dept_no = 'd009';
insert into dept_manager_dup
values ('110228','d003','1992-03-21','9999-01-01');
insert into departments_dup
values ('d009','Customer service');
select m.dept_no, m.emp_no,d.dept_name
from dept_manager_dup m
left join
departments_dup d on m.dept_no = d.dept_no
group by m.emp_no
order by m.dept_no;
select d.dept_no, m.emp_no,d.dept_name
from departments_dup d
left join
dept_manager_dup m on m.dept_no = d.dept_no
-- group by d.emp_no
order by d.dept_no;
select d.dept_no, m.emp_no,d.dept_name
from departments_dup d
left outer join
dept_manager_dup m on m.dept_no = d.dept_no
-- group by d.emp_no
order by d.dept_no;
select e.emp_no,e.first_name,e.last_name,d.dept_no,d.from_date
from employees e
left join
dept_manager d on e.emp_no = d.emp_no 
where e.last_name = 'Markovitch'
order by d.dept_no desc,e.emp_no;
-- right join
-- old join syntax
select 
	m.dept_no,m.emp_no,d.dept_name
from 
	dept_manager_dup m,
    departments_dup d
where
	m.dept_no = d.dept_no
order by
	m.dept_no;
select m.emp_no,e.first_name,e.last_name,m.dept_no,e.hire_date
from
	dept_manager m,
    employees e
where 
	m.emp_no = e.emp_no
order by e.emp_no;
-- using join and where
select 
	e.emp_no,e.first_name,e.last_name,s.salary
from
	employees e
    join
    salaries s on e.emp_no = s.emp_no
where 
	s.salary > 145000
;
-- prevent 1055 error code
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
select 
	e.first_name,e.last_name,e.hire_date,t.title
from 
	employees e
    left join titles t
    on e.emp_no = t.emp_no
where 
	e.first_name = 'Margareta' and
    e.last_name = 'Markovitch'
    ;
-- cross join
-- best practise - mention cross join
select
	dm.*,d.*
from
	dept_manager dm
	cross join
    departments d
order by dm.emp_no,d.dept_no;
select
	dm.*,d.*
from
	dept_manager dm,
    departments d
order by dm.emp_no,d.dept_no;
select
	dm.*,d.*
from
	dept_manager dm
	join
    departments d
order by dm.emp_no,d.dept_no;
select
	dm.*,d.*
from
	dept_manager dm
	join
    departments d
    on dm.dept_no <> d.dept_no
order by dm.emp_no,d.dept_no;
-- more then one join
select
	dm.*,d.*,e.*
from
	dept_manager dm
	cross join
    departments d
    join
    employees e on dm.emp_no = e.emp_no
order by dm.emp_no,d.dept_no;
select dm.*,d.*
from 
	dept_manager dm
    cross join
    departments d 
where d.dept_no = 'd009'
order by d.dept_no,dm.emp_no;
select
	e.emp_no,d.*
from
	employees e
	 cross join
    departments d
where e.emp_no < 10011
order by e.emp_no,d.dept_name;
select
	e.gender,avg(s.salary) as average_salary
from
	employees e
	join
    salaries s on e.emp_no = s.emp_no
group by gender;
select
	e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
from
	employees e
		join
	dept_manager m on e.emp_no = m.emp_no
		join
	departments d on m.dept_no = d.dept_no
;
select
	e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
from
	departments d
		join
	dept_manager m on d.dept_no = m.dept_no
		join
	employees e on m.emp_no = e.emp_no
;
select
	e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
from
	employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager';
select 
	d.dept_name,avg(salary) as average_dept_salary
from 
	departments d
    join
    dept_manager m on d.dept_no = m.dept_no
    join
    salaries s on m.emp_no = s.emp_no
group by dept_name
having  average_dept_salary > 60000
order by average_dept_salary desc
;
select distinct(title) from titles;
select e.gender,count(e.emp_no) as total_count
from
	employees e
    join
    titles t on e.emp_no = t.emp_no
where t.title = 'manager'
group by e.gender
order by total_count;
-- union 
select 
	e.gender,count(dm.emp_no)
from
	employees e
    join
    dept_manager dm on e.emp_no=dm.emp_no
group by gender;
drop table if exists employees_dup;
create table employees_dup (
	emp_id int(11),
    birth_date date,
    first_name varchar(14),
    last_name varchar(16),
    gender enum('m','f'),
    hire_date date
);
alter table employees_dup
change column emp_id emp_no int(11);

insert into employees_dup
select
	e.*
from
	employees e
limit 20;
select * from employees_dup;
insert into employees_dup values
('10001','1953-09-02','georgi','facello','m','1986-06-26');
select 
	e.emp_no,
    e.first_name,
    e.last_name,
    null as dept_no,
    null as from_date
from 
	employees_dup e
where 
	e.emp_no = 10001
union all select
	null as emp_no,
    null as first_name,
    null as last_name,
    m.dept_no,
    m.from_date
from
	dept_manager m;
    -- union
    select 
	e.emp_no,
    e.first_name,
    e.last_name,
    null as dept_no,
    null as from_date
from 
	employees_dup e
where 
	e.emp_no = 10001
union  select
	null as emp_no,
    null as first_name,
    null as last_name,
    m.dept_no,
    m.from_date
from
	dept_manager m;
SELECT
    *
FROM
    (SELECT
        e.emp_no,
        e.first_name,
		e.last_name,
		NULL AS dept_no,
		NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT
        NULL AS emp_no,
		NULL AS first_name,
		NULL AS last_name,
		dm.dept_no,
		dm.from_date
    FROM
        dept_manager dm) as a
ORDER BY -a.emp_no DESC;
    
    


    






    



