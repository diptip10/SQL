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