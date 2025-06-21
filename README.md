![Python](https://img.shields.io/badge/Python-3776AB.svg?style=for-the-badge&logo=Python&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

# Melbourne Housing Data Project

This project focuses on cleaning and preparing a real estate dataset of Melbourne housing sales. The objective was to apply data wrangling techniques using Python to prepare the data for SQL-based analysis and visualization. This process ensures clean, reliable, and SQL-compatible data for deeper analysis of housing market trends, pricing, and regional characteristics.


## Dataset

- Source: [Melbourne Housing dataset](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/melb_data.csv)
- Columns: Includes suburb, address, rooms, type, price, date, distance, bedroom2, bathroom, car, landsize, buildingarea, yearbuilt, councilarea, regionname, sellerg, method, latitude, longitude, and propertycount.

## Python Data Cleaning Steps

- Standardized column names: Converted all column names to lowercase and replaced spaces with underscores for consistency.
- Cleaned text fields: Lowercased and trimmed spaces in key text columns including suburb, seller_g, council_area, regionname, type, method, and address.
- Converted date: Parsed the date column to datetime format (%d/%m/%Y), handling invalid values safely.
- Converted numeric fields: Converted price, landsize, building_area, distance, car, bathroom, and bedroom2 to numeric types with missing or invalid values filled as 0.
- Handled missing yearbuilt: Filled missing yearbuilt values with the median year to retain meaningful historical data.
- Converted count fields: Converted bedroom2, bathroom, and car fields to integers for clean analysis of counts.
- Standardized addresses: Trimmed and lowercased address for consistency in grouping or geocoding.
- Removed duplicates: Dropped any exact duplicate rows to ensure data integrity.

## Example cleaning snippet
```sql
# Standardize column names
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')

# Convert date
df['date'] = pd.to_datetime(df['date'].astype(str).str.strip(), format='%d/%m/%Y', errors='coerce')

# Convert numeric fields
num_cols = ['price', 'landsize', 'building_area', 'distance', 'car', 'bathroom', 'bedroom2']
for col in num_cols:
    df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0)

# Handle yearbuilt
median_yearbuilt = df['yearbuilt'].median()
df['yearbuilt'] = pd.to_numeric(df['yearbuilt'], errors='coerce').fillna(median_yearbuilt)

# Convert counts to int
for col in ['bedroom2', 'bathroom', 'car']:
    df[col] = df[col].astype(int)
```
## Output
- A cleaned dataset saved as [melb_data_cleaned.csv](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/melb_data_cleaned.xls), ready for SQL loading and BI visualization.


- [See full cleaning code](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/melb_data_cleaned.ipynb)
---

##  SQL Analysis & Business Insights
Below are example SQL queries used to analyze the cleaned Melbourne housing data.

### Average Price by Region
Finds regions with the highest and lowest average property prices.
```sql
SELECT 
    Regionname, 
    ROUND(AVG(Price), 2) AS avg_price
FROM 
    cleaned_melb_data
GROUP BY 
    Regionname
ORDER BY 
    avg_price DESC;
```

### Top 10 Suburbs with the Highest Average Land Size
Identifies suburbs offering the largest properties on average.
```sql
SELECT 
    Suburb, 
    ROUND(AVG(Landsize), 2) AS avg_landsize
FROM 
    cleaned_melb_data
GROUP BY 
    Suburb
ORDER BY 
    avg_landsize DESC
LIMIT 10;
```

### Number of Properties Sold by Year
Tracks property sales volume over time.
```sql
SELECT 
    YEAR(Date) AS sale_year, 
    COUNT(*) AS total_sales
FROM 
    cleaned_melb_data
GROUP BY 
    sale_year
ORDER BY 
    sale_year;
```
- [See full SQL analysis queries](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/sql_melb_data.sql)
---
## Power BI Dashboard

![Dashboard](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Housing_Dashboard.gif)

### Key Features

KPI Cards: Displays total properties sold, average property price, maximum price, and total land size.

Interactive slicers: Filter data dynamically by year, region, property type, and suburb.

Charts and visuals:
- Bar chart: Average price by region
- Pie chart: Sales method distribution (with category, % and count)
- Line chart: Sales volume over time with forecast option
- Treemap: Top suburbs by total land size
- Scatter plot: Price vs distance from CBD, with trendline

---


## Files

[melb_data_cleaned — Python code for cleaning](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/melb_data_cleaned.ipynb)

[cleaned_melb_data — Cleaned and ready for SQL import.](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/cleaned_melb_data.csv)

[sql_melb_data — MySQL anaylsis](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/sql_melb_data.sql)

[Power_BI_dashboard](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Power_Bi_melb_data.pbix)

Dataset Source

- Melbourne Housing dataset from [https://www.kaggle.com/datasets/dansbecker/melbourne-housing-snapshot/data]

