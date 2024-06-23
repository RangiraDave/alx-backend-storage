-- Script to create a function SafeDiv
-- that divides (x / y) and returns 0 if y is 0.
-- The function must be named SafeDiv
-- The function must take 2 arguments: a (INT) and b (INT)
-- The function must return a FLOAT
-- The function must return 0 if b is equal to 0

DELIMITER //

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
BEGIN
    IF b = 0 THEN
        RETURN 0;
    ELSE
        RETURN a / b;
    END IF;
END //

DELIMITER ;
