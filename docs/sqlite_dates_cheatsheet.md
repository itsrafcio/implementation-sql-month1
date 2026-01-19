# SQLite dates cheat sheet (Day 11)

-- Current date (UTC) as YYYY-MM-DD
SELECT date('now');

-- Current datetime (UTC)
SELECT datetime('now');

-- Add/subtract time (example: +7 days from a date)
SELECT date('2026-01-10', '+7 days');

-- Difference in days between two dates (planned -> actual)
SELECT CAST(julianday('2026-01-15') - julianday('2026-01-10') AS INTEGER) AS days_diff;

-- Lead time / delay in your milestones table (NULL actual_date = in progress)
SELECT id, project_id,
       CAST(julianday(actual_date) - julianday(planned_date) AS INTEGER) AS delay_days
FROM milestones
WHERE actual_date IS NOT NULL;

-- "Last 7 days" filter example (for cost_date stored as ISO TEXT)
SELECT * FROM costs WHERE cost_date >= date('now', '-7 days');
