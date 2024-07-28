use shop;
CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);
 
 
 -- example
 select * from employees;
 
 -- select average salaries
 select AVG(salary) from employees;

 
  -- select average salaries over the average
  select  avg(salary) over() from employees;
 
 -- select the employee nos, depart and average salary who are over the average.
 select emp_no, department,salary, avg(salary) over() from employees;
 
  select emp_no, department,salary, min(salary) over(),max(salary) over() from employees;
  
 
SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;
    
    
SELECT 
    emp_no, department, salary, MIN(salary), MAX(salary)
FROM
    employees;

-- Partition by
select emp_no, 
department, 
salary,
avg(salary) over(partition by department)as dept_average,
avg(salary) over() as company_average
from employees;

select emp_no, department, salary, count(*) over(partition by department) as employee_dept_strength
from employees;

select
	emp_no,
    department,
    salary,
    sum(salary) over(partition by department)as dept_payroll,
    sum(salary) over() as total_payroll
from employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    COUNT(*) OVER(PARTITION BY department) as dept_count
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;

-- order in over
SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) over(partition by department order by salary) as rolling_dept_salary,
    SUM(salary) over(partition by department) as dept_salary
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
FROM employees;

-- rank
SELECT 
    emp_no, 
    department, 
    salary, 
    rank() over(partition by department order by salary desc)as dept_salary_rank,
    rank() over(order by salary desc) as overall_salary_rank
FROM employees order by department;

SELECT 
    emp_no, 
    department, 
    salary, 
    row_number() over(partition by department order by salary desc)as dept_salary_row,
    rank() over(partition by department order by salary desc)as dept_salary_rank,
    rank() over(order by salary desc) as overall_salary_rank
FROM employees order by department;

SELECT 
    emp_no, 
    department, 
    salary, 
    row_number() over(partition by department order by salary desc)as dept_salary_row,
    rank() over(partition by department order by salary desc)as dept_salary_rank,
    rank() over(order by salary desc) as overall_salary_rank
FROM employees order by department;

SELECT 
    emp_no, 
    department, 
    salary, 
    row_number() over(partition by department order by salary desc)as dept_salary_row,
    rank() over(partition by department order by salary desc)as dept_salary_rank,
    rank() over(order by salary desc) as overall_rank,
	dense_rank() over(order by salary desc) as overall_salary_dense_rank
FROM employees order by overall_rank;

SELECT 
    emp_no, 
    department, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
FROM employees ORDER BY overall_rank;

-- n tile
SELECT 
    emp_no, 
    department, 
    salary,
    ntile(4) over(order by salary desc) as salary_quartile
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    ntile(4) over(partition by department order by salary desc) as dept_salary_quartile,
    ntile(4) over(order by salary desc) as salary_quartile
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
	NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

-- first value
SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall
FROM employees;

-- lead and lag
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff
FROM employees;
