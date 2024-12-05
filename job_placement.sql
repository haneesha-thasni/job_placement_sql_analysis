CREATE DATABASE jobplacement;
use jobplacement;
show tables;
select * from job_placement;
select DISTINCT college_name from job_placement;

/* NUMBERS FUNCTIONS
1. round
2. abs
3. ceiling
4. floor
5. sqrt
6. TRUNCATE

*/
select round(4.245678,2)result;
select abs(-38463) result;
select ceiling(6.78);
select floor(4.33245);
select sqrt(25);
select truncate(3.14768,2);

/* STRING FUNCTION
1. lower
2. upper
3. Concat
4. length
5. replace
6. trim
7. ltrim
8. rtrim
*/

select name,lower(name) updated_name from job_placement;
select name,upper(name) updater_name from job_placement;
select count(college_name) from job_placement;
select count(DISTINCT college_name) from job_placement;
select replace("haneesha thesni","thesni","thasni");
select trim("  HELLO WORLD ");
SELECT ltrim(" HELLLO");
SELECT rtrim("HAI  ");

/* DATE RELATED FUNCTIONS
1. curdate
2. curtime
3. current_timestamp
4. now
5. adddate
6. subdate
7. date_add
8. date_sub
9. datediff
10. year
11. month
12. monthname
13. day
14. dayname
*/
select curdate();
select curtime();
select current_timestamp();
select now();

/* AGGREGATE FUNCTIONS
1. SUM
2. MAX
3. MIN
4. COUNT
5. avg
*/

select max(age) from job_placement;
select count(DISTINCT stream) from job_placement;
select count(years_of_experience)=3 from job_placement;

-- FIND SPECIFIED ROWS: LIMIT
select * from job_placement limit 5;

-- ORDER BY
select * from job_placement where stream="computer science" ORDER BY salary desc;
select * from job_placement where placement_status="placed" ORDER BY salary desc;
select count(*) from job_placement where placement_status="placed" ORDER BY salary desc;
select * from job_placement ORDER BY years_of_experience asc;
select * from job_placement ORDER BY years_of_experience desc,salary desc;
select * from job_placement order by college_name asc;

-- SUB QUERY
select age,stream,years_of_experience,salary from job_placement where years_of_experience> (select min(years_of_experience)from job_placement) and salary=60000;
select name,age,stream,years_of_experience from job_placement where stream in(select stream from job_placement where stream="computer science")and placement_status="placed";
select name,age,stream from job_placement where age in(select age from job_placement where age>25) and placement_status="not placed";
select * from job_placement;
select name,age,salary from job_placement where salary in (select salary from job_placement where salary>50000 ) and gender="female";

-- CASE STATEMENT
select name,age, stream, salary,
case
when salary<25000
then "Low Salary"
when salary between 25000 and 50000
then "Medium Salary"
else
"High Salary"
end
as salary_range
from job_placement;
select * from job_placement limit 5;

select name,gender,stream,age,years_of_experience,
case
when years_of_experience<=1
then "Fresher"
when years_of_experience<2
then "Junior"
else
"Senior"
end
as job_position
from job_placement;

-- GROUPBY
select stream,avg(salary) as average_salary from job_placement group by stream;
select stream,count(*) as stream_candidates from job_placement group by stream;
select stream,count(*) as stream_placed from job_placement where placement_status="placed" group by stream;
select years_of_experience,count(*) from job_placement GROUP BY years_of_experience;
select placement_status,count(*) from job_placement GROUP BY placement_status;
select gender,count(*) from job_placement GROUP BY gender;
select placement_status,avg(years_of_experience) from job_placement GROUP BY placement_status;
select stream,max(years_of_experience),min(years_of_experience) from job_placement GROUP BY stream;
select stream,max(salary),min(salary),avg(salary) from job_placement GROUP BY stream;

-- ANY
select salary from job_placement where stream="Computer Science";
select name,age,salary,stream from job_placement where salary>ANY(select salary from job_placement where stream="Computer Science");
select name,age,salary,stream from job_placement where salary>ANY(select salary from job_placement where stream="Computer Science")and stream <> "Computer Science";
select name,years_of_experience,stream from job_placement where years_of_experience>ANY(select years_of_experience from job_placement where stream="Information Technology")and stream <> "Information Technology";

-- Having
select placement_status,avg(years_of_experience) from job_placement GROUP BY placement_status;
select stream,count(*) as placement_count from job_placement where placement_status="Placed" GROUP BY stream HAVING count(*)>10;
select stream,count(*) as placement_count from job_placement where placement_status="placed" GROUP BY stream HAVING placement_count>10;

select stream,max(salary) as maximum_salary from job_placement GROUP BY stream HAVING maximum_salary>60000;
select stream,min(salary) as minimum_salary from job_placement GROUP BY stream HAVING min(salary)<60000;
select stream,years_of_experience,count(*) as placement_count from job_placement where placement_status="placed" GROUP BY stream,years_of_experience HAVING placement_count>10 ORDER BY years_of_experience;
