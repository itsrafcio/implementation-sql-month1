-- seed_v2.sql
-- Implementation Tracker - Seed v2 (dirty dataset)
-- Reference date for "last 7 days": 2026-01-22
-- Currency: EUR everywhere

PRAGMA foreign_keys = ON;

INSERT INTO customers (id, name, country, segment) VALUES
(1, 'Acme Logistics', 'DE', 'Mid-Market'),
(2, 'Nordic Retail Group', 'DK', 'Enterprise'),
(3, 'BluePeak Manufacturing', 'PL', 'SMB'),
(4, 'Helios FinTech', 'UK', 'Enterprise'),
(5, 'Arctic Energy Services', 'NO', 'Mid-Market'),
(6, 'Solara Health Systems', 'SE', 'Enterprise'),
(7, 'Vistula E-Commerce', 'PL', 'Mid-Market'),
(8, 'RheinMobility GmbH', 'DE', 'SMB'),
(9, 'Atlas Construction Group', 'NL', 'Enterprise');

-- 20 projects
-- Over budget projects (exactly 3): project_id 7, 14, 19  (sum(costs) > budget_amount)
-- Cost spike last 7 days projects (exactly 2): project_id 8, 15 (costs concentrated 2026-01-15..2026-01-21)

INSERT INTO projects (id, customer_id, name, start_date, target_go_live_date, status, budget_amount) VALUES
(1,  1, 'Implementation A', '2025-12-18', '2026-02-10', 'In Progress', 60000),
(2,  1, 'Implementation B', '2026-01-04', '2026-03-01', 'In Progress', 45000),

(3,  2, 'Implementation A', '2025-11-25', '2026-01-20', 'Done',        90000),
(4,  2, 'Implementation B', '2026-01-06', '2026-03-10', 'In Progress', 70000),

(5,  3, 'Implementation A', '2025-12-30', '2026-02-20', 'In Progress', 32000),
(6,  3, 'Implementation B', '2026-01-12', '2026-03-05', 'Planned',     25000),

(7,  4, 'Implementation A', '2025-12-15', '2026-02-12', 'In Progress', 80000), -- over budget
(8,  4, 'Implementation B', '2026-01-02', '2026-03-15', 'In Progress', 70000), -- spike last 7 days

(9,  5, 'Implementation A', '2025-12-28', '2026-02-28', 'Blocked',     50000),
(10, 5, 'Implementation B', '2026-01-08', '2026-03-20', 'In Progress', 40000),

(11, 6, 'Implementation A', '2025-11-30', '2026-01-25', 'Done',        65000),
(12, 6, 'Implementation B', '2026-01-05', '2026-03-08', 'In Progress', 55000),

(13, 7, 'Implementation A', '2025-12-22', '2026-02-18', 'In Progress', 48000),
(14, 7, 'Implementation B', '2026-01-03', '2026-03-02', 'Blocked',     45000), -- over budget

(15, 8, 'Implementation A', '2026-01-01', '2026-02-25', 'In Progress', 55000), -- spike last 7 days
(16, 8, 'Implementation B', '2026-01-18', '2026-03-25', 'Planned',     38000),

(17, 9, 'Implementation A', '2025-11-20', '2026-01-18', 'Done',        72000),
(18, 9, 'Implementation B', '2025-12-26', '2026-02-22', 'In Progress', 60000),
(19, 9, 'Implementation C', '2026-01-07', '2026-03-12', 'In Progress', 60000), -- over budget
(20, 9, 'Implementation D', '2026-01-10', '2026-03-18', 'In Progress', 52000);

-- 60 milestones (3 per project)
-- Delays: at least 12 milestones have actual_date > planned_date (deliberately seeded)
-- Many NULL actual_date = in progress / planned / blocked (for "stuck" later)

INSERT INTO milestones (id, project_id, type, planned_date, actual_date, status) VALUES
-- Project 1 (In Progress)
(1,  1, 'Kickoff',     '2025-12-19', '2025-12-21', 'Done'),          -- delayed (2d)
(2,  1, 'Discovery',   '2026-01-05', NULL,         'In Progress'),   -- potentially stuck
(3,  1, 'Build',       '2026-01-20', NULL,         'Planned'),

-- Project 2 (In Progress)
(4,  2, 'Kickoff',     '2026-01-05', '2026-01-07', 'Done'),          -- delayed
(5,  2, 'Discovery',   '2026-01-12', NULL,         'In Progress'),
(6,  2, 'Integration', '2026-01-26', NULL,         'Planned'),

-- Project 3 (Done)
(7,  3, 'Kickoff',     '2025-11-26', '2025-11-26', 'Done'),
(8,  3, 'UAT',         '2026-01-05', '2026-01-06', 'Done'),          -- delayed
(9,  3, 'Go-Live',     '2026-01-18', '2026-01-18', 'Done'),

-- Project 4 (In Progress)
(10, 4, 'Kickoff',     '2026-01-07', '2026-01-09', 'Done'),          -- delayed
(11, 4, 'Discovery',   '2026-01-14', NULL,         'In Progress'),
(12, 4, 'Build',       '2026-01-28', NULL,         'Planned'),

-- Project 5 (In Progress)
(13, 5, 'Kickoff',     '2026-01-02', '2026-01-03', 'Done'),          -- delayed (1d)
(14, 5, 'Discovery',   '2026-01-10', NULL,         'In Progress'),
(15, 5, 'Integration', '2026-01-24', NULL,         'Planned'),

-- Project 6 (Planned)
(16, 6, 'Kickoff',     '2026-01-22', NULL,         'Planned'),
(17, 6, 'Discovery',   '2026-01-29', NULL,         'Planned'),
(18, 6, 'Build',       '2026-02-10', NULL,         'Planned'),

-- Project 7 (In Progress) - over budget
(19, 7, 'Kickoff',     '2025-12-16', '2025-12-18', 'Done'),          -- delayed
(20, 7, 'Integration', '2026-01-08', NULL,         'In Progress'),
(21, 7, 'UAT',         '2026-01-22', NULL,         'Planned'),

-- Project 8 (In Progress) - spike last 7 days
(22, 8, 'Kickoff',     '2026-01-03', '2026-01-06', 'Done'),          -- delayed
(23, 8, 'Discovery',   '2026-01-09', NULL,         'In Progress'),
(24, 8, 'UAT',         '2026-01-19', NULL,         'In Progress'),   -- planned date in spike window

-- Project 9 (Blocked)
(25, 9, 'Kickoff',     '2025-12-29', '2025-12-29', 'Done'),
(26, 9, 'Discovery',   '2026-01-10', NULL,         'Blocked'),       -- blocked, overdue vs ref date
(27, 9, 'Build',       '2026-01-24', NULL,         'Planned'),

-- Project 10 (In Progress)
(28, 10,'Kickoff',     '2026-01-09', '2026-01-10', 'Done'),          -- delayed (1d)
(29, 10,'Discovery',   '2026-01-16', NULL,         'In Progress'),
(30, 10,'Integration', '2026-01-30', NULL,         'Planned'),

-- Project 11 (Done)
(31, 11,'Kickoff',     '2025-12-01', '2025-12-01', 'Done'),
(32, 11,'UAT',         '2026-01-10', '2026-01-11', 'Done'),          -- delayed
(33, 11,'Go-Live',     '2026-01-22', '2026-01-22', 'Done'),

-- Project 12 (In Progress)
(34, 12,'Kickoff',     '2026-01-06', '2026-01-08', 'Done'),          -- delayed
(35, 12,'Discovery',   '2026-01-13', NULL,         'In Progress'),
(36, 12,'Build',       '2026-01-27', NULL,         'Planned'),

-- Project 13 (In Progress)
(37, 13,'Kickoff',     '2025-12-23', '2025-12-26', 'Done'),          -- delayed
(38, 13,'Integration', '2026-01-12', NULL,         'In Progress'),
(39, 13,'UAT',         '2026-01-26', NULL,         'Planned'),

-- Project 14 (Blocked) - over budget
(40, 14,'Kickoff',     '2026-01-04', '2026-01-06', 'Done'),          -- delayed
(41, 14,'Discovery',   '2026-01-11', NULL,         'Blocked'),
(42, 14,'Build',       '2026-01-25', NULL,         'Planned'),

-- Project 15 (In Progress) - spike last 7 days
(43, 15,'Kickoff',     '2026-01-02', '2026-01-04', 'Done'),          -- delayed
(44, 15,'Discovery',   '2026-01-10', NULL,         'In Progress'),
(45, 15,'Go-Live',     '2026-02-24', NULL,         'Planned'),

-- Project 16 (Planned)
(46, 16,'Kickoff',     '2026-01-25', NULL,         'Planned'),
(47, 16,'Discovery',   '2026-02-02', NULL,         'Planned'),
(48, 16,'Integration', '2026-02-18', NULL,         'Planned'),

-- Project 17 (Done)
(49, 17,'Kickoff',     '2025-11-22', '2025-11-22', 'Done'),
(50, 17,'UAT',         '2026-01-07', '2026-01-09', 'Done'),          -- delayed
(51, 17,'Go-Live',     '2026-01-16', '2026-01-16', 'Done'),

-- Project 18 (In Progress)
(52, 18,'Kickoff',     '2025-12-27', '2025-12-29', 'Done'),          -- delayed
(53, 18,'Discovery',   '2026-01-08', NULL,         'In Progress'),
(54, 18,'Integration', '2026-01-21', NULL,         'In Progress'),   -- right on ref date

-- Project 19 (In Progress) - over budget
(55, 19,'Kickoff',     '2026-01-08', '2026-01-10', 'Done'),          -- delayed
(56, 19,'Build',       '2026-01-18', NULL,         'In Progress'),
(57, 19,'UAT',         '2026-01-29', NULL,         'Planned'),

-- Project 20 (In Progress)
(58, 20,'Kickoff',     '2026-01-11', '2026-01-12', 'Done'),          -- delayed
(59, 20,'Discovery',   '2026-01-19', NULL,         'In Progress'),
(60, 20,'Build',       '2026-02-02', NULL,         'Planned');

-- 120 costs (6 per project)

INSERT INTO costs (id, project_id, cost_date, category, amount, currency) VALUES
-- Project 1 (budget 60000) sum=53500
(1,   1, '2025-12-20', 'Vendor',   14000, 'EUR'),
(2,   1, '2026-01-05', 'Internal', 12000, 'EUR'),
(3,   1, '2026-01-12', 'Infra',     8500, 'EUR'),
(4,   1, '2026-01-17', 'Support',   6000, 'EUR'),
(5,   1, '2026-01-19', 'Travel',    1500, 'EUR'),
(6,   1, '2026-01-21', 'Internal', 11500, 'EUR'),

-- Project 2 (budget 45000) sum=39200
(7,   2, '2026-01-06', 'Vendor',   11000, 'EUR'),
(8,   2, '2026-01-10', 'Internal',  9000, 'EUR'),
(9,   2, '2026-01-14', 'Infra',     5200, 'EUR'),
(10,  2, '2026-01-18', 'Support',   4200, 'EUR'),
(11,  2, '2026-01-20', 'Travel',    1800, 'EUR'),
(12,  2, '2026-01-23', 'Internal',  8000, 'EUR'),

-- Project 3 (Done) (budget 90000) sum=81200
(13,  3, '2025-11-26', 'Vendor',   30000, 'EUR'),
(14,  3, '2025-12-05', 'Internal', 18000, 'EUR'),
(15,  3, '2025-12-18', 'Infra',     9500, 'EUR'),
(16,  3, '2026-01-06', 'Support',   6200, 'EUR'),
(17,  3, '2026-01-10', 'Travel',    2500, 'EUR'),
(18,  3, '2026-01-15', 'Internal', 15000, 'EUR'),

-- Project 4 (budget 70000) sum=56600
(19,  4, '2026-01-08', 'Vendor',   20000, 'EUR'),
(20,  4, '2026-01-12', 'Internal', 12000, 'EUR'),
(21,  4, '2026-01-16', 'Infra',     7000, 'EUR'),
(22,  4, '2026-01-20', 'Support',   5600, 'EUR'),
(23,  4, '2026-01-22', 'Travel',    2000, 'EUR'),
(24,  4, '2026-01-26', 'Internal', 10000, 'EUR'),

-- Project 5 (budget 32000) sum=28600
(25,  5, '2026-01-03', 'Vendor',    9000, 'EUR'),
(26,  5, '2026-01-08', 'Internal',  7500, 'EUR'),
(27,  5, '2026-01-12', 'Support',   2600, 'EUR'),
(28,  5, '2026-01-15', 'Infra',     4200, 'EUR'),
(29,  5, '2026-01-18', 'Travel',    1200, 'EUR'),
(30,  5, '2026-01-21', 'Internal',  8100, 'EUR'),

-- Project 6 (Planned) (budget 25000) sum=3200 (light pre-costs)
(31,  6, '2026-01-12', 'Vendor',    1200, 'EUR'),
(32,  6, '2026-01-14', 'Internal',   800, 'EUR'),
(33,  6, '2026-01-16', 'Support',    400, 'EUR'),
(34,  6, '2026-01-18', 'Infra',      300, 'EUR'),
(35,  6, '2026-01-20', 'Travel',     200, 'EUR'),
(36,  6, '2026-01-21', 'Internal',   300, 'EUR'),

-- Project 7 (over budget) (budget 80000) sum=98000
(37,  7, '2025-12-18', 'Vendor',   42000, 'EUR'),
(38,  7, '2026-01-08', 'Internal', 18000, 'EUR'),
(39,  7, '2026-01-12', 'Infra',    12000, 'EUR'),
(40,  7, '2026-01-16', 'Support',   8000, 'EUR'),
(41,  7, '2026-01-19', 'Travel',    2000, 'EUR'),
(42,  7, '2026-01-21', 'Internal', 16000, 'EUR'),

-- Project 8 (spike last 7 days) (budget 70000) sum=48700
(43,  8, '2026-01-05', 'Internal',  1700, 'EUR'),
(44,  8, '2026-01-15', 'Vendor',   14000, 'EUR'),
(45,  8, '2026-01-16', 'Internal',  9000, 'EUR'),
(46,  8, '2026-01-17', 'Infra',     6200, 'EUR'),
(47,  8, '2026-01-19', 'Support',   5200, 'EUR'),
(48,  8, '2026-01-21', 'Vendor',   12600, 'EUR'),

-- Project 9 (Blocked) (budget 50000) sum=33200
(49,  9, '2025-12-29', 'Vendor',   16000, 'EUR'),
(50,  9, '2026-01-06', 'Internal',  9000, 'EUR'),
(51,  9, '2026-01-10', 'Support',   3200, 'EUR'),
(52,  9, '2026-01-14', 'Infra',     3800, 'EUR'),
(53,  9, '2026-01-18', 'Travel',     700, 'EUR'),
(54,  9, '2026-01-20', 'Internal',   500, 'EUR'),

-- Project 10 (budget 40000) sum=35100
(55, 10, '2026-01-09', 'Vendor',   13000, 'EUR'),
(56, 10, '2026-01-12', 'Internal',  9000, 'EUR'),
(57, 10, '2026-01-16', 'Infra',     5200, 'EUR'),
(58, 10, '2026-01-20', 'Support',   4100, 'EUR'),
(59, 10, '2026-01-22', 'Travel',    1200, 'EUR'),
(60, 10, '2026-01-25', 'Internal',  7600, 'EUR'),

-- Project 11 (Done) (budget 65000) sum=60400
(61, 11, '2025-12-01', 'Vendor',   22000, 'EUR'),
(62, 11, '2025-12-12', 'Internal', 16000, 'EUR'),
(63, 11, '2025-12-28', 'Infra',     7200, 'EUR'),
(64, 11, '2026-01-10', 'Support',   5200, 'EUR'),
(65, 11, '2026-01-14', 'Travel',    1500, 'EUR'),
(66, 11, '2026-01-18', 'Internal',  8500, 'EUR'),

-- Project 12 (budget 55000) sum=43200
(67, 12, '2026-01-06', 'Vendor',   16000, 'EUR'),
(68, 12, '2026-01-10', 'Internal', 11000, 'EUR'),
(69, 12, '2026-01-14', 'Infra',     6400, 'EUR'),
(70, 12, '2026-01-18', 'Support',   3800, 'EUR'),
(71, 12, '2026-01-20', 'Travel',     900, 'EUR'),
(72, 12, '2026-01-23', 'Internal',  4100, 'EUR'),

-- Project 13 (budget 48000) sum=41400
(73, 13, '2025-12-26', 'Vendor',   15000, 'EUR'),
(74, 13, '2026-01-04', 'Internal',  9000, 'EUR'),
(75, 13, '2026-01-10', 'Support',   3400, 'EUR'),
(76, 13, '2026-01-13', 'Infra',     5600, 'EUR'),
(77, 13, '2026-01-17', 'Travel',    1100, 'EUR'),
(78, 13, '2026-01-21', 'Internal',  7300, 'EUR'),

-- Project 14 (over budget, Blocked) (budget 45000) sum=52000
(79, 14, '2026-01-06', 'Vendor',   21000, 'EUR'),
(80, 14, '2026-01-10', 'Internal', 12000, 'EUR'),
(81, 14, '2026-01-14', 'Infra',     7000, 'EUR'),
(82, 14, '2026-01-16', 'Support',   6000, 'EUR'),
(83, 14, '2026-01-18', 'Travel',    1000, 'EUR'),
(84, 14, '2026-01-20', 'Internal',  5000, 'EUR'),

-- Project 15 (spike last 7 days) (budget 55000) sum=43300
(85, 15, '2026-01-07', 'Internal',  1800, 'EUR'),
(86, 15, '2026-01-15', 'Vendor',   12000, 'EUR'),
(87, 15, '2026-01-16', 'Internal',  8200, 'EUR'),
(88, 15, '2026-01-18', 'Infra',     6100, 'EUR'),
(89, 15, '2026-01-20', 'Support',   5200, 'EUR'),
(90, 15, '2026-01-21', 'Vendor',   10000, 'EUR'),

-- Project 16 (Planned) (budget 38000) sum=2800
(91, 16, '2026-01-18', 'Vendor',    1200, 'EUR'),
(92, 16, '2026-01-19', 'Internal',   700, 'EUR'),
(93, 16, '2026-01-20', 'Support',    400, 'EUR'),
(94, 16, '2026-01-21', 'Infra',      300, 'EUR'),
(95, 16, '2026-01-22', 'Travel',     200, 'EUR'),
(96, 16, '2026-01-23', 'Internal',   0,   'EUR'),

-- Project 17 (Done) (budget 72000) sum=66800
(97, 17, '2025-11-22', 'Vendor',   26000, 'EUR'),
(98, 17, '2025-12-03', 'Internal', 17000, 'EUR'),
(99, 17, '2025-12-20', 'Infra',     8800, 'EUR'),
(100,17, '2026-01-09', 'Support',   5200, 'EUR'),
(101,17, '2026-01-12', 'Travel',    1600, 'EUR'),
(102,17, '2026-01-16', 'Internal',  8200, 'EUR'),

-- Project 18 (budget 60000) sum=49700
(103,18, '2025-12-29', 'Vendor',   18000, 'EUR'),
(104,18, '2026-01-06', 'Internal', 14000, 'EUR'),
(105,18, '2026-01-10', 'Infra',     7600, 'EUR'),
(106,18, '2026-01-14', 'Support',   4300, 'EUR'),
(107,18, '2026-01-18', 'Travel',    1100, 'EUR'),
(108,18, '2026-01-21', 'Internal',  4700, 'EUR'),

-- Project 19 (over budget) (budget 60000) sum=72000
(109,19, '2026-01-10', 'Vendor',   28000, 'EUR'),
(110,19, '2026-01-12', 'Internal', 14000, 'EUR'),
(111,19, '2026-01-16', 'Infra',     9000, 'EUR'),
(112,19, '2026-01-18', 'Support',   7000, 'EUR'),
(113,19, '2026-01-20', 'Travel',    1000, 'EUR'),
(114,19, '2026-01-21', 'Vendor',   13000, 'EUR'),

-- Project 20 (budget 52000) sum=40600
(115,20, '2026-01-12', 'Vendor',   14000, 'EUR'),
(116,20, '2026-01-15', 'Internal',  9800, 'EUR'),
(117,20, '2026-01-19', 'Infra',     6200, 'EUR'),
(118,20, '2026-01-21', 'Support',   3500, 'EUR'),
(119,20, '2026-01-24', 'Travel',     900, 'EUR'),
(120,20, '2026-01-27', 'Internal',  6200, 'EUR');