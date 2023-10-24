-- List the employee number, last name, first name, sex and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, salaries.salary 
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name and first name
SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.first_name, employees.last_name
FROM employees 
LEFT JOIN dept_manager 
ON dept_manager.emp_no = employees.emp_no 
LEFT JOIN departments
ON departments.dept_no = dept_manager.dept_no
WHERE employees.emp_title_id = 
(SELECT title_id
FROM titles 
WHERE title = 'Manager');

-- List the department number for each employee along with that employee's employee number, last name, first name, and department name
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name 
SELECT employees.emp_no, employees.first_name, employees.last_name 
FROM employees
LEFT JOIN dept_emp 
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
LEFT JOIN dept_emp 
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many emplyoees share each last name)
SELECT last_name, COUNT(*) as frequency_counts
FROM employees
GROUP by last_name
ORDER BY frequency_counts DESC;
