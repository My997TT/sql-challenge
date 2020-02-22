

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.


select Employees.emp_no, 
	Employees.last_name, 
	Employees.first_name, 
	Employees.gender, 
	Salaries.salary
	
from Employees

inner join Salaries on Employees.emp_no = Salaries.emp_no;

--2. List employees who were hired in 1986.

SELECT emp_no,last_name, first_name, gender, hire_date
FROM Employees
where hire_date between '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.

select 
departments.dept_no,
departments.dept_name,
dep_manager.emp_no,
Employees.last_name, 
Employees.first_name, 
dep_manager.from_date,
dep_manager.to_date
from dep_manager
join departments on dep_manager.dept_no=departments.dept_no
join employees on dep_manager.emp_no=Employees.emp_no;


--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.
create view emp_deptname as

select 
Employees.emp_no,
Employees.last_name, 
Employees.first_name, 
departments.dept_name
from Employees
join dep_emp on Employees.emp_no=dep_emp.emp_no
join departments on dep_emp.dept_no=departments.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name
from employees
where first_name='Hercules' and last_name like 'B%';


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select * from emp_deptname
where dept_name='Marketing'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp_no,last_name,first_name,dept_name
from emp_deptname
where dept_name='Sales' or dept_name='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*) as cnt_Lname
from employees
group by last_name
order by cnt_Lname desc;

