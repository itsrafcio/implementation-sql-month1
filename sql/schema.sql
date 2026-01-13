-- schema.sql
-- Implementation Tracker - Month 1
-- SQLite

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    country TEXT,
    segment TEXT
);

CREATE TABLE projects (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    start_date TEXT,
    target_go_live_date TEXT,
    status TEXT,
    budget_amount REAL,

    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE milestones (
    id INTEGER PRIMARY KEY,
    project_id INTEGER NOT NULL,
    type TEXT,
    planned_date TEXT,
    actual_date TEXT,
    status TEXT,

    FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE costs (
    id INTEGER PRIMARY KEY,
    project_id INTEGER NOT NULL,
    cost_date TEXT,
    category TEXT,
    amount REAL,
    currency TEXT,

    FOREIGN KEY (project_id) REFERENCES projects(id)
);
