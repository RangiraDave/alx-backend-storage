-- Script to create 'corrections' table.
-- Procedure 'ComputeAverageScoreForUser' that computes the average score for a user.

-- Create the stored procedure
DELIMITER //
CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score FLOAT;
    DECLARE total_projects INT;
    DECLARE average_score FLOAT;
    
    -- Compute the total score for the user
    SELECT SUM(score) INTO total_score
    FROM corrections
    WHERE user_id = user_id;
    
    -- Compute the total number of projects for the user
    SELECT COUNT(*) INTO total_projects
    FROM corrections
    WHERE user_id = user_id;
    
    -- Compute the average score
    SET average_score = total_score / total_projects;
    
    -- Update the average score for the user
    UPDATE users
    SET average_score = average_score
    WHERE id = user_id;
END //
DELIMITER ;
