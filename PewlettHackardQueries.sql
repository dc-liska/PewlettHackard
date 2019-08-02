--Queries for PewlettHackard database analysis, by David Liska, 2019.

--Query to determine employee's ID, last name, first name, gender and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--Query to determine employees hired in the year 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--Query to return department manager information, including information for their affiliated department.
SELECT dm.dept_no, dept.dept_name, dm.emp_no, empl.last_name, empl.first_name, dm.from_date, dm.to_date
FROM dept_manager dm
INNER JOIN departments dept ON dept.dept_no=dm.dept_no
INNER JOIN employees empl ON empl.emp_no=dm.emp_no
ORDER BY dm.dept_no, dm.from_date;

--Query to return employee numbers, last names and first names, and department names.
SELECT de.emp_no, empl.last_name, empl.first_name, dept.dept_name
FROM dept_emp de
INNER JOIN departments dept ON dept.dept_no=de.dept_no
INNER JOIN employees empl ON empl.emp_no=de.emp_no
ORDER BY empl.last_name, empl.first_name;

--Query to return employees with first name "Hercules" and last name begins with "B."
SELECT emp_no, first_name, last_name 
FROM employees
WHERE (first_name='Hercules' ) AND (last_name LIKE 'B%')
ORDER BY last_name;

--Query to return employees in the Sales department with employee number, last name, first name, and department name.
SELECT de.emp_no, empl.last_name, empl.first_name, dept.dept_name
FROM dept_emp de
INNER JOIN departments dept ON dept.dept_no=de.dept_no
INNER JOIN employees empl ON empl.emp_no=de.emp_no
WHERE dept.dept_name='Sales'
ORDER BY empl.last_name, empl.first_name;

--Query to return employees in the Sales or Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, empl.last_name, empl.first_name, dept.dept_name
FROM dept_emp de
INNER JOIN departments dept ON dept.dept_no=de.dept_no
INNER JOIN employees empl ON empl.emp_no=de.emp_no
WHERE (dept.dept_name='Development') OR (dept.dept_name='Sales')
ORDER BY empl.last_name, empl.first_name;

--Query to return a list the frequency count of employee last names, in descending order.
SELECT last_name, COUNT(last_name) AS "Employee Name Counts"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
