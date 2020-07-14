--create tables
CREATE TABLE departments (dept_no VARCHAR (20),
						 dept_name VARCHAR (50))
						 
CREATE TABLE dept_emp (emp_no INT,
						 dept_no VARCHAR (20))
ALTER TABLE employees ADD PRIMARY KEY (emp_no)
						 
CREATE TABLE dept_manager (dept_no VARCHAR (20),
						   emp_no INT)
						   
CREATE TABLE employees (emp_no INT,
						emp_title_id VARCHAR (20),
						birth_date DATE,
						first_name VARCHAR (30),
						last_name VARCHAR (30),
						sex VARCHAR (10),
						hire_date DATE)
ALTER TABLE employees ADD PRIMARY KEY (emp_no)
						
CREATE TABLE salaries (emp_no INT,
						salary INT)
						   
CREATE TABLE titles (title_id VARCHAR (20),
						title VARCHAR (30))