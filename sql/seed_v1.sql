-- seed_v1.sql
-- Implementation Tracker - Seed v1
-- Minimal dataset for analysis


INSERT INTO customers (id, name, country, segment) VALUES
(1, 'Acme Logistics', 'DE', 'Mid-Market'),
(2, 'Nordic Retail Group', 'DK', 'Enterprise'),
(3, 'BluePeak Manufacturing', 'PL', 'SMB'),
(4, 'Helios FinTech', 'UK', 'Enterprise'),
(5, 'Arctic Energy Services', 'NO', 'Mid-Market');


INSERT INTO projects (id, customer_id, name, start_date, target_go_live_date, status, budget_amount) VALUES
(1, 1, 'Implementation A', '2026-01-02', '2026-02-15', 'In Progress', 60000),
(2, 1, 'Implementation B', '2026-01-06', '2026-03-01', 'Planned',     45000),

(3, 2, 'Implementation A', '2025-12-10', '2026-01-31', 'In Progress', 90000),
(4, 2, 'Implementation B', '2026-01-08', '2026-03-10', 'Planned',     70000),

(5, 3, 'Implementation A', '2026-01-03', '2026-02-20', 'In Progress', 30000),
(6, 3, 'Implementation B', '2026-01-12', '2026-03-05', 'Planned',     25000),

(7, 4, 'Implementation A', '2025-12-20', '2026-02-10', 'In Progress', 110000),
(8, 4, 'Implementation B', '2026-01-05', '2026-03-15', 'Planned',     80000),

(9, 5, 'Implementation A', '2026-01-04', '2026-02-28', 'In Progress', 50000),
(10,5, 'Implementation B', '2026-01-15', '2026-03-20', 'Planned',     40000);


INSERT INTO milestones (id, project_id, type, planned_date, actual_date, status) VALUES
(1,  1, 'Kickoff',     '2026-01-03', '2026-01-05', 'Done'),
(2,  1, 'Discovery',   '2026-01-10', NULL,         'In Progress'),

(3,  2, 'Kickoff',     '2026-01-07', NULL,         'Planned'),
(4,  2, 'Discovery',   '2026-01-14', NULL,         'Planned'),

(5,  3, 'Kickoff',     '2025-12-12', '2025-12-12', 'Done'),
(6,  3, 'Integration', '2026-01-10', NULL,         'In Progress'),

(7,  4, 'Kickoff',     '2026-01-10', NULL,         'Planned'),
(8,  4, 'Discovery',   '2026-01-20', NULL,         'Planned'),

(9,  5, 'Kickoff',     '2026-01-04', '2026-01-06', 'Done'),
(10, 5, 'Build',       '2026-01-18', NULL,         'In Progress'),

(11, 6, 'Kickoff',     '2026-01-13', NULL,         'Planned'),
(12, 6, 'Discovery',   '2026-01-22', NULL,         'Planned'),

(13, 7, 'Kickoff',     '2025-12-22', '2025-12-22', 'Done'),
(14, 7, 'UAT',         '2026-01-25', NULL,         'In Progress'),

(15, 8, 'Kickoff',     '2026-01-06', NULL,         'Planned'),
(16, 8, 'Discovery',   '2026-01-16', NULL,         'Planned'),

(17, 9, 'Kickoff',     '2026-01-05', '2026-01-05', 'Done'),
(18, 9, 'Integration', '2026-01-19', NULL,         'In Progress'),

(19, 10,'Kickoff',     '2026-01-16', NULL,         'Planned'),
(20, 10,'Discovery',   '2026-01-24', NULL,         'Planned');


INSERT INTO costs (id, project_id, cost_date, category, amount, currency) VALUES
(1,  1, '2026-01-03', 'Vendor',   25000, 'EUR'),
(2,  1, '2026-01-10', 'Internal', 22000, 'EUR'),
(3,  1, '2026-01-18', 'Infra',    18000, 'EUR'),

(4,  2, '2026-01-08', 'Vendor',   12000, 'EUR'),
(5,  2, '2026-01-15', 'Internal',  9000, 'EUR'),
(6,  2, '2026-01-22', 'Travel',    2000, 'EUR'),

(7,  3, '2025-12-12', 'Vendor',   30000, 'EUR'),
(8,  3, '2026-01-05', 'Internal', 16000, 'EUR'),
(9,  3, '2026-01-12', 'Support',   4000, 'EUR'),

(10, 4, '2026-01-10', 'Vendor',   18000, 'EUR'),
(11, 4, '2026-01-20', 'Internal', 14000, 'EUR'),
(12, 4, '2026-01-28', 'Infra',     5000, 'EUR'),

(13, 5, '2026-01-04', 'Vendor',    8000, 'EUR'),
(14, 5, '2026-01-12', 'Internal',  7000, 'EUR'),
(15, 5, '2026-01-20', 'Support',   2000, 'EUR'),

(16, 6, '2026-01-13', 'Vendor',    6000, 'EUR'),
(17, 6, '2026-01-22', 'Internal',  6500, 'EUR'),
(18, 6, '2026-01-29', 'Infra',     1500, 'EUR'),

(19, 7, '2025-12-22', 'Vendor',   50000, 'EUR'),
(20, 7, '2026-01-08', 'Internal', 42000, 'EUR'),
(21, 7, '2026-01-25', 'Infra',    22000, 'EUR'),

(22, 8, '2026-01-06', 'Vendor',   20000, 'EUR'),
(23, 8, '2026-01-16', 'Internal', 15000, 'EUR'),
(24, 8, '2026-01-26', 'Travel',    3000, 'EUR'),

(25, 9, '2026-01-05', 'Vendor',   14000, 'EUR'),
(26, 9, '2026-01-14', 'Internal', 11000, 'EUR'),
(27, 9, '2026-01-21', 'Support',   2500, 'EUR'),

(28,10, '2026-01-16', 'Vendor',   10000, 'EUR'),
(29,10, '2026-01-24', 'Internal',  9000, 'EUR'),
(30,10, '2026-01-30', 'Infra',     2000, 'EUR');
