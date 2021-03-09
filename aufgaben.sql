# Aufgabe 1

# mysqldump -u root employees > emp.sql
# mysql -u root; 'create database if not exists employee;'
# mysql -u root employee < emp.sql

use employee;
# Aufgabe 2
RENAME TABLE departments to department;
RENAME table employees to employee;
RENAME table salaries to salary;
RENAME table titles to title;

# Aufgabe 3

create or replace view cursal
	as 
    select * from salary
    where 
		from_date <= current_date() 
    AND 
		to_date >= current_date()
;

# Aufgabe 4

# a)
create or replace view cur_emp_salary
	as
		select emp.emp_no, sal.salary from employee emp
        left join cursal sal on emp.emp_no = sal.emp_no
        where
			from_date <= current_date()
        and
			to_date >= current_date()
;

# b)
create or replace view cur_dept_emp
	as
		select emp.emp_no, emp.first_name, emp.last_name, dep.dept_name, dep.dept_no from employee emp
        inner join dept_emp depemp on emp.emp_no = depemp.emp_no
        inner join department dep on dep.dept_no = depemp.dept_no
        where
			from_date <= current_date()
        and
			to_date >= current_date()
;

# c)
create or replace view cur_title
	as
		select emp.emp_no, emp.first_name, emp.last_name, et.title from employee emp
        left join title et on et.emp_no = emp.emp_no
;

# d)
create or replace view cur_dept_manager 
	as
		select employee.emp_no, first_name, last_name, gender, birth_date, hire_date, department.dept_no, dept_name
		from dept_manager
		inner join employee on dept_manager.emp_no = employee.emp_no
		inner join department on dept_manager.dept_no = department.dept_no
		where 
			from_date <= now() 
		and
			to_date >= now()
;

# Aufgabe 5

create or replace view cur_emp_details_and_salary
	as
		select emp.*, sal.salary from employee emp
        left join salary sal on emp.emp_no = sal.emp_no
        where
			from_date <= current_date()
        and
			to_date >= current_date()
;

# Aufgabe 6

create or replace view past_emp
	as
		select emp.emp_no from employee emp
        left join cursal sal on emp.emp_no = sal.emp_no
        where salary IS NULL
;

# Aufgabe 7

create or replace view emp_salary_more_than_boss
	as
		select emp.emp_no, CONCAT(cde.first_name, ' ', cde.last_name) as 'mitarbeiter', CONCAT(cdm.first_name, ' ', cdm.last_name) as 'manager' from employee emp
        join cur_dept_emp cde on cde.emp_no = emp.emp_no
        join cur_dept_manager cdm on cdm.dept_no = cde.dept_no
        join cursal cs on cde.emp_no = cs.emp_no
        join cursal cs2 on cdm.emp_no = cs2.emp_no
        where cs.salary > cs2.salary
;

