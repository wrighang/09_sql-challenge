-- List the employee number, last name, first name, sex, and salary of each employee
--employees: emp_no, last_name, first_name, sex --> emp_no
--salary: salary --> emp_no

select emp.emp_no, emp.last_name, emp.first_name, emp.sex,
	s.salary
	from employees as emp
	left join salaries as s
	on emp.emp_no = s.emp_no
	order by emp.emp_no;
	

-- List the first name, last name, and hire date for the employees who were hired in 1986
--employees: first_name, last_name, hire_date

select first_name, last_name, hire_date
	from employees
	where hire_date between '1/1/1986' and '12/31/1986';


-- List the manager of each department along with their department number, department name, employee number, last name, and first name
--dept_manager: dept_no, emp_no
--departments: dept_no, dept_name
--employees: emp_no, last_name, first_name

select dm.dept_no, 
	d.dept_name, 
	dm.emp_no,
	emp.last_name, emp.first_name
	from dept_manager as dm
	inner join departments as d on dm.dept_no = d.dept_no
	inner join employees as emp on dm.emp_no = emp.emp_no;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
--employees: emp_no, last_name, first_name
--dept_emp: emp_no, dept_no
--departments: dept_no, dept_name

select emp.emp_no, emp.last_name, emp.first_name,
	de.dept_no, d.dept_name
	from employees as emp
	inner join dept_emp as de on emp.emp_no = de.emp_no   
	inner join departments as d on de.dept_no = d.dept_no;
	
	
-- List first name, last first, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
--employees: first_name, last_name, sex -- first_name = Hercules and last_name like "B%"

select first_name, last_name, sex
	from employees
	where first_name = 'Hercules' and last_name ilike 'B%'
	order by last_name asc;


-- List each employee in the Sales department, including their employee number, last name, and first name
--employees: emp_no, last_name, first_name
--departments: dept_no, dept_name
--dept_emp: emp_no, dept_no

select emp.emp_no, emp.last_name, emp.first_name, d.dept_name
	from employees as emp
	inner join dept_emp as de on emp.emp_no = de.emp_no
	inner join departments as d on de.dept_no = d.dept_no
	where d.dept_name = 'Sales'
	order by emp.emp_no asc;


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
--employees: emp_no, last_name, first_name
--departments: dept_no, dept_name
--dept_emp: emp_no, dept_no

select emp.emp_no, emp.last_name, emp.first_name, d.dept_name
	from employees as emp
	inner join dept_emp as de on emp.emp_no = de.emp_no
	inner join departments as d on de.dept_no = d.dept_no
	where d.dept_name IN ('Sales', 'Development')
	order by emp.emp_no asc;


-- List the frequency counts, in descending order, of all the employee last names
--employees: last_name

select last_name, count(last_name) as last_name_count
	from employees
	group by last_name
	order by last_name_count desc;
