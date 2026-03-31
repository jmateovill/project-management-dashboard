-- contains actual start and end dates for projects based on timesheet entries
-- fixing the inconsistency in the Projects tables where the dates are not aligned.

DROP VIEW IF EXISTS dbo.vw_ProjectDates;

CREATE VIEW dbo.vw_ProjectDates AS
SELECT 
    ProjectID, 
    MIN(WorkDate) AS ActualStartDate,
    MAX(WorkDate) AS ActualEndDate
FROM dbo.Fact_Timesheets 
GROUP BY ProjectID;