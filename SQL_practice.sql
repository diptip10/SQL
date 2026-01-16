-- 1. Find the second highest salary from the salaries table. 

-- 1) by using subquery

SELECT max(salary) as sec_high_sal from SALARIES 
where salary<(
    SELECT max(salary) from salaries
);

-- 2) by using limit and offset

select DISTINCT salary from salaries
ORDER BY salary DESC
limit 1 offset 1;

-- 3) By using window function

SELECT salary FROM(
    select salary, DENSE_RANK() over (order by salary DESC) as rnk from salaries
) ranked where rnk =2;

-- 4) with cte

with salary_rank as(
    select 
    s.*, DENSE_RANK() OVER (order by s.salary DESC) rnk 
    from salaries s
) select * from salary_rank 
where rnk = 2 ;


-- 2. find duplicate record in the table

--1) using group by and having
select emp_no, count(*) as cnt from salaries group by emp_no having count(*)>1;

--2) using cte and row number
with duplicate_rec as(
    select *, row_number() OVER (partition by emp_no order by emp_no) as rnk from salaries
) select * from duplicate_rec where rnk>1;

-- if we want to delete the duplicate rows
with duplicate_rec as (
    select *, row_number() over (partition by emp_no order by emp_no) as rnk from salaries
) delete from salaries
where emp_no in (
    select emp_no from duplicate_rec where rnk>1
);


-- 3.  Retrieve employees who earn more than their manager
-- employee table - emp_no , salary , manager_id , name 
-- emp salary> manager salary


-- --CREATE TABLE employees (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(100) NOT NULL,
--     salary DECIMAL(10,2) NOT NULL,
--     manager_id INT,
--     FOREIGN KEY (manager_id) REFERENCES employees(id)
-- );



select e.name as employee, e.salary, m.name as manager, m.salary  as manager_salary 
from employee m join employee e
 on e.manager_id= m.manager_id where e.salary>m.salary


-- --SELECT e.name AS Employee, e.salary, m.name AS 
-- Manager, m.salary AS ManagerSalary 
-- FROM employees e 
-- JOIN employees m ON e.manager_id = m.id 
-- WHERE e.salary > m.salary;

-- 4. Count employees in each department having more than 5 employees. 
select department_id, count(*) as total_cnt from employees group by department_id having count(*)>5;

-- 5. Find employees who joined in the last 6 months. 
SELECT * from employees 
WHERE join_date >= CURRENT_DATE - INTERVAL '6 months';



-- 6.  Running total of salaries by department.  
SELECT name, salary, sum(salary) over (partition by dept_id order by emp_id) from employees;

