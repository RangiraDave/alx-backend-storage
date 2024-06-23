-- Script to create a view 'need_meeting' that lists all students who have a score below 80 (excluded)
-- and have not had a meeting in the last month.

-- Create the view need_meeting
CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80 AND (last_meeting IS NULL OR last_meeting < DATE_SUB(CURDATE(), INTERVAL 1 MONTH));
