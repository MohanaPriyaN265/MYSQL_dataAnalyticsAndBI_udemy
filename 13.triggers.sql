use employees;
commit;

#before insert
delimiter $$

create trigger before_salaries_insert
before insert on salaries
for each row
begin
	if new.salary < 0 then
		set new.salary = 0;
	end if;
end $$

delimiter ;

select *
from salaries
where emp_no = '10001';

insert into salaries values ('10001',-92891,'2010-06-22','9999-01-01');

#before update
delimiter $$

create trigger before_salaries_update
before update on salaries
for each row
begin
	if new.salary < 0 then
		set new.salary = old.salary;
	end if;
end $$

delimiter ;

update salaries
set salary = 98765
where emp_no = '10001'
	and from_date = '2010-06-22';

select *
from salaries
where emp_no = '10001'
 and from_date = '2010-06-22';
 
update salaries
set salary = -50000
where emp_no = '10001'
	and from_date = '2010-06-22';
    
-- system built-in functions
select sysdate();
select date_format(sysdate(),'%y-%m-%d') as today;

delimiter $$
create trigger trig_ins_dept_mng
after insert on dept_manager
for each row
begin
	declare v_curr_salary int;
select max(salary)
into v_curr_salary
from
	salaries s
where s.emp_no = new.emp_no;
	if v_curr_salary is not null then
		update salaries
		set 
			to_date = sysdate()
		where
			emp_no = new.emp_no and to_date = new.to_date;
		insert into salaries
			values(new.emp_no,v_curr_salary + 20000,new.from_date,new.to_date);
	end if;    
end $$

delimiter ;

insert into dept_manager values ('111534','d009',date_format(sysdate(),'%y-%m-%d'),'9999-01-01');

select *
from dept_manager
where emp_no = 111534;
select * from salaries
where emp_no = 111534;

rollback;

delimiter $$
create trigger trig_hire_date 
before insert on employees
for each row
begin
	if new.hire_date > date_format(sysdate(),'%y-%m-%d')
		then set new.hire_date = date_format(sysdate(),'%y-%m-%d');
	end if;
end $$
delimiter ;

insert into employees values('999905','1970-01-31','john','johnson','m','2025-01-01');
select * from employees
order by emp_no desc
limit 10;







    





