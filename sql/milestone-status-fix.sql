-- data integrity issue:
-- records with 'Pending' status despite having 
-- ActualCompletionDate = TargetDate, which should be 'On-Time'.
SELECT 
	COUNT(*) as InvalidRecords,
	COUNT(*) * 1.0 / (SELECT COUNT(*) FROM Fact_ProjectMilestones) as InvalidPercentage
FROM Fact_ProjectMilestones
WHERE MilestoneStatus = 'Pending'
	AND ActualCompletionDate = TargetDate

-- fix: fixed and reusable view project milestones table with validated milestone status
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
	END AS ValidatedMilestoneStatus
FROM Fact_ProjectMilestones