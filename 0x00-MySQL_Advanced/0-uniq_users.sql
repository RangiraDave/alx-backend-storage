-- Script to create 'users' table with the following requirements:
-- Attriutes:
-- 1. id: integer, primary key, autoincrement
-- 2. email: string(255), unique and not null
-- 3. name: string(255)
-- Never fail if the table already exists
-- Can be executed  on any database

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255)
);
