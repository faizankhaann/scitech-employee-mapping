# 1. Create a database named employee, then import data_science_team.csv proj_table.csv and emp_record_table.csv into the employee database from the given resources.

create database employee;
use employee;
show tables;

# 2. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and make a list of employees and details of their department.

select * from employee.emp_record_table;
select emp_id, first_name, last_name, gender, dept from employee.emp_record_table;

#3. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
-- less than two
-- greater than four 
-- between two and four

select emp_id, first_name, last_name, gender,dept,emp_rating from employee.emp_record_table where emp_rating < 2;
select emp_id, first_name, last_name, gender,dept,emp_rating from employee.emp_record_table where emp_rating > 4;
select emp_id, first_name, last_name, gender,dept,emp_rating from employee.emp_record_table where emp_rating between 2 and 4;

# 4. Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then give the resultant column alias as NAME.

select concat(first_name,' ',last_name) as Name from employee.emp_record_table 
where dept = 'finance';

# 5. Write a query to list only those employees who have someone reporting to them. Also, show the number of reporters (including the President).

select * from employee.emp_record_table 
where role in('Manager','President');

# 6. Write a query to list down all the employees from the healthcare and finance departments using union. Take data from the employee record table.

select first_name, last_name, dept from emp_record_table 
where
dept = 'finance'
union
select first_name, last_name, dept from emp_record_table
where
dept = 'healthcare';

# 7. Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also include the respective employee rating along with the max emp rating for the department.

select emp_id, first_name, last_name,role,dept,max(emp_rating) as max_emp_rating from emp_record_table 
group by dept order by max_emp_rating desc;

# 8. Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.

select min(salary) as min_salary,max(salary) as max_salary,role from emp_record_table group by role;

# 9. Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.

select concat(first_name,' ',last_name) as full_name,exp, rank() over (order by exp desc) as experience_on_rank
from emp_record_table;

# 10. Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.

create view view_name as
select emp_id, concat(first_name,' ',last_name) as full_name,country
from emp_record_table
where salary > 6000
order by salary desc;

# 11. Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.

select * from emp_record_table 
where emp_id in(select emp_id from emp_record_table where exp >10) 
order by exp;

# 12. Write a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years. Take data from the employee record table.

delimiter &&
create procedure exp_greaterthan_3()
begin
select * from emp_record_table where exp >3;
end &&
call exp_greaterthan_3();

# 13. Write a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard.
# The standard being:
-- 1 For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
-- 2.For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
-- 3.For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
-- 4.For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
-- 5.For an employee with the experience of 12 to 16 years assign 'MANAGER'.

select first_name,last_name,role, exp,
case
when exp <= 2 then 'Junior Data Scientist'
when exp between 2 and 5 then 'Associate Data Scientist'
when exp between 5 and 10 then 'Senior Data Scientist'
when exp between 10 and 12 then 'Lead Data Scientist'
When exp between 12 and 16 then 'Manager' else 'Not assign a value'
end as role_assign
from emp_record_table;

# 14. Create an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.

create index index_firstname
on emp_record_table(first_name);
 
# 15. Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating).

select *, round((0.05% * salary)*emp_rating) as Bonus from emp_record_table order by bonus desc;	
select * from proj_table;

# 16. Write a query to calculate the average salary distribution based on the continent and country. Take data from the employee record table.

select continent,country,round(avg(salary)) as Average_salary
from emp_record_table
group by continent,country
order by Average_salary desc;
















 












