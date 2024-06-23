-- Script to create 'names' table.
-- Imports 'names.sql' dump.
-- Only the first letter of the name is indexed.

-- Create the index idx_name_first on the table names and the first letter of name
CREATE INDEX idx_name_first ON names(name(1));
