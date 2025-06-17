--- Average price by region
SELECT Regionname, ROUND(AVG(Price), 2) AS avg_price
FROM cleaned_melb_data
GROUP BY Regionname
ORDER BY avg_price DESC;

--- Average price by property type
SELECT Type, ROUND(AVG(Price), 2) AS avg_price
FROM cleaned_melb_data
GROUP BY Type
ORDER BY avg_price DESC;

--- Top 10 suburbs with the highest average land size
SELECT Suburb, ROUND(AVG(Landsize), 2) AS avg_landsize
FROM cleaned_melb_data
GROUP BY Suburb
ORDER BY avg_landsize DESC
LIMIT 10;

---  Number of properties sold by year
SELECT YEAR(Date) AS sale_year, COUNT(*) AS total_sales
FROM cleaned_melb_data
GROUP BY sale_year
ORDER BY sale_year;

--- Sales count by method
SELECT Method, COUNT(*) AS method_count
FROM cleaned_melb_data
GROUP BY Method
ORDER BY method_count DESC;

--- Average number of car spaces by region
SELECT Regionname, ROUND(AVG(Car), 2) AS avg_car_spaces
FROM cleaned_melb_data
GROUP BY Regionname
ORDER BY avg_car_spaces DESC;

--- Price vs distance from the city
SELECT ROUND(Distance, 1) AS distance_km, ROUND(AVG(Price), 2) AS avg_price
FROM cleaned_melb_data
GROUP BY distance_km
ORDER BY distance_km;

--- Suburbs with the highest maximum price
SELECT Suburb, MAX(Price) AS max_price
FROM cleaned_melb_data
GROUP BY Suburb
ORDER BY max_price DESC
LIMIT 10;

--- Average bathroom count by property type
SELECT Type, ROUND(AVG(Bathroom), 2) AS avg_bathrooms
FROM cleaned_melb_data
GROUP BY Type
ORDER BY avg_bathrooms DESC;

--- Average land size by property type and region
SELECT Regionname, Type, ROUND(AVG(Landsize), 2) AS avg_landsize
FROM cleaned_melb_data
GROUP BY Regionname, Type
ORDER BY avg_landsize DESC;

