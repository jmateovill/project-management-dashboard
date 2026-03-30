DROP VIEW IF EXISTS dbo.vw_ProjectLaborCosts;

CREATE VIEW dbo.vw_ProjectLaborCosts AS
SELECT 
    TimesheetID,
    ProjectID,
    t.EmployeeID,
    WorkDate,
    HoursWorked,
    e.HourlyRate,
    e.HourlyRate * HoursWorked AS LaborCost,
    CASE WHEN HoursWorked > 8 THEN 1 ELSE 0 END AS IsOvertime
FROM dbo.Fact_Timesheets t
JOIN dbo.Dim_Employees e ON t.EmployeeID = e.EmployeeID;