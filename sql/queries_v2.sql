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

-- Risk queries (Day 14)
-- Reference date: 2026-01-21

-- Q3: Stuck milestones
-- Stuck = no actual completion date and planned date already passed
SELECT
  m.id AS milestone_id,
  m.project_id,
  p.name AS project_name,
  m.type AS milestone_type,
  m.planned_date,
  m.actual_date,
  m.status AS milestone_status
FROM milestones m
JOIN projects p
  ON p.id = m.project_id
WHERE m.actual_date IS NULL
  AND m.planned_date < '2026-01-21'
ORDER BY
  m.planned_date ASC,
  m.project_id ASC;

-- Q4: Budget burn per project
-- Shows total spend vs planned budget and burn ratio
SELECT
  p.id AS project_id,
  p.name AS project_name,
  p.status AS project_status,
  p.budget_amount,
  COALESCE(SUM(c.amount), 0) AS total_cost,
  ROUND(COALESCE(SUM(c.amount), 0) * 1.0 / p.budget_amount, 2) AS burn_ratio
FROM projects p
LEFT JOIN costs c
  ON c.project_id = p.id
GROUP BY
  p.id, p.name, p.status, p.budget_amount
ORDER BY
  burn_ratio DESC,
  total_cost DESC;

-- Q5: Projects over budget
-- Total costs exceed planned budget
SELECT
  p.id AS project_id,
  p.name AS project_name,
  p.status AS project_status,
  p.budget_amount,
  COALESCE(SUM(c.amount), 0) AS total_cost,
  ROUND(COALESCE(SUM(c.amount), 0) - p.budget_amount, 2) AS overrun_amount
FROM projects p
LEFT JOIN costs c
  ON c.project_id = p.id
GROUP BY
  p.id, p.name, p.status, p.budget_amount
HAVING COALESCE(SUM(c.amount), 0) > p.budget_amount
ORDER BY
  overrun_amount DESC;

-- Q6: Cost spike in last 7 days
-- Reference window: 2026-01-15 to 2026-01-21
SELECT
  p.id AS project_id,
  p.name AS project_name,
  COALESCE(SUM(c.amount), 0) AS total_cost,
  COALESCE(SUM(CASE
      WHEN c.cost_date BETWEEN '2026-01-15' AND '2026-01-21' THEN c.amount
      ELSE 0
  END), 0) AS last_7_days_cost,
  ROUND(
    COALESCE(SUM(CASE
      WHEN c.cost_date BETWEEN '2026-01-15' AND '2026-01-21' THEN c.amount
      ELSE 0
    END), 0) * 1.0 / COALESCE(SUM(c.amount), 1),
    2
  ) AS spike_ratio
FROM projects p
LEFT JOIN costs c
  ON c.project_id = p.id
GROUP BY
  p.id, p.name
HAVING spike_ratio >= 0.60
ORDER BY
  spike_ratio DESC,
  last_7_days_cost DESC;
