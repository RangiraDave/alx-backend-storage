-- Script to create 'names' table.
-- Imports 'names.sql' dump.
-- Indexes the first letter of the name and the first letter of the score.

-- Import the table dump
cat names.sql | mysql -uroot -p holberton

-- Create the index
CREATE INDEX idx_name_first_score ON names (LEFT(name, 1), LEFT(score, 1));

-- Verify the index
SHOW INDEX FROM names;

-- Perform a query using the index
SELECT COUNT(name) FROM names WHERE name LIKE 'a%' AND score < 80;
