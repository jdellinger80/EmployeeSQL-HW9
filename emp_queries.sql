Analysis

SELECT * FROM employees

SELECT * FROM departments

SELECT * FROM department_employees

SELECT * FROM department_manager

SELECT * FROM salaries

SELECT * FROM titles



-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no AS "Employee Number", employees.last_name as "Last Name", 
        employees.first_name as "First Name", employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were employed in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date > '1986-1-1'::date AND employees.hire_date < '1987-1-1'::date;

-- List each manager of a department along with their department number, 
-- Add department name, employee number, last name, and first name.
SELECT department_manager.dept_no, departments.dept_name, department_manager.emp_no,
        employees.last_name, employees.first_name
FROM department_manager
JOIN employees ON department_manager.emp_no = employees.emp_no
JOIN departments ON department_manager.dept_no = departments.dept_no;

-- List the department number for each employee and employee number, 
-- last name, first name, and department name.
SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees ON employees.emp_no = department_employees.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no;

-- Show first name, last name, and sex of each employee whose first name may be Hercules,
-- and whose last name starts with B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- List every employee in the Sales department, including their employee number, last name, and first name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees ON employees.emp_no = department_employees.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- Show each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN department_employees ON employees.emp_no = department_employees.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- List the frequency, in descending order, of all the employee last names
--  how many employees share a last name
SELECT employees.last_name, Count (*) FROM employees
GROUP BY employees.last_name
ORDER BY Count (*) DESC;

--List the last_name "Foolsday" that appears only once, when rest are 100+ times
SELECT employees.first_name, employees.last_name, employees.sex, employees.hire_date, departments.dept_name
FROM employees
JOIN department_employees ON employees.emp_no = department_employees.emp_no
JOIN departments ON department_employees.dept_no = departments.dept_no
WHERE employees.last_name = 'Foolsday'