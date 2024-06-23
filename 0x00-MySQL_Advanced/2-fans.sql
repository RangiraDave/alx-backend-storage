-- Import the metal_bands table dump
-- Assuming the table name is 'metal_bands'

-- Create a temporary table to store the aggregated results
CREATE origin, SUM(fans) AS total_fans
FROM metal_bands
GROUP BY origin
ORDER BY total_fans DESC;
