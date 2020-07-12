--create tables
CREATE TABLE departments (dept_no VARCHAR (20),
						 dept_name VARCHAR (50))
						 
CREATE TABLE dept_emp (emp_no INT,
						 dept_no VARCHAR (20))
						 
CREATE TABLE dept_manager (dept_no VARCHAR (20),
						   emp_no INT)
						   
CREATE TABLE employees (emp_no INT,
						emp_title_id VARCHAR (20),
						birth_date DATE,
						first_name VARCHAR (30),
						last_name VARCHAR (30),
						sex VARCHAR (10),
						hire_date DATE)
						
CREATE TABLE salaries (emp_no INT,
						salary INT)
						   
CREATE TABLE titles (title_id VARCHAR (20),
						title VARCHAR (30))
						
--1.List the following details of each employee: employee number, last name, first name, sex, and salary.
-- Join employee number with salaries
SELECT employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.sex,
  salaries.salary

FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date >= '1986-01-01' and hire_date <= '1986-12-31'

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no,
  departments.dept_name,
  dept_manager.emp_no,
  employees.last_name,
  employees.first_name

FROM departments
JOIN dept_manager ON
dept_manager.dept_no = departments.dept_no
JOIN employees ON
dept_manager.emp_no = employees.emp_no

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT dept_emp.emp_no,
       employees.last_name,
       employees.first_name,
	   departments.dept_name

FROM dept_emp
JOIN employees ON
employees.emp_no = dept_emp.emp_no
JOIN departments ON
departments.dept_no = dept_emp.dept_no

--5.List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
       employees.last_name,
       employees.first_name,
	   departments.dept_name

FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
       employees.last_name,
       employees.first_name,
	   departments.dept_name

FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name) as employee_count
FROM employees 
GROUP BY last_name
ORDER BY employee_count DESC

--Epilogue
SELECT first_name, last_name 
FROM employees WHERE emp_no = 499942

