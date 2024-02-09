SELECT * from employee_attrition.attrition;

-- Q1.Count of records
SELECT count(*) from attrition;

-- Q2.Find the details of employees under attrition having 5+ years of experience in between the age group of 27-35.
SELECT count(*) from attrition
where Age between 27 and 35
and Total_Working_Years>=5;

-- Q3.Details of employees having maximum and minimum salary working in different departments who recieved less than 13% salary hike.
SELECT Department,
max(monthly_Income),
min(monthly_Income)
from employee_attrition.attrition
where Percent_Salary_Hike<13
group by Department;

-- Q4.Calulate the average monthly income of all the employees who worked more than 3 years and whose education background is medical.
SELECT avg(Monthly_Income)
from employee_attrition.attrition
where Total_Working_Years > 3
and Education_Field="Medical";

-- Q5.Identify the total number of male and female employees under attrition whose marital status is married and haven't received promotion in the last 2 years.

SELECT gender, count(CF_attrition_count)
from employee_attrition.attrition
where Marital_Status="Married"
and Years_Since_Last_Promotion=2
and CF_attrition_count=1
group by gender;

-- Q6.Employees with maximum performance rating but no promotion for 4 years and above.
SELECT Employee_Number,
max(Performance_Rating) As Rating
from employee_attrition.attrition
where Performance_Rating=(SELECT max(Performance_Rating) from  employee_attrition.attrition)
and Years_Since_Last_Promotion >=4
group by Employee_Number;

-- Q7 Employees with maximum and minimum percentage salary hike.

SELECT Employee_Number,Percent_Salary_Hike
FROM employee_attrition.attrition
WHERE Percent_Salary_Hike = (SELECT MAX(Percent_Salary_Hike) FROM employee_attrition.attrition)
 OR   Percent_Salary_Hike = (SELECT MIN(Percent_Salary_Hike) FROM employee_attrition.attrition)
 order by Percent_Salary_Hike desc;
 
-- Q8 Employees working overtime but given minimum salary hike and are more than 5 years with the company.
 
SELECT *
from employee_attrition.attrition
where Percent_Salary_Hike=(SELECT min(Percent_Salary_Hike))
and Over_Time="yes"
and Total_Working_Years>5;

-- Q9 Employees with attrition from different departments having a masters degree age more than 30
select * from employee_attrition.attrition
where Attrition="yes"
and Education="Master's Degree"
having Age>30;


