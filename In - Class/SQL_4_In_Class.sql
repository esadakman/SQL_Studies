








SELECT
    employees.emp_id,
    employees.first_name,
    employees.last_name,
    departments.dept_name,
    departments.dept_id
  FROM employees
  LEFT JOIN departments
    ON employees.emp_id = departments.emp_id;