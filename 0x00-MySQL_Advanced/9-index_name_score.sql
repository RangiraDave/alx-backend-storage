-- Script to create 'names' table.
-- Imports 'names.sql' dump.
-- Indexes the first letter of the name and the first letter of the score.

CREATE INDEX idx_name_first_score ON names (LEFT(name, 1), score);
