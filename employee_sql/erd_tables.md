titles
-
title_id VARCHAR(10) PK 
title VARCHAR(20)

departments
-
dept_no VARCHAR(10) PK
dept_name VARCHAR(30)

employees
-
emp_no INT PK
emp_title_id VARCHAR(5) FK >- titles.title_id
birth_date DATE
first_name VARCHAR(30)
last_name VARCHAR(30)
sex VARCHAR(1)
hire_date DATE

salaries
-
emp_no INT PK FK - employees.emp_no
salary INT

dept_emp
-
emp_no INT PK FK >- employees.emp_no
dept_no VARCHAR(10) PK FK >- departments.dept_no 

dept_manager
-
dept_no VARCHAR(10) FK >- departments.dept_no
emp_no INT PK FK >- employees.emp_no
