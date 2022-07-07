-- Employees_Database_challenge.sql

-- RETIRMENT TITLES QUERY
SELECT e.emp_no, e.first_name, e.last_name, t.title, 
    t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- UNIQUE TITLES QUERY
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

-- RETIRING TITLES QUERY
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--MENTORSHIP ELIGIBILITY QUERY
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name,
    e.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibility
FROM employees AS e
    INNER JOIN dept_emp AS de
    ON (e.emp_no = de.emp_no)
    INNER JOIN titles AS ti
    ON (e.emp_no = ti.emp_no)
WHERE de.to_date = '9999-01-01'
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;
