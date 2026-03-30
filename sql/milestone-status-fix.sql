-- data integrity issue:
-- records with 'Pending' status despite having 
-- ActualCompletionDate = TargetDate, which should be 'On-Time'.
SELECT 
	COUNT(*) as InvalidRecords,
	COUNT(*) * 1.0 / (SELECT COUNT(*) FROM Fact_ProjectMilestones) as InvalidPercentage
FROM dbo.Fact_ProjectMilestones
WHERE MilestoneStatus = 'Pending'
	AND ActualCompletionDate = TargetDate;

-- fix: fixed and reusable view project milestones table with validated milestone status
DROP VIEW IF EXISTS dbo.vw_ProjectMilestones_clean;

CREATE VIEW dbo.vw_ProjectMilestones_clean AS
SELECT 
	MilestoneID,
	ProjectID,
	MilestoneName,
    TargetDate,
    ActualCompletionDate,
    MilestoneStatus,
	CASE 
		WHEN MilestoneStatus IS NULL THEN 'Pending'
		WHEN ActualCompletionDate <= TargetDate THEN 'On-Time'
		ELSE 'Delayed'
	END AS ValidatedMilestoneStatus,
	DATEDIFF(DAY, TargetDate, ActualCompletionDate) AS DaysDifference,
	CASE 
		WHEN DATEDIFF(DAY, TargetDate, ActualCompletionDate) > 0 THEN 1 ELSE 0 
	END AS IsDelayed
FROM dbo.Fact_ProjectMilestones;