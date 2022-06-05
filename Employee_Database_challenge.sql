--Creating tables for PH-EmployeesDB
--departments table
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

--employees table
CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	genger VARCHAR NOT NULL,
	hire_date DATE NOT NULL, 
	PRIMARY KEY (emp_no)
);

--department managers table 
CREATE TABLE dept_manager (
dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

--salaries table
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

--department employee table 
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no , emp_no)
);

--titles table 
CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

--DELIVERABLE 1: The Number of Retiring Employees by Title
--retirement_titles table 
SELECT e.emp_no, --#1
    e.first_name,
	e.last_name,
    ti.title,  --#2
	ti.from_date,
	ti.to_date
INTO retirement_titles --#3
FROM employees as e 
INNER JOIN titles as ti --#4
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ; --5
-- Check the table
SELECT * FROM retirement_titles


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) --#10
emp_no, --#9
first_name,
last_name,
title
INTO unique_titles --#12
FROM retirement_titles 
WHERE (to_date = '9999-01-01') --#11
ORDER BY emp_no, to_date DESC; --#13
-- Check the table
SELECT * FROM unique_titles

--#17 Retrieve the number of titles from the Unique Titles table.
SELECT COUNT(title)
FROM unique_titles
GROUP BY title; 


--retirement_titles table #18
SELECT COUNT (first_name), title
title
INTO retiring_titles
FROM unique_titles
GROUP BY title --#19
ORDER BY COUNT(first_name) DESC; 
-- Check the table
SELECT * FROM retiring_titles

--DELIVERABLE 2: The Employees Eligible for the Mentorship Program
--mentorship_eligibilty table 
SELECT DISTINCT ON (emp_no) --#4
e. emp_no, --#1
e. first_name,
e. last_name,
e. birth_date,
de. from_date, --#2
de. to_date,
titles.title --#3
INTO mentorship_eligibilty --#5
FROM employees as e
INNER JOIN dept_emp as de --#6
ON e.emp_no = de.emp_no --#7
INNER JOIN titles
ON e.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')--#8
ORDER BY emp_no; --#9
-- Check the table
SELECT * FROM mentorship_eligibilty; 