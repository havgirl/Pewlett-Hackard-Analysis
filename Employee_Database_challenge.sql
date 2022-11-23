--Deliverable 1, Table 1
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t 
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

SELECT * FROM retirement_titles

--Deliverable 1, Table 2
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles

--Deliverable 1, Table 3
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles

--Deliverable 2, Mentorship Eligibility
SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility

--Deliverable 3, Extra Table 1a.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO succession_planning_titles
FROM employees AS e
INNER JOIN titles AS t 
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1955-01-01' AND '1960-12-31')
ORDER BY e.emp_no

--Deliverable 1, Table 1b.
SELECT DISTINCT ON (sp.emp_no) sp.emp_no,
	sp.first_name,
	sp.last_name,
	sp.title
INTO unique_succession_titles
FROM succession_planning_titles as sp
WHERE sp.to_date = '9999-01-01'
ORDER BY sp.emp_no, sp.to_date DESC;

--Deliverable 3, Table 1b.
SELECT COUNT(ust.emp_no), ust.title
INTO succession_titles
FROM unique_succession_titles as ust
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM succession_titles

--Deliverable 3, Mentee Eligibility
SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentee_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date > '1995-01-01')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentee_eligibility

