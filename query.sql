--IMPORT and view table
select * from "Department";
select * from "dept";
select * from "dept_manager";
select * from "employee";
select * from "salaries";
select * from "titles";

--Query--
--List the following details of each employee: employee number, last name, first name, gender, and salary.
select "employee".emp_no,last_name,first_name,gender,salary
from "employee" 
left join "salaries"  On "employee".emp_no="salaries".emp_no;

-- List employees who were hired in 1986.
select first_name,last_name,emp_no,hire_date
from "employee"
where hire_date like '1986%';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
select "dept_manager".emp_no,"dept_manager".dept_no,last_name,first_name,from_date,to_date,dept_name
from "dept_manager"
left join "employee" on "employee".emp_no="dept_manager".emp_no
left join "Department" on "Department".dept_no="dept_manager".dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select "dept".emp_no,"dept".dept_no,last_name,first_name,dept_name
from "dept"
left join "employee" on "employee".emp_no="dept".emp_no
left join "Department" on "Department".dept_no="dept".dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
select emp_no,first_name, last_name
from "employee"
where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
create view dept_emp_name as
select "dept".emp_no,"dept".dept_no,last_name,first_name,dept_name
from "dept"
left join "employee" on "employee".emp_no="dept".emp_no
left join "Department" on "Department".dept_no="dept".dept_no;

select * from dept_emp_name
where dept_name ='Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select * from dept_emp_name
where dept_name ='Sales' or dept_name ='Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name,count(last_name) as "Frequency count of employee"
from "employee"
group by last_name
order by "Frequency count of employee" DESC;