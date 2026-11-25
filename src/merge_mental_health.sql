USE MentalHealth;
GO

CREATE VIEW Dataset AS
SELECT 
    e.*,
    c.work_context_id, c.job_role, c.seniority_level, c.years_experience, c.work_mode, c.salary_usd,
    w.workload_id, w.work_hours_per_week, w.sleep_hours_per_night, w.ai_tools_daily, w.hourly_wage_usd, w.work_life_balance_ratio, w.deadline_pressure_score,
    m.metric_id, m.stress_score, m.burnout_score, m.burnout_level, m.phq9_score, m.phq9_category, m.gad7_score, m.gad7_category, m.total_score,
    b.behavior_id, b.uses_therapy, b.seeks_mental_health_support, b.job_change_intention
FROM Employees e
INNER JOIN Work_Context c ON e.employee_id = c.employee_id
INNER JOIN Workload_Lifestyle w ON e.employee_id = w.employee_id
INNER JOIN Mental_Health_Metrics m ON e.employee_id = m.employee_id
INNER JOIN Employee_Behavior_Attrition b ON e.employee_id = b.employee_id;
GO

SELECT TOP 10 * FROM Dataset;