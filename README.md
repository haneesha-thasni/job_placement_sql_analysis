# Job Placement Database Queries

## 📌 Overview
This repository contains SQL queries for analyzing job placement data. The queries cover various SQL functions, subqueries, case statements, grouping, and filtering techniques to extract meaningful insights from the job placement database.

## 📂 Database Setup
```sql
CREATE DATABASE jobplacement;
USE jobplacement;
SHOW TABLES;
SELECT * FROM job_placement;
SELECT DISTINCT college_name FROM job_placement;
```

## 🔢 Number Functions
```sql
SELECT ROUND(4.245678,2) AS result;
SELECT ABS(-38463) AS result;
SELECT CEILING(6.78);
SELECT FLOOR(4.33245);
SELECT SQRT(25);
SELECT TRUNCATE(3.14768,2);
```

## 🔡 String Functions
```sql
SELECT name, LOWER(name) AS updated_name FROM job_placement;
SELECT name, UPPER(name) AS updated_name FROM job_placement;
SELECT COUNT(college_name) FROM job_placement;
SELECT COUNT(DISTINCT college_name) FROM job_placement;
SELECT REPLACE("haneesha thesni", "thesni", "thasni");
SELECT TRIM("  HELLO WORLD ");
SELECT LTRIM(" HELLO");
SELECT RTRIM("HAI  ");
```

## 📅 Date Functions
```sql
SELECT CURDATE();
SELECT CURTIME();
SELECT CURRENT_TIMESTAMP();
SELECT NOW();
```

## 📊 Aggregate Functions
```sql
SELECT MAX(age) FROM job_placement;
SELECT COUNT(DISTINCT stream) FROM job_placement;
SELECT COUNT(years_of_experience) FROM job_placement;
```

## 🔍 Filtering and Sorting Data
```sql
SELECT * FROM job_placement LIMIT 5;
SELECT * FROM job_placement WHERE stream="computer science" ORDER BY salary DESC;
SELECT * FROM job_placement WHERE placement_status="placed" ORDER BY salary DESC;
SELECT * FROM job_placement ORDER BY years_of_experience ASC;
SELECT * FROM job_placement ORDER BY years_of_experience DESC, salary DESC;
SELECT * FROM job_placement ORDER BY college_name ASC;
```

## 🔄 Subqueries
```sql
SELECT age, stream, years_of_experience, salary FROM job_placement
WHERE years_of_experience > (SELECT MIN(years_of_experience) FROM job_placement) AND salary=60000;
SELECT name, age, stream FROM job_placement WHERE age IN (SELECT age FROM job_placement WHERE age > 25) AND placement_status="not placed";
```

## ⚖️ Case Statements
```sql
SELECT name, age, stream, salary,
CASE
    WHEN salary < 25000 THEN "Low Salary"
    WHEN salary BETWEEN 25000 AND 50000 THEN "Medium Salary"
    ELSE "High Salary"
END AS salary_range FROM job_placement;
```

## 📊 Group By & Having
```sql
SELECT stream, COUNT(*) AS stream_placed FROM job_placement WHERE placement_status="placed" GROUP BY stream;
SELECT stream, COUNT(*) AS placement_count FROM job_placement WHERE placement_status="placed" GROUP BY stream HAVING placement_count > 10;
SELECT stream, MAX(salary) AS max_salary FROM job_placement GROUP BY stream HAVING max_salary > 60000;
```

## 🏆 Insights & Analysis
- Identifies salary ranges for different candidates.
- Groups data by stream, placement status, and experience.
- Filters candidates who have not yet been placed.
- Sorts and retrieves candidates with the highest salaries.

## 🚀 How to Use
1. Clone this repository.
2. Import the `jobplacement` database.
3. Execute the provided SQL queries in your MySQL database environment.

## 🛠 Technologies Used
- MySQL
- SQL Querying & Functions
- Data Aggregation & Filtering

📢 Feel free to contribute or raise issues! Happy Querying! 🚀

