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
    select salary, DENSE_RANK() over (order by salary)
) as rank where rank =2;

-- 4) with cte

with salary_rank as(
    select 
    s.*, DENSE_RANK() OVER (order by s.salary DESC) rnk 
    from salaries s
) select * from salary_rank 
where rnk = 2 ;
