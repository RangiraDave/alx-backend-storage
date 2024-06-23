-- Script to create a stored procedure ComputeAverageWeightedScoreForUsers
-- that computes the average weighted score for all users.
-- Doesn't take any iinput parameter.

DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE total_score FLOAT;
    DECLARE total_weight INT;
    DECLARE avg_score FLOAT;
    
    -- Calculate average weighted score for each user
    FOR EACH ROW IN (SELECT id FROM users) DO
        SET total_score = 0;
        SET total_weight = 0;
        
        -- Calculate total score and weight for each user
        FOR EACH ROW IN (SELECT project_id, score FROM corrections WHERE user_id = ROW.id) DO
            SET total_score = total_score + (ROW.score * (SELECT weight FROM projects WHERE id = ROW.project_id));
            SET total_weight = total_weight + (SELECT weight FROM projects WHERE id = ROW.project_id);
        END FOR;
        
        -- Calculate average weighted score
        SET avg_score = total_score / total_weight;
        
        -- Update average_score column for the user
        UPDATE users SET average_score = avg_score WHERE id = ROW.id;
    END FOR;
END //

DELIMITER ;
