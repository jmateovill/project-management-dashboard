CREATE VIEW dbo.vw_EmployeeDetails AS
SELECT 
    EmployeeID,
    Name,
    Role,
    HourlyRate,
    e.DeptID,
    d.DeptName,
    HireDate, 
    EmploymentType, 
    SeniorityLevel,
    Location
FROM Dim_Employees e
JOIN Dim_Departments d ON e.DeptID = d.DeptID