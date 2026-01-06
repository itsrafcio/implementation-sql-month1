# SQLBolt – Lessons 1–2 Notes

## Lesson 1 – SELECT basics
Focus: selecting data from a single table.

Key concepts:
- SELECT defines what data we want to see
- FROM defines the data source
- Using specific columns improves clarity

Example queries:
SELECT * FROM movies;
SELECT title, year FROM movies;
SELECT director FROM movies;

PM insight:
Clear SELECT statements = clear questions to the data.

## Lesson 2 – Filtering with WHERE
Focus: narrowing data based on conditions.

Key concepts:
- WHERE filters rows
- AND / OR combine business conditions
- LIKE helps when data is not perfectly structured

Example queries:
SELECT * FROM movies WHERE year > 2000;
SELECT title FROM movies WHERE director = 'Christopher Nolan';
SELECT title FROM movies WHERE title LIKE '%Toy%';

PM insight:
WHERE clauses represent decision rules and risk filters.