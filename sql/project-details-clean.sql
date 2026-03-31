-- updated project details view table with fixed start and end dates

DROP VIEW IF EXISTS dbo.vw_ProjectDetails_clean;

CREATE VIEW dbo.vw_ProjectDetails_clean AS
SELECT 
    p.ProjectID,
    P.ProjectName,
    p.ClientName,
    p.TotalProjectBudget,
    pd.ActualStartDate as StartDate,
    pd.ActualEndDate as EndDate,
    CASE
        WHEN pd.ActualEndDate < GETDATE() THEN 'Completed'
        WHEN pd.ActualStartDate > GETDATE() THEN 'Upcoming'
        ELSE 'In Progress'
    END AS Status,
    DATEDIFF(DAY, pd.ActualStartDate, pd.ActualEndDate) AS DurationDays,
    p.DeptID
FROM dbo.Dim_Projects p
LEFT JOIN dbo.vw_ProjectDates pd
    ON p.ProjectID = pd.ProjectID;