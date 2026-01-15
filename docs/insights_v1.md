# Insights v1 (no date math)

## Insight 1 — Projects by status (Q1)
This query provides a clean snapshot of all projects grouped by their current status. It helps quickly confirm what is actively being delivered and keeps project-level reporting consistent.

## Insight 2 — Projects per customer (Q2)
This query shows workload concentration per customer by counting how many projects each customer owns. It supports prioritization decisions (e.g., customers running multiple projects may require tighter coordination and more frequent status updates).

## Insight 3 — Total cost per project (Q3)
This query aggregates all cost entries into total spend per project, alongside the planned budget_amount. It creates the baseline for budget control and prepares the dataset for later “over budget” checks.

## Insight 4 — Top 3 most expensive projects (Q4)
This query ranks projects by total spend and returns the top three. It focuses attention on the highest-cost implementations, which typically carry the highest financial and stakeholder risk.

## Insight 5 — Milestones by status per project (Q5)
This query breaks down milestone counts by status for each project. It supports delivery tracking by showing whether milestones are mostly planned, currently in progress, or already completed within each implementation.
