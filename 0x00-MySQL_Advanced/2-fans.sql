-- Import the metal_bands table dump
-- Assuming the table name is 'metal_bands'

-- Create a temporary table to store the aggregated results
CREATE TEMPORARY TABLE temp_band_fans AS
SELECT origin, COUNT(*) AS nb_fans
FROM metal_bands
GROUP BY origin;

-- Rank the country origins of bands by the number of fans
SELECT origin, nb_fans
FROM temp_band_fans
ORDER BY nb_fans DESC;
