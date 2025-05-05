---Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. 
---Output just the absolute difference in salaries.
---Tables: db_employee, db_dept

SELECT 
    ABS(
        MAX(CASE WHEN d.department = 'Marketing' THEN e.salary ELSE NULL END) - 
        MAX(CASE WHEN d.department = 'Engineering' THEN e.salary ELSE NULL END)
    ) AS salary_difference
FROM 
    db_employee e
JOIN 
    db_dept d ON e.department_id = d.id;