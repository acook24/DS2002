#1. Find the number of Male (M) and Female (F) employees in the database and
#order the counts in descending order.
select gender, count(gender) from employees Group by gender order by count(gender) desc;

#2. Find the average salary by employee title, round to 2 decimal places and order by descending order.
#HINT: You’ll use ROUND, AVG, GROUP BY and ORDER BY

select title, round(avg(salary), 2) from titles, salaries
where titles.emp_no = salaries.emp_no group by title order by round(avg(salary), 2) desc;
 

#3. Find all the employees that have worked in at least 2 departments. Show their first name,
#last_name and the number of departments they work in. Display all results in ascending
#order. HINT JOIN on emp_no
SELECT first_name, last_name, COUNT(dept_no) 
FROM employees, dept_emp 
WHERE employees.emp_no = dept_emp.emp_no 
GROUP BY dept_emp.emp_no 
HAVING COUNT(dept_no) >= 2;

#4. Display the first name, last name, and salary of the highest paid employee.

select first_name, last_name, salary from employees, salaries
where employees.emp_no = salaries.emp_no 
and salary = (select MAX(salary) from salaries);
        
        
#5. Display the first name, last name, and salary of the second highest paid
#employee.

select first_name, last_name, salary from employees, salaries 
where employees.emp_no = salaries.emp_no 
and salary not in (select max(salary) from salaries) 
and last_name not like "Pesch" 
order by salary desc limit 1;
         
#6. Display the month and total hires for the month with the most hires.
Select month(hire_date), count(month(hire_date)) from employees group by month(hire_date) order by count(month(hire_date)) desc limit 1;

#7. Display each department and the age of the youngest employee at hire date.
#HINT: You’ll join on emp_no and dept_no
Select departments.dept_name, (min(datediff(employees.hire_date, employees.birth_date))/365) as min_age  from employees, dept_emp, departments
    WHERE employees.emp_no = dept_emp.emp_no AND
    dept_emp.dept_no = departments.dept_no group by dept_name;


#8. Find all the employees that do not contain vowels in their first name and display the
#department they work in
select employees.first_name, employees.last_name, departments.dept_name from employees, dept_emp, departments
where employees.emp_no = dept_emp.emp_no AND dept_emp.dept_no = departments.dept_no 
and first_name not like '%a%'
and first_name not like '%e%'
and first_name not like '%i%'
and first_name not like '%o%'
and first_name not like '%u%';

