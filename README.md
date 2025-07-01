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
```python
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

##  SQL Analysis Process
The cleaned Melbourne housing dataset was loaded into a SQL database for structured querying and deeper analysis. SQL was used to generate key business insights on housing trends, prices, and characteristics.

## Key analyses performed
- Top suburbs by median price: Identified suburbs with the highest median house prices.
- Average price by property type: Compared average prices for different property types (e.g., house, unit, townhouse).
- Monthly sales volume: Tracked how many properties were sold per month to uncover seasonal trends.
- Average building area by council area: Assessed which council areas tend to have larger or smaller properties.

[See full analysis code SQL](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/sql_melb_data.sql)

## Example SQL snippet
```sql
-- Top 5 suburbs by average price
SELECT 
    suburb,
    ROUND(AVG(price), 2) AS avg_price
FROM melb_data_cleaned
GROUP BY suburb
ORDER BY avg_price DESC
LIMIT 5;

-- Average building area by council area
SELECT 
    councilarea,
    ROUND(AVG(buildingarea), 2) AS avg_building_area
FROM melb_data_cleaned
GROUP BY councilarea
ORDER BY avg_building_area DESC;
```
## Output
- The queries provided clear insights into housing prices, regional differences, and market behavior.
- The results formed the basis for Power BI dashboards that visualized these patterns interactively.

## Power BI Dashboard

An interactive Power BI dashboard was developed to visualize key insights from the Melbourne housing dataset. The dashboard integrates data cleaned and prepared through Python and SQL analysis to provide a clear view of the housing market trends.

![Dashboard](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Housing_Dashboard.gif)

## Key Features

- Total sales, average price, maximum price, and sum of land size indicators at a glance.
- Average price by region using bar charts to compare housing costs across regions.
- Sales trends over time with a line chart showing total sales by year, quarter, month, and day.
- Sales method distribution with a pie chart highlighting the proportion of sales methods (e.g., auction, private sale).
- Sum of land size by suburb with a treemap for quick comparison of land distribution across suburbs.
- Price vs. distance scatter plot showing how price varies with distance from the city center, colored by region and method.

- [See full dashboard](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Power_Bi_melb_data.pbix)
  
## Files

[melb_data_cleaned — Python code for cleaning](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/melb_data_cleaned.ipynb)

[cleaned_melb_data — Cleaned and ready for SQL import.](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/melb_data_cleaned.xls)

[sql_melb_data — MySQL anaylsis](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/sql_melb_data.sql)

[Power_BI_dashboard](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Power_Bi_melb_data.pbix)

## Dataset Source

- Melbourne Housing dataset from [https://www.kaggle.com/datasets/dansbecker/melbourne-housing-snapshot/data]

