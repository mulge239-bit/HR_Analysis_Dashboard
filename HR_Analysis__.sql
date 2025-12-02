create database hr_analysis;

-- 1. Total Employees
SELECT 
    COUNT(*) AS Total_Employees
FROM hr_analysis;

-- 2. Total Attrition
SELECT 
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition
FROM hr_analysis;

-- 3. Attrition Rate (%)
SELECT 
    ROUND(
        AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END) * 100, 2
    ) AS Attrition_Rate_Percentage
FROM hr_analysis;

-- 4. Average Age
SELECT 
    ROUND(AVG(Age), 2) AS Average_Age
FROM hr_analysis;

-- 5. Average Monthly Income
SELECT 
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income
FROM hr_analysis;

-- 6. Average Years at Company
SELECT 
    ROUND(AVG(YearsAtCompany), 2) AS Average_Years_At_Company
FROM hr_analysis;

-- 7. Average Job Satisfaction
SELECT 
    ROUND(AVG(JobSatisfaction), 2) AS Average_Job_Satisfaction
FROM hr_analysis;
-- 8. Average Attrition Rate for All Departments
SELECT 
    Department,
    AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END) * 100 
        AS Avg_Attrition_Rate
FROM HR_Data
GROUP BY Department;

-- 9.Average Hourly Rate of Male Research Scientists
SELECT 
    AVG(HourlyRate) AS Avg_HourlyRate_Male_RS
FROM HR_Data
WHERE Gender = 'Male'
  AND JobRole = 'Research Scientist';

-- 10.Attrition Rate vs Monthly Income
SELECT 
    Attrition,
    AVG(MonthlyIncome) AS Avg_MonthlyIncome,
    COUNT(*) AS Total_Employees
FROM HR_Data
GROUP BY Attrition;

-- 11. Average Working Years for Each Department
SELECT 
    Department,
    AVG(TotalWorkingYears) AS Avg_WorkingYears
FROM HR_Data
GROUP BY Department;

-- 12.Job Role vs Work-Life Balance
SELECT 
    JobRole,
    AVG(WorkLifeBalance) AS Avg_WorkLifeBalance
FROM HR_Data
GROUP BY JobRole;

-- 13.Attrition Rate vs Years Since Last Promotion
SELECT 
    YearsSinceLastPromotion,
    AVG(CASE WHEN Attrition = 'Yes' THEN 1.0 ELSE 0 END) * 100 
        AS Attrition_Rate
FROM HR_Data
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;