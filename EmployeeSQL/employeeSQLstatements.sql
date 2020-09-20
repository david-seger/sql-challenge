-- 1. List the following edetails of each employee:
--		employee number
--		employee last name
--		employee first name
--		employee sex
--		employee salary

SELECT e.emp_no, e.last_name, e.first_name, e.last_name, e.sex, s.salary
	FROM "Employee" e
	INNER JOIN "Salary" s on e.emp_no = s.emp_no;




-- 2. List first name, 
--		last name,
--		hire date 
--		for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
	FROM "Employee"
	WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';




-- 3. List the manager of each department with the following information: 
--		department number, 
--		department name, 
--		the manager's employee number, 
--		last name, 
--		first name.

SELECT	d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM	"Departments" d 
INNER JOIN "Dept_Manager" dm on d.dept_no = dm.dept_no
INNER JOIN "Employee" e on dm.emp_no = e.emp_no;




-- 4. List the department of each employee with the following information: 
--		employee number, 
--		last name, 
--		first name, 
--		and department name.

SELECT 	e.emp_no, e.last_name, e.first_name, d.dept_name
FROM 	"Employee" e 
INNER JOIN "Dept_Emp" de on de.emp_no=e.emp_no
INNER JOIN "Departments" d on de.dept_no = d.dept_no;




-- 5.  List first name, last name, and sex for employees whose 
--			first name is "Hercules" and 
--			last names begin with "B."

SELECT 	first_name, last_name, sex 
FROM	"Employee"
WHERE	first_name = 'Hercules'
AND		last_name LIKE 'B%';



-- 6. List all employees in the Sales department, including their 
--		employee number, 
--		last name, 
--		first name, 
--		and department name.

SELECT	e.emp_no, e.last_name, e.first_name, d.dept_name
FROM	"Employee" e 
INNER JOIN "Dept_Emp" de on e.emp_no = de.emp_no
INNER JOIN "Departments" d on de.dept_no = d.dept_no
WHERE	d.dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, including their 
--		employee number, 
--		last name, 
--		first name, 
--		and department name.

SELECT	e.emp_no, e.last_name, e.first_name, d.dept_name
FROM	"Employee" e 
INNER JOIN "Dept_Emp" de on e.emp_no = de.emp_no
INNER JOIN "Departments" d on de.dept_no = d.dept_no
WHERE	d.dept_name in ('Sales','Development');



--	8. In descending order, list the frequency count of employee last names, 
--		i.e., how many employees share each last name.

SELECT	last_name, count(*) 
FROM	"Employee"
GROUP BY last_name
ORDER BY last_name desc;

