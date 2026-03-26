# Digital Agency Budget and Project Management Dataset

This dataset is a synthetic dataset created using ChatGPT and Gemini. It aims to mirror a real-world digital product agency dataset. 

## Brainstorming using Gemini

Started a chat with Gemini to turn my question;

*[Prompt] "What do you call a dashboard that tracks the company's budget (department budget, project budget), cost (project costs, salaries/compensation,etc.), projects (status: upcoming, in-progress, completed), and employees?"*

... into a data analysis idea.

*[Prompt] "I'm looking to build a project that is similar to my idea. A real-world project that would help me land a job, and is solid for my data analysis portfolio/resume. Among your recommendations, which of them is the most in-demand? Which of them would have the most impact?"*

After several back-and-forth, it lead me to a decision to craft a **Portfolio/Resume project: *Digital Agency Budget and Project Management Dashboard.***

## Dataset Generation by ChatGPT

Having the project idea and with the help of Gemini, I prompted ChatGPT to generate a synthetic dataset.

*[Prompt] "I am building a Project Portfolio & Resource Management Dashboard for a Digital Product Agency (specializing in Custom Software and UI/UX). I need a synthetic dataset for my Data Analysis portfolio. The agency has 5 departments: Engineering, Design, Product Management, QA/Testing, and DevOps. Please generate the following 6 tables in a relational structure (Star Schema) with 1,000+ rows of transactional data. Ensure the data reflects 'messy' real-world business logic:*
1. *Dim_Departments:* 
- *DeptID, DeptName, AnnualOperatingBudget ($500k - $2M). (Engineering, Design, Product, QA, DevOps).* 
2. *Dim_Employees:* 
- *EmployeeID, Name, Role (e.g., Senior Dev, Junior Designer, Lead QA), HourlyRate ($65 - $225), DeptID. - Generate 50 unique employees.* 
3. *Dim_Projects:* 
- *ProjectID, ProjectName (e.g., 'FinTech App Redesign', 'E-commerce Platform Migration'), ClientName, TotalProjectBudget ($50k - $500k), StartDate, EndDate, Status (Upcoming, In-Progress, Completed), DeptID (Lead Dept).* 
- *Generate 20 projects spanning the last 12 months.* 
4. *Fact_ProjectMilestones:* 
- *MilestoneID, ProjectID, MilestoneName (Discovery, MVP, Beta Launch, Final Handover), TargetDate, ActualCompletionDate, MilestoneStatus (On-Time, Delayed, Pending).* 
- *Logic: Ensure 30% of milestones are 'Delayed' (Actual > Target).* 
5. *Fact_Timesheets (Labor Costs):* 
- *TimesheetID, ProjectID, EmployeeID, WorkDate, HoursWorked.* 
- *Generate 1,500+ rows for the last 6 months.* 
- *Crucial Business Scenarios: Scope Creep: At least 3 projects must have Total Labor Cost (Hours * HourlyRate) exceeding the TotalProjectBudget.* 
- *Burn Rate: Ensure some projects are spending budget faster than they are completing milestones. Under-utilization: A few employees should have <20 hours a week to show 'bench time.'* 
6. *Dim_Calendar: - Standard date table (Date, Month, Quarter, Year, IsWeekday).* 

*Output Format: Please provide the data as SQL INSERT statements (compatible with MS SQL Server) or as structured CSV blocks. Ensure all Foreign Keys correctly map to Primary Keys."*

## Dataset
[Dim_Calendar.csv](Dim_Calendar.csv)

[Dim_Departments.csv](Dim_Departments.csv)

[Dim_Employees.csv](Dim_Employees.csv)

[Dim_Projects.csv](Dim_Projects.csv)

[Fact_ProjectMilestones.csv](Fact_ProjectMilestones.csv)

[Fact_Timesheets.csv](Fact_Timesheets.csv)
