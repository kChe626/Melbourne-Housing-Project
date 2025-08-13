-- Melbourne Housing SQL Queries
-- Description: Business analysis on Melbourne Housing cleaned dataset

-- Top 5 suburbs by average price
SELECT 
    suburb,
    ROUND(AVG(price), 2) AS avg_price
FROM melb_data_cleaned
GROUP BY suburb
ORDER BY avg_price DESC
LIMIT 5;

-- Average price by property type
SELECT 
    type,
    ROUND(AVG(price), 2) AS avg_price
FROM melb_data_cleaned
GROUP BY type
ORDER BY avg_price DESC;

-- Average building area by council area
SELECT 
    councilarea,
    ROUND(AVG(buildingarea), 2) AS avg_building_area
FROM melb_data_cleaned
GROUP BY councilarea
ORDER BY avg_building_area DESC;

-- Sales count by method
SELECT 
    method,
    COUNT(*) AS sales_count
FROM melb_data_cleaned
GROUP BY method
ORDER BY sales_count DESC;

-- Top 5 council areas by total sales revenue
SELECT 
    councilarea,
    ROUND(SUM(price), 2) AS total_revenue
FROM melb_data_cleaned
GROUP BY councilarea
ORDER BY total_revenue DESC
LIMIT 5;

-- Average land size by property type
SELECT 
    type,
    ROUND(AVG(landsize), 2) AS avg_landsize
FROM melb_data_cleaned
GROUP BY type
ORDER BY avg_landsize DESC;


-- Top 5 sellers (agents) by number of properties sold
SELECT 
    sellerg,
    COUNT(*) AS properties_sold
FROM melb_data_cleaned
GROUP BY sellerg
ORDER BY properties_sold DESC
LIMIT 5;


-- Day of week sales count
SELECT 
    DAYNAME(date) AS day_of_week,
    COUNT(*) AS sales_count
FROM melb_data_cleaned
GROUP BY day_of_week
ORDER BY sales_count DESC;

