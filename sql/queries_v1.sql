-- queries_v1.sql
-- Implementation Tracker - Query Pack v1 (no date math)

-- Q1: list projects by status
SELECT
  p.status,
  p.id AS project_id,
  c.name AS customer_name,
  p.name AS project_name,
  p.budget_amount
FROM projects p
JOIN customers c
  ON c.id = p.customer_id
ORDER BY
  p.status ASC,
  p.id ASC;

-- Q2: count projects per customer
SELECT
  c.id AS customer_id,
  c.name AS customer_name,
  COUNT(p.id) AS project_count
FROM customers c
LEFT JOIN projects p
  ON p.customer_id = c.id
GROUP BY
  c.id, c.name
ORDER BY
  project_count DESC,
  c.name ASC;

-- Q3: sum costs per project
SELECT
  p.id AS project_id,
  c.name AS customer_name,
  p.name AS project_name,
  p.budget_amount,
  COALESCE(SUM(cs.amount), 0) AS total_cost
FROM projects p
JOIN customers c
  ON c.id = p.customer_id
LEFT JOIN costs cs
  ON cs.project_id = p.id
GROUP BY
  p.id, c.name, p.name, p.budget_amount
ORDER BY
  total_cost DESC,
  p.id ASC;

-- Q4: top 3 most expensive projects
SELECT
  p.id AS project_id,
  c.name AS customer_name,
  p.name AS project_name,
  p.budget_amount,
  COALESCE(SUM(cs.amount), 0) AS total_cost
FROM projects p
JOIN customers c
  ON c.id = p.customer_id
LEFT JOIN costs cs
  ON cs.project_id = p.id
GROUP BY
  p.id, c.name, p.name, p.budget_amount
ORDER BY
  total_cost DESC,
  p.id ASC
LIMIT 3;

-- Q5: milestones by status per project
SELECT
  p.id AS project_id,
  c.name AS customer_name,
  p.name AS project_name,
  m.status AS milestone_status,
  COUNT(m.id) AS milestone_count
FROM projects p
JOIN customers c
  ON c.id = p.customer_id
JOIN milestones m
  ON m.project_id = p.id
GROUP BY
  p.id, c.name, p.name, m.status
ORDER BY
  p.id ASC,
  m.status ASC;
