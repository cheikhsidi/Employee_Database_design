-- Creating the Department Table
create table departments (
	dept_no	varchar primary key not null,
	dept_name varchar
	);

-- Creating employees table
create table employees (
	emp_no	int PRIMARY key not null,
	birth_date	date,
	first_name	varchar,
	last_name	varchar,
	gender	varchar,
	hire_date date,
	foreign key (emp_no) REFERENCES employees(emp_no)
	);
drop table dept_emp;

-- Creating Dept_emp table
create table dept_emp (
	emp_no	int not null,
	dept_no	varchar not null,
	from_date date,
	to_date date,
	foreign key (dept_no) REFERENCES departments (dept_no),
	foreign key (emp_no) REFERENCES employees (emp_no)
	);

-- Creating Dept_manager table
create table dept_managers (
	dept_no	varchar,
	emp_no	int,
	from_date	date,
	to_date date,
	foreign key(dept_no) REFERENCES departments(dept_no),
	foreign key (emp_no) REFERENCES employees(emp_no)
	);

-- Creating salaies table
create table salaries (
	emp_no	int,
	salary	int,
	from_date date,
	to_date date,
	foreign key (emp_no) REFERENCES employees(emp_no)
	);
	
-- Creating titles table
create table titles (
	emp_no	int,
	title	varchar,
	from_date date,
	to_date date,
	foreign key (emp_no) REFERENCES employees(emp_no)
	);
	
--1- listing the employees number, last name, first name, gender and salaries
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees
inner join salaries on employees.emp_no = salaries.emp_no;

--2- List employees who were hired in 1986
select * from employees
where (	SELECT EXTRACT(YEAR FROM employees.hire_date))  < 1986;

--3- listing the names of manager of each department and hiring date, from date, last date 
select departments.dept_no, departments.dept_name, dept_managers.emp_no, employees.last_name, employees.first_name,
	   dept_managers.from_date, dept_managers.to_date, employees.hire_date
from employees
inner join dept_managers on dept_managers.emp_no = employees.emp_no
inner join departments on departments.dept_no = dept_managers.dept_no;

--4- listing employees departments
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no;

-- 5-List all employees whose first name is "Hercules" and last names begin with "B."
select last_name, first_name
from employees
where (first_name = 'Hercules' and last_name like 'B%');

-- 6- List all employees in the Sales department
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

-- 7- List all employees in the Sales and Development departments
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp on dept_emp.emp_no = employees.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where (departments.dept_name = 'Sales' or departments.dept_name = 'Development');

-- 8- list the frequency count of employee last names, In descending order
select last_name, count(last_name) as frequency
from employees
group by last_name
ORDER BY frequency DESC;

