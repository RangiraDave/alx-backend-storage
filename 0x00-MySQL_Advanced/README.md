# MySQL Advanced: From Tables to Views

This project focuses on enhancing your MySQL skills by guiding you through tasks that involve tables with constraints, creating functions and procedures, optimizing queries using indexes, and working with views.


## Learning Resources:
## Learning Resources:
- [MySQL cheatsheet](https://devhints.io/mysql)
- [MySQL Performance: How To Leverage MySQL Database Indexing](https://www.digitalocean.com/community/tutorials/mysql-indexing-for-performance)
- [Stored Procedure](https://dev.mysql.com/doc/refman/5.7/en/stored-programs-defining.html)
- [Triggers](https://dev.mysql.com/doc/refman/5.7/en/triggers.html)
- [Views](https://dev.mysql.com/doc/refman/5.7/en/views.html)
- [Functions and Operators](https://dev.mysql.com/doc/refman/5.7/en/functions.html)
- [Trigger Syntax and Examples](https://dev.mysql.com/doc/refman/5.7/en/trigger-syntax.html)
- [CREATE TABLE Statement](https://dev.mysql.com/doc/refman/5.7/en/create-table.html)
- [CREATE PROCEDURE and CREATE FUNCTION Statements](https://dev.mysql.com/doc/refman/5.7/en/create-procedure.html)
- [CREATE INDEX Statement](https://dev.mysql.com/doc/refman/5.7/en/create-index.html)
- [CREATE VIEW Statement](https://dev.mysql.com/doc/refman/5.7/en/create-view.html)



## Learning Objectives

By the end of this project, you should be able to:

- Tables with Constraints:
    - Create tables with essential attributes like primary keys, unique constraints, and foreign keys.
    - Ensure data integrity through these constraints.
- Stored Procedures and Functions:
    - Implement stored procedures to group frequently used SQL statements.
    - Create functions to perform calculations or manipulations within queries.
- Views:
    - Develop views to simplify complex queries and improve code maintainability.
    - Utilize views to present specific data sets to applications.
- Indexes:
    - Strategically create indexes to optimize query performance.
    - Understand the impact of indexes on data insertion and modification.
- Triggers:
    - (This section is not covered in the provided tasks, but can be an optional addition)
    - Automate specific actions within the database based on events like inserts, updates, or deletes.


## Requirements

Comments for your SQL file:

```bash
$ cat my_script.sql
-- 3 first students in the Batch ID=3
-- because Batch 3 is the best!
SELECT id, name FROM students WHERE batch_id = 3 ORDER BY created_at DESC LIMIT 3;
$
```

Use "container-on-demand" to run MySQL:

- Ask for container Ubuntu 18.04 - Python 3.7
- Connect via SSH or via the WebTerminal
- In the container, start MySQL before playing with it:

```bash
$ service mysql start
 * MySQL Community Server 5.7.30 is started
$
$ cat 0-list_databases.sql | mysql -uroot -p my_database
Enter password: 
Database
information_schema
mysql
performance_schema
sys
$
```

In the container, credentials are root/root.

How to import a SQL dump:

```bash
$ echo "CREATE DATABASE hbtn_0d_tvshows;" | mysql -uroot -p
Enter password: 
$ curl "https://s3.amazonaws.com/intranet-projects-files/holbertonschool-higher-level_programming+/274/hbtn_0d_tvshows.sql" -s | mysql -uroot -p hbtn_0d_tvshows
Enter password: 
$ echo "SELECT * FROM tv_genres" | mysql -uroot -p hbtn_0d_tvshows
Enter password: 
id  name
1   Drama
2   Mystery
3   Adventure
4   Fantasy
5   Comedy
6   Crime
7   Suspense
8   Thriller
```

Make sure to follow these instructions to set up and work with MySQL effectively.

- Database: MySQL 5.7 (version 5.7.30)
- Development Environment:
    - Ubuntu 18.04 LTS
    - Python 3.7 (not strictly required, but may be helpful for some users)
- Access:
    - SSH access to a server running the specified environment.
    - Alternatively, a local MySQL installation can be used.

## Tasks

The project consists of several tasks that gradually increase in complexity. Each task provides a description of what needs to be accomplished and includes relevant SQL scripts.

1. Unique Users: Create a table named users with attributes for id, email (unique), and name.
2. Country Users: Modify the users table to include a country attribute with a predefined set of options (US, CO, TN).
3. Old School Band: Analyze a provided table (metal_bands.sql) and rank bands based on their longevity (years active).
4. Buy Buy Buy: Simulate a store scenario using triggers. Create a trigger that reduces item quantity after adding a new order.
5. Email Validation Trigger: Implement a trigger to maintain data integrity by resetting the valid_email attribute only when the email address actually changes.
6. Add Bonus (Optional): Develop a stored procedure named AddBonus that allows adding new corrections for students, including user ID, project name, and score.
7. Average Score (Optional): Create a stored procedure named ComputeAverageScoreForUser to calculate and store the average score for each student.
8. Optimize Simple Search: Enhance search performance by creating an index on the first letter of names in a provided table (names.sql).
9. Optimize Search and Score: Further optimize search within the names table by creating an index that covers both the first letter of the name and the score.
10. Safe Divide: Create a function named SafeDiv that performs division, returning either the result or 0 if the divisor is zero.
11. No Table for a Meeting (Optional): Develop a view named need_meeting to list students with scores below 80 and no recent meeting (or a meeting more than a month ago).

## Repo

All SQL scripts and relevant files should be uploaded to a GitHub repository.

## Additional Notes

- Make sure to start the MySQL service before running any scripts (service mysql start).
- Use comments to explain your code and improve readability.
- Feel free to explore the provided resources to enhance your understanding of the concepts covered in this project.



## HappyCoding!