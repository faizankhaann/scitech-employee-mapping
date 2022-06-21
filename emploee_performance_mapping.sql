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

select count(role) from employee.emp_record_table;

/*Write a query to list down all the employees from the healthcare and 
finance departments using union. Take data from the employee record 
table.*/


/*Write a query to list down employee details such as EMP_ID, 
FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING 
grouped by dept. Also include the respective employee rating along 
with the max emp rating for the department.*/

 select emp_id,first_name, last_name, gender,dept,max(emp_rating) as max_emp_rating from employee.emp_record_table 
group by dept order by max_emp_rating desc;

#  Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.
select min(salary) as min_salary,max(salary) as max_salary,role from emp_record_table group by role;

#  Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.
select concat(FIRST_NAME,' ', LAST_NAME) as full_name , exp, rank() over(order by exp desc) as rank_on_experience
from emp_record_table ;

#  Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record table.

create view view_name as
select emp_id,concat(FIRST_NAME,' ', LAST_NAME) as full_name,country
from emp_record_table
where salary > 6000
order by salary desc;

SELECT * FROM view_name;

# Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.
select *from emp_record_table
where emp_id in(select emp_id from employee where exp > 10)
order by exp desc;



















 












