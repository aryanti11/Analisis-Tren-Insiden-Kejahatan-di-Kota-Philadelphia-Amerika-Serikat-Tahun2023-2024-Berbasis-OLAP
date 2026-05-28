SELECT 
    dt.year,
    SUM(fc.total_incident) AS total_kejahatan
FROM fact_crime fc
JOIN dim_time dt
    ON fc.time_id = dt.time_id
GROUP BY dt.year
ORDER BY dt.year;

SELECT 
    dc.crime_description,
    SUM(fc.total_incident) AS total_kejahatan
FROM fact_crime fc
JOIN dim_crime dc
    ON fc.crime_id = dc.crime_id
GROUP BY dc.crime_description
ORDER BY total_kejahatan DESC
LIMIT 10;

SELECT 
    dd.dc_dist,
    SUM(fc.total_incident) AS total_kejahatan
FROM fact_crime fc
JOIN dim_district dd
    ON fc.district_id = dd.district_id
GROUP BY dd.dc_dist
ORDER BY total_kejahatan DESC;