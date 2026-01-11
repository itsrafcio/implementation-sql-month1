# PM Questions (to be translated into SQL)

1. Which projects are over budget (total costs vs planned budget)?
2. Which projects have the highest total cost to date?
3. How many active projects does each customer have right now?
4. What is the distribution of project statuses (count per status)?
5. Which milestone types are most frequently delayed (count of delayed milestones per type)?
6. What is the average delay (days) per milestone type (planned vs actual)?
7. Which milestones are currently stuck (planned date passed, actual date is NULL)?
8. Which projects have the most stuck milestones (count per project)?
9. Do we see cost spikes close to go-live (costs close to target go-live date)?
10. What is the weekly trend of costs and milestone completions (sum/count per week)?

## PM logic notes
- Aggregates answer “how much / how many” and support prioritization.
- GROUP BY defines the decision unit (per customer / per project / per status).
- Counts indicate workload and bottlenecks; sums indicate burn and overruns.
- Averages hide outliers, so we also check MAX for worst-case impact.
- Trends (weekly) help spot spikes and creeping risk early.
