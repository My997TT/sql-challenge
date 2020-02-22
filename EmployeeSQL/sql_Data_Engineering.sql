-- Create 6 tables with primary keys and related foreign keys per ERD diagram
CREATE TABLE employees (
    emp_no int   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    gender VARCHAR(2)   NOT NULL,
    hire_date date   NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

CREATE TABLE titles (
    emp_no int   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);


CREATE TABLE departments (
    dept_no VARCHAR(30)   NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dep_emp (
    emp_no int   NOT NULL,
    dept_no VARCHAR(30)   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);


CREATE TABLE dep_manager (
    dept_no VARCHAR(30)   NOT NULL,
    emp_no int   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

ALTER TABLE salaries -- Add FK from employees table to emp_no
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE titles -- Add FK from titles table to emp_no
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE dep_emp -- Add FK from dep_emp table to emp_no
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE dep_emp -- Add FK from dep_emp table to dep_no
ADD FOREIGN KEY (dept_no) REFERENCES departments (dept_no);

ALTER TABLE dep_manager -- Add FK from dep_manager table to emp_no
ADD FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

ALTER TABLE dep_manager-- Add FK from dep_manager table to dept_no
ADD FOREIGN KEY (dept_no) REFERENCES departments (dept_no);

ALTER TABLE departments -- Add FK from departments table to dept_no
ADD FOREIGN KEY (dept_no) REFERENCES dep_emp (dept_no);


select * from employees
select * from salaries
select * from titles
select * from departments
select * from dep_emp
select * from dep_manager

