-- Create a stored procedure ComputeAverageWeightedScoreForUser.
-- The procedure computes and updates the average_score for a given user_id
-- Takes 1 parameter:
-- user_id INT

-- Create the stored procedure
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE total_score FLOAT;
    DECLARE total_weight FLOAT;
    DECLARE weighted_average FLOAT;
    
    -- Calculate the total score and total weight for the user
    SELECT SUM(c.score * p.weight) INTO total_score, SUM(p.weight) INTO total_weight
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;
    
    -- Calculate the weighted average score
    SET weighted_average = total_score / total_weight;
    
    -- Update the average_score column for the user
    UPDATE users SET average_score = weighted_average WHERE id = user_id;
END $$
DELIMITER ;
