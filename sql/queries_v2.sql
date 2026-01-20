-- queries_v2.sql
-- Lead time & delays (Day 12)

-- Q1: Lead time per milestone (planned_date -> actual_date) in days
-- Only completed milestones (actual_date IS NOT NULL)
SELECT
  m.id AS milestone_id,
  m.project_id,
  m.type AS milestone_type,
  m.planned_date,
  m.actual_date,
  CAST(julianday(m.actual_date) - julianday(m.planned_date) AS INTEGER) AS lead_time_days,
  m.status AS milestone_status
FROM milestones m
WHERE m.actual_date IS NOT NULL
ORDER BY lead_time_days DESC;

-- Q2: Projects with milestones delayed more than X days (threshold)
-- Change X here:
-- NOTE: Only milestones with actual_date filled (completed) are measurable for delay.
SELECT
  p.id AS project_id,
  p.name AS project_name,
  p.status AS project_status,
  COUNT(m.id) AS delayed_milestones_count,
  MAX(CAST(julianday(m.actual_date) - julianday(m.planned_date) AS INTEGER)) AS worst_delay_days
FROM projects p
JOIN milestones m ON m.project_id = p.id
WHERE m.actual_date IS NOT NULL
  AND (julianday(m.actual_date) - julianday(m.planned_date)) > 2
GROUP BY p.id, p.name, p.status
ORDER BY worst_delay_days DESC;


