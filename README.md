![Python](https://img.shields.io/badge/Python-3776AB.svg?style=for-the-badge&logo=Python&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

# Melbourne Housing Data Cleaning Project

This project focuses on cleaning and preparing a real estate dataset of Melbourne housing sales. The objective was to apply data wrangling techniques using Python to prepare the data for SQL-based analysis and visualization. This process ensures clean, reliable, and SQL-compatible data for deeper analysis of housing market trends, pricing, and regional characteristics.

---


## Dataset

    Source: Melbourne housing dataset

    Rows: 13,580

    Columns: 21

The dataset includes information about property sales such as suburb, address, number of rooms, type, price, sale method, seller, date of sale, distance from the city, postcode, number of bedrooms and bathrooms, car spaces, land size, building area, year built, council area, latitude, longitude, region name, and property count.


---

## Python Data Cleaning Steps

### Remove unnecessary columns

Removed columns that don’t contribute to analysis or have excessive missing data.
```python
df_cleaned = df.drop(columns=["Address"])
df_cleaned = df_cleaned.drop(columns=["BuildingArea", "YearBuilt"])
```

### Handle missing data
Filled or removed missing values to clean the dataset.
```pyhton
# Fill missing 'Car' values with 0
df_cleaned["Car"] = df_cleaned["Car"].fillna(0)

# Drop rows where 'CouncilArea' is missing
df_cleaned = df_cleaned.dropna(subset=["CouncilArea"])
```

### Convert data types
Ensured columns have appropriate data types for analysis.
```python
# Convert 'Date' to datetime
df_cleaned["Date"] = pd.to_datetime(df_cleaned["Date"], format="%d/%m/%Y")

# Convert 'Postcode' and 'Propertycount' to integer
df["Postcode"] = df["Postcode"].astype(int)
df["Propertycount"] = df["Propertycount"].astype(int)
```
### Reset index
```python
df_cleaned = df_cleaned.reset_index(drop=True)
```

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



## Files

    cleaned_melb_data.xlsx — Cleaned and ready for SQL import.


## Author

- Melbourne Housing dataset from [https://www.kaggle.com/datasets/dansbecker/melbourne-housing-snapshot/data
]

