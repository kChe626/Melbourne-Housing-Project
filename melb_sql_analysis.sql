-- What is the average price by council area (excluding outliers)?

SELECT 
    CouncilArea, 
    ROUND(AVG(Price), 2) AS avg_price
FROM 
    cleaned_melb_data
WHERE 
    is_outlier = 0
GROUP BY 
    CouncilArea
ORDER BY 
    avg_price DESC;

-- How does property size (land or building area) relate to price?

SELECT 
    Landsize, 
    BuildingArea, 
    Price
FROM 
    cleaned_melb_data
WHERE 
    is_outlier = 0
    AND Landsize IS NOT NULL
    AND BuildingArea IS NOT NULL
ORDER BY 
    Landsize DESC;

-- How did average price change by year or month?

SELECT 
    SUBSTRING(Date, 7, 4) AS SaleYear, 
    ROUND(AVG(Price), 2) AS avg_price
FROM 
    cleaned_melb_data
WHERE 
    is_outlier = 0
GROUP BY 
    SaleYear
ORDER BY 
    SaleYear;

-- What is the median price and typical property size by region?

SELECT 
    Regionname, 
    ROUND(AVG(Price), 2) AS avg_price, 
    ROUND(AVG(Landsize), 2) AS avg_landsize
FROM 
    cleaned_melb_data
WHERE 
    is_outlier = 0
GROUP BY 
    Regionname
ORDER BY 
    avg_price DESC;
    
-- Which councils or regions have the most high-end properties?

SELECT 
    CouncilArea, 
    COUNT(*) AS outlier_count
FROM 
    cleaned_melb_data
WHERE 
    is_outlier = 1
GROUP BY 
    CouncilArea
ORDER BY 
    outlier_count DESC;
    
-- Does having more car spots or rooms relate to higher price?

SELECT 
    Car, 
    ROUND(AVG(Price), 2) AS avg_price
FROM 
    cleaned_melb_data
WHERE 
    is_outlier = 0
GROUP BY 
    Car
ORDER BY 
    Car;

-- Identify where most properties are listed

SELECT 
    Suburb, 
    COUNT(*) AS listing_count
FROM 
    cleaned_melb_data
GROUP BY 
    Suburb
ORDER BY 
    listing_count DESC
LIMIT 10;

-- How do property prices and land sizes compare between properties built before 2000 and those built in 2000 or later

SELECT 
    CASE 
        WHEN YearBuilt < 2000 THEN 'Before 2000'
        ELSE '2000 and later'
    END AS build_period,
    ROUND(AVG(Price), 2) AS avg_price,
    ROUND(AVG(Landsize), 2) AS avg_landsize
FROM 
    cleaned_melb_data
WHERE 
    is_outlier = 0
AND 
    YearBuilt IS NOT NULL
GROUP BY 
    build_period;
