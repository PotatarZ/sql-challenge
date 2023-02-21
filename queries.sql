--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, (
	SELECT s.salary
	FROM salaries AS s
	WHERE e.emp_no = s.emp_no
)
FROM employees AS e;


--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE EXTRACT(year FROM TO_DATE(hire_date, 'M/D/YYYY')) = 1986;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT m.dept_no, (
	SELECT d.dept_name
	FROM departments AS d
	WHERE d.dept_no = m.dept_no), m.emp_no, (
		SELECT e.last_name
		FROM employees AS e
		WHERE e.emp_no = m.emp_no), (
			SELECT e.first_name
			FROM employees AS e
			WHERE e.emp_no = m.emp_no)
FROM dept_manager AS m;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
JOIN departments AS d ON d.dept_no = de.dept_no
JOIN employees AS e ON e.emp_no = de.emp_no
ORDER BY dept_no;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND LEFT(last_name, 1) = 'B';


--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_emp AS de ON de.dept_no = d.dept_no
JOIN employees AS e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp AS de ON de.dept_no = d.dept_no
JOIN employees AS e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "frequency_count"
FROM employees
GROUP BY last_name
ORDER BY "frequency_count" DESC;

