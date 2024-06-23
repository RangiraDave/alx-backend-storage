-- SQL script that lists all bands with Glam rock as their main style,
-- ranked by their longevity.
-- The lifespan of a band is the difference between
-- the current year and the year they were formed.
-- The bands should be listed from the longest lifespan to the shortest.
-- The output should be band_name and lifespan.

SELECT band_name, (2022 - formed) AS lifespan
FROM metal_bands
WHERE main_style = 'Glam rock'
ORDER BY lifespan DESC;
