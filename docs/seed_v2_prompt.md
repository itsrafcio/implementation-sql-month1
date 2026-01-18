# Seed v2 prompt (dirty dataset)

Generate a SQLite SQL file named seed_v2.sql containing INSERT statements for the following tables:
customers(id, name, country, segment)
projects(id, customer_id, name, start_date, target_go_live_date, status, budget_amount)
milestones(id, project_id, type, planned_date, actual_date, status)
costs(id, project_id, cost_date, category, amount, currency)

Rules:
- Use only these statuses:
  - projects.status: Planned, In Progress, Done, Blocked
  - milestones.status: Planned, In Progress, Done, Blocked
- Use only these milestone types: Kickoff, Discovery, Build, Integration, UAT, Go-Live
- Use only these cost categories: Vendor, Internal, Travel, Infra, Support
- Use currency EUR everywhere.
- All dates must be ISO format: YYYY-MM-DD (TEXT).
- Include ~8–10 customers.
- Include ~20 projects total across customers.
- Include ~60 milestones total (about 3 per project on average).
- Include ~120 costs total (about 6 per project on average).

Dirty dataset requirements:
- At least 15% of projects must be clearly over budget (SUM(costs.amount) > projects.budget_amount).
- At least 10% of projects must have costs concentrated in the last 7 days of the dataset (create a visible “spike”).
- At least 20% of milestones must be delayed (actual_date later than planned_date).
- Some milestones must be in progress (actual_date = NULL).
- Make the data realistic: higher budgets tend to have higher costs, but include a few surprises.

Output requirements:
- Provide ONLY SQL (no explanations).
- Ensure all foreign keys reference existing ids.
- Use explicit ids (no autoincrement).