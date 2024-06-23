-- Create a new table users with the following structure:
-- id, email, name, country
-- id: integer, primary key, autoincrement
-- email: string(255), unique and not null
-- name: string(255)
-- country: enum('US', 'CO', 'TN'), not null, default 'US'
-- Never fail if the table already exists
-- Can be executed on any database

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255),
    country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);
