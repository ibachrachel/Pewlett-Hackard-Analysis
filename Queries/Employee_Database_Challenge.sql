
------------------
--Deliverable 1:
--1. Retrieve emp_no, first_name, last_name from employees
--2. Retrieve title, from_date, to_date from titles
--3. join tables on primary key into new table (retirement_titles)
--4. filer to get employees birth from 52-55

SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' and '1955-12-31')
ORDER BY e.emp_no;

--check to make sure it's gonna show up:
SELECT * FROM retirement_titles
-- if it worked, un-comment the INTO command: which creates a new table

--9. retrieve the employee number, name, title: new table to hold most recent title
--10. district on: first occurence of an employee number (eliminates duplicates)
--11. exclude employees who left: 9999 is the to date
--12. create unqiue titles table
SELECT DISTINCT ON (rt.emp_no) 
		rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title
INTO unique_titles FROM retirement_titles as rt
WHERE (to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles; 

--16. Number of Employees by most recent title, who are about to retire:
--17. retrieve titles from unique_titles
--18. create retiring_titles table
--19. gorup by title, count in DESC
SELECT count(ut.emp_no), ut.title
INTO retiring_titles FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count (ut.emp_no) DESC;

SELECT * FROM retiring_titles 


------------------------------------
--Deliverable 2: 
--1. retrieve emp_no, names, DOB from employees
--2. retrieve from_date, to_date from departments
--3. retrieve title from titles
--4. use district on for emp_no
--5. create new table by joining employees, dpmt, and titles
--6. filter by to_date and birth_date
--7. Order by employee number
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility FROM employees e
INNER JOIN dept_emp as de on (e.emp_no = de.emp_no)
INNER JOIN titles as t on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' and '1965-12-31') and (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility 