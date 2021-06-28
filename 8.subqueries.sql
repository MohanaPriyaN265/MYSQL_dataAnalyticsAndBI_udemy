select *
from dept_manager;
-- using in subquery
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
select *
from dept_manager dm
where
	dm.emp_no in ( select e.emp_no
				   from employees e
                   where e.hire_date between '1990-01-01' and '1995-01-01'
				);
-- using exist in sub query
select 
	e.first_name,e.last_name
from
	employees e
where 
	exists( select *
			from
				dept_manager dm
			where
				dm.emp_no = e.emp_no)
order by emp_no;	
select *
from employees e
where 
	exists( select *
			from titles t
            where 
				t.emp_no=e.emp_no
                and t.title = 'Assistant Engineer'
			)
order by emp_no;
select emp_no
from dept_manager
where emp_no = 110022;
insert into dept_manager values(110022,'d003','1987-05-01','1999-01-01');
insert into dept_manager values(110039,'d004','1987-05-01','1999-01-01');
insert into dept_emp values(110022,'d003','1987-05-01','1999-01-01');
insert into dept_emp values(110039,'d004','1987-05-01','1999-01-01');
insert into employees values(110020,'1963-06-21','raja','minakawa','m','1984-04-12');
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A
union
select B.*
from
(select 
	e.emp_no as employee_ID,
    min(de.dept_no) as department_code,
    (select
		emp_no
        from
        dept_manager
        where 
		emp_no = 110039) as manager_ID
from
	employees e
    join
	dept_emp de on e.emp_no = de.emp_no
where
	e.emp_no > 10020
group by e.emp_no
order by e.emp_no
limit 20) as B;
drop table if exists emp_manager;
create table emp_manager
(
	emp_no int(11) not null,
    dept_no char(4) not null,
    manager_no int(11) not null
);
-- -------
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A
union
select B.*
from
(select 
	e.emp_no as employee_ID,
    min(de.dept_no) as department_code,
    (select
		emp_no
        from
        dept_manager
        where 
		emp_no = 110039) as manager_ID
from
	employees e
    join
	dept_emp de on e.emp_no = de.emp_no
where
	e.emp_no > 10020
group by e.emp_no
order by e.emp_no
limit 20) as B
union 
select C.*
from(
select 
	e.emp_no as employee_ID,
    min(de.dept_no) as department_code,
    (select
		emp_no
        from
        dept_manager
        where 
		emp_no = 110039) as manager_ID
from
	employees e
    join
	dept_emp de on e.emp_no = de.emp_no
where
	e.emp_no = 110022
group by e.emp_no
order by e.emp_no) as C
union
select D.*
from(
	select 
		e.emp_no as employee_ID,
		min(de.dept_no) as department_code,
		(	select
			emp_no
			from
			dept_manager
			where 
			emp_no = 110020) as manager_ID
	from
		employees e
		join
		dept_emp de on e.emp_no = de.emp_no
	where
		e.emp_no = 110039
group by e.emp_no
order by e.emp_no) as D
;
-- ---
INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    
    select * from emp_manager;
    --
    select * from employees
    where emp_no in (110020,110039);
	--
    SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110020) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no;


 


