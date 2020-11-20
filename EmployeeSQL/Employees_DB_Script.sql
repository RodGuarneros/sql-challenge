--let's start with every table with primary keys

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	birth_date DATE NOT NULL DEFAULT CURRENT_DATE, 
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(35) NOT NULL, 
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL DEFAULT CURRENT_DATE 
);
SELECT * FROM employees;
SELECT COUNT(*)FROM employees; --300,024 rows

--Table "departments"			
CREATE TABLE departments(
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);
SELECT * FROM departments;
SELECT COUNT(*)FROM departments; -- 9

--Table "dept_emp"
--creating table, and knowing a little bit the table
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(10) NOT NULL,
	from_date DATE NOT NULL DEFAULT CURRENT_DATE,
	to_date DATE NOT NULL DEFAULT CURRENT_DATE,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)	
);
SELECT * FROM dept_emp;
SELECT COUNT(*)FROM dept_emp; --331,603 rows

--Table "dept_manager"
CREATE TABLE dept_manager(
	dept_no VARCHAR(20) NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date DATE NOT NULL DEFAULT CURRENT_DATE,
	to_date DATE NOT NULL DEFAULT CURRENT_DATE,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)	
);
SELECT * FROM dept_manager;
SELECT COUNT(*)FROM dept_manager; --24 rows


--Table "salaries"
CREATE TABLE salaries(
	emp_no INT,
	salary NUMERIC  NOT NULL,
	from_date DATE NOT NULL DEFAULT CURRENT_DATE,
	to_date DATE NOT NULL DEFAULT CURRENT_DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
SELECT * FROM salaries;
SELECT COUNT(*)FROM salaries; --300024 rows

--Table "titles"			
CREATE TABLE titles(
	emp_no INT,
	title VARCHAR(30) NOT NULL,
	from_date DATE NOT NULL DEFAULT CURRENT_DATE,
	to_date DATE NOT NULL DEFAULT CURRENT_DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
SELECT * FROM titles;
SELECT COUNT(*)FROM titles; -- 443308 rows

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
CREATE TABLE list1 (
	emp_no INT,
	last_name VARCHAR(35) NOT NULL, 
	first_name VARCHAR(20) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	salary NUMERIC NOT NULL 
);

SELECT a.emp_no, a.last_name, a.first_name, a.first_name, a.gender, b.salary 
FROM employees AS a 
LEFT JOIN salaries As b 
ON a.emp_no=b.emp_no;

-- 2.List employees who were hired in 1986.
SELECT*FROM employees 
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01'; 

-- 3.List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
SELECT a.dept_no, b.dept_name, a.emp_no, c.last_name, c.first_name, a.from_date, a.to_date 
FROM dept_manager AS a 
INNER JOIN departments As b 
ON a.dept_no=b.dept_no
INNER JOIN employees AS c
ON a.emp_no=c.emp_no;

-- 4.List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees As a
LEFT JOIN dept_emp As b
ON a.emp_no=b.emp_no
LEFT JOIN departments As c
ON b.dept_no=c.dept_no;

-- 5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT*FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE '%B%';

-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees As a
LEFT JOIN dept_emp As b
ON a.emp_no=b.emp_no
LEFT JOIN departments As c
ON b.dept_no=c.dept_no
WHERE dept_name='Sales';

-- 7.List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees As a
LEFT JOIN dept_emp As b
ON a.emp_no=b.emp_no
LEFT JOIN departments As c
ON b.dept_no=c.dept_no
WHERE dept_name in ('Sales','Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY count(last_name) desc;

