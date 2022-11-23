-- Employees_Database_challenge.sql

-- RETIRMENT TITLES QUERY
-- may contain duplicate names if they have held multiple titles
SELECT e.emp_no, e.first_name, e.last_name, t.title, 
    t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT COUNT(first_name) FROM retirement_titles;
-- 133776 entries

-- UNIQUE TITLES QUERY
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title,
ei.gender,
ei.salary,
rt.to_date,
de.dept_no,
d.dept_name,
round(abs(current_date - rt.from_date)/365.25,2) as employment_interval
INTO unique_titles
FROM retirement_titles as rt
    Left JOIN dept_emp AS de
    ON (rt.emp_no = de.emp_no)
    left JOIN emp_info as ei
    ON (rt.emp_no = ei.emp_no)
    left JOIN departments AS d
    ON (de.dept_no = d.dept_no)
    WHERE rt.to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

drop table unique_titles;

select * from unique_titles
WHERE unique_titles.dept_name is not null
ORDER BY emp_no ASC;


SELECT COUNT(first_name) FROM unique_titles;
-- 72485 entries

-- RETIRING TITLES QUERY
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT SUM(count) FROM retiring_titles;
-- 72458 entries, matches unique_titles count

--MENTORSHIP ELIGIBILITY QUERY
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name,
    e.birth_date, de.from_date, de.to_date, de.dept_no, ti.title, d.dept_name
INTO mentorship_eligibility
FROM employees AS e
    LEFT JOIN dept_emp AS de
    ON (e.emp_no = de.emp_no)
    LEFT JOIN titles AS ti
    ON (e.emp_no = ti.emp_no)
    LEFT JOIN departments AS d
    ON (de.dept_no = d.dept_no)
WHERE de.to_date = '9999-01-01'
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

DROP TABLE mentorship_eligibility;

SELECT COUNT(first_name) FROM mentorship_eligibility;
-- 1549 entries

ALTER TABLE mentorship_eligibility
ADD COLUMN employment_interval int;

UPDATE mentorship_eligibility
SET employment_interval = round(abs(current_date - from_date)/365.25,2);

SELECT * FROM retirement_titles;
SELECT * FROM unique_titles;
SELECT * FROM retiring_titles;
SELECT * FROM mentorship_eligibility;