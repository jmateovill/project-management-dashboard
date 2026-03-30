DROP VIEW IF EXISTS dbo.vw_ProjectDetails;

CREATE VIEW dbo.vw_ProjectDetails AS
SELECT 
    ProjectID, 
    ProjectName,
    ClientName, 
    TotalProjectBudget,
    StartDate,
    EndDate,
    CASE 
        WHEN EndDate < CAST(GETDATE() AS DATE) THEN 'Completed'
        WHEN StartDate <= CAST(GETDATE() AS DATE) AND EndDate > CAST(GETDATE() AS DATE) THEN 'In Progress'
        ELSE 'Upcoming'
    END AS ProjectStatus,
    DATEDIFF(DAY, StartDate, EndDate) AS DurationDays,
    DeptID
FROM dbo.Dim_Projects;