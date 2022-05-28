### Pewlett-Hackard-Analysis

---

## Overview 

*Purpose*

A large company with over 7000 employees offers a retirement package for retirees that meet certain criteria. At this time, a large amount of employees are going to be retiring all at once, which will cause a tremendous change. The company's HR analyst, Bobby, is in charge of determing who is retiring, how many positions need to be filled, and from which department the employee is retiring from. After successful use of SQL, Bobby is now in charge of determining the number of retiring employees per title and the employees who will be eligible to participate in a mentorship program. 


---

## Results 

*Deliverable 1*
  
 
By using primary keys , it was possible to join the different sources to be able to display the needed information from multiple datasets. In the code below, it's clear that aliases were used to improve code readability. These nicknames were defined below the SELECT statement. 


`SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' and '1955-12-31')
ORDER BY e.emp_no;`

- The table that was returned was very lengthy. It has 113,776 rows, which is a LOT of employees that are eligible to retire. This is a long list, but if a closer look is taken, it's seen that some employees are listed multiple times. This table pulled every single title that an employee has had during their employement. Duplicates would have to be removed to receive a more accurate count of how many employees are retiring. 

- When the code is revised to only include a single occurance of each employee that plans to retire, the list is only 74,458 rows long. This is quite different than the first table that was created. The most recent title is the only job tile listed, by the DISTINCT ON command. 

`SELECT DISTINCT ON (rt.emp_no) 
		rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title
INTO unique_titles FROM retirement_titles as rt
WHERE (to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;`

- Knowing which jobs will have to be replaced and filled will signficantly assist the human resources department in the hiring process. By sorting by the job titles, the total count can be generated for each. This will help determine how many positions of each title will need to be advertised. 
(https://user-images.githubusercontent.com/102566199/170809912-441d4cf4-6467-4d01-8e97-51f1899acf21.png)

[Table 1: Retirees' Titles in Descending Order]!

The highest amount of retirees are in the Senior Engineer role, closely followed by Senior Staff. 

*Deliverable 2* 
- Once HR gets a good look at how many positions are opening up, they will need to figure out how to replenish their workforce. Such a large number of retirees is bound to cause some internal issues. This helps to understand why the mentorship program is a preferred option. The mentorship program allows the retirement crisis or "silver tsunami" to be dampened through a slow transition out of the workforce for the retirees that qualify. 
- When the code is run, the table that is returned has 1,549 rows. This shows how many employees that are retiring are eligible for the mentorship program. This isn't a huge number, but it will help to dampen the blow of a massive move to retirement. 

---

## Summary

*How many roles will need to be filled as the "silver tsunami" begins to make an impact?*

That refined table of the unique titles of the retirees has around 74,000 positions, which means that the human resources department should start interally recruiting for the senior positions and fill as many as those as they can in the near future, but in the more distant future (2-7 years), they need to start actively seeking out individuals to fill in more entry-level positions. 


*Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?*

No, there are not enough mentors to go around. Our table yielded about 1,500 individuals who would be able to mentor new employees. These mentors might be spread thin in some departments, while others are more well covered. They have too many open positions for the mentor program to go smoothly. Perhaps a wider network of mentors could be made with more than just the retirees to help buffer the need for experienced employees. 

*Additional Queries*
- The company should also think about breaking down recruiting by department. This way it can be a more focused effort for departments that will be severely affected by the massive turnover. The retirees are leaving senior positions, which are harder to replace. Interal movement could be promoted to long term employees to help buffer the need for job positions that require lots of knowledge and experience. 

- In the near future, the HR department should determine how many people are leaving in each fiscal year and then plan their recruiting around that. Their best bet is to hire externally for lower positions and move the lower positions up. They need to determine which department is losing employees the soonest to plan on how that will affect the company's budget. The amount of money that the company will save when the retirees leave is going to be very high, so they should run a query to see how much they can afford to put towards hiring and recruiting. 

