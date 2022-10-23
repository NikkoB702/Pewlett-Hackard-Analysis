--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name FROM employees;


--Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date FROM titles;


--Create a new table using the INTO clause.
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY (emp_no);


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;


--retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT (title)
	count,
	title
INTO retiring_titles
FROM unique_titles
GROUP BY (title)
ORDER BY count DESC
;


--write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
SELECT DISTINCT ON (emp_no)
	e.emp_no,
    e.first_name,
    e.last_name,
	e.birth_date,
    de.from_date,
    de.to_date,
	t.title
--INTO retirement_titles
FROM employees as e
INNER JOIN dept_empolyee as de
ON (de.emp_no = e.emp_no)
INNER JOIN titles as t
ON (de.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY (emp_no);
	