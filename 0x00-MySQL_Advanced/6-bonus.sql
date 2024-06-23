-- Create the stored procedure AddBonus
DELIMITER //
CREATE PROCEDURE AddBonus(IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN
    -- Check if the project exists
    IF NOT EXISTS (SELECT id FROM projects WHERE name = project_name) THEN
        -- Create the project if it doesn't exist
        INSERT INTO projects (name) VALUES (project_name);
    END IF;
    
    -- Get the project id
    SET @project_id = (SELECT id FROM projects WHERE name = project_name);
    
    -- Add the bonus correction
    INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, @project_id, score);
END //
DELIMITER ;
