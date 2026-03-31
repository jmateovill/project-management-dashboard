-- Project Milestone Fix Part 1: Set target and actual completion dates as NULL
-- for Claude to populate it with realistic dates aligned on the 'vw_ProjectDates'.
-- Actual Completion Dates for 'Final Handover' milestones = 'ActualEndDate' from 'vw_ProjectDates'.
SELECT 
    pm.MilestoneID,
    pm.ProjectID,
    pm.MilestoneName,
    CASE 
      WHEN pm.TargetDate > DATEADD(MONTH, 5, GETDATE()) THEN pm.TargetDate
      ELSE NULL 
    END AS TargetDate,
    CASE 
      WHEN pm.MilestoneName = 'Final Handover' THEN pd.ActualEndDate
      ELSE NULL
    END AS ActualCompletionDate
FROM dbo.Fact_ProjectMilestones pm
LEFT JOIN dbo.vw_ProjectDates pd
    ON pm.ProjectID = pd.ProjectID;
