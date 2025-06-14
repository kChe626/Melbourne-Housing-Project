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

## Data Cleaning Steps

The following steps were applied using Python (Pandas):

### Missing values

    Car: Filled missing values with 0 assuming no car space.

    BuildingArea: Filled missing values using median area by Rooms, fallback to overall median for rare room counts.

    YearBuilt: Left as NULL to avoid introducing bias — ensures age-related analysis remains accurate.

    CouncilArea: Filled missing values with "Unknown" for SQL-friendly grouping and filtering.

### Data type conversions

    Date: Converted to datetime, then reformatted to mm/dd/yyyy string for consistency.

    Postcode, Propertycount, Car, Rooms, Price, Bedroom2, Bathroom: Converted to integers for accuracy.

    YearBuilt: Left as float to retain NULL values (as Pandas requires float for NaN).
--- 


### Duplicates

    Checked and confirmed no duplicate rows in the dataset.

### Outlier flagging

    Flagged outliers in Price, Landsize, and BuildingArea if values exceeded the 99th percentile.

    Added an is_outlier column (1 = outlier, 0 = typical data).

### Export

    Final cleaned dataset saved as cleaned_melb_data.xlsx (Excel format for ease of use).

[See full cleaning code](Melbourne_Housing_Cleaning.ipynb)
---

##  SQL Analysis & Business Insights
Below are example SQL queries used to analyze the cleaned Melbourne housing data.

### What is the average price by council area (excluding outliers)?
```sql
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
```

### How did average price change by year or month?

```sql
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
```

- [See full SQL analysis queries](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Melbourne%20Housing.ipynb)


## Tools Used

    Python (Pandas, Jupyter)

    Excel (for data export)

    SQL (planned: PostgreSQL / MySQL / SQLite)

## Files

    cleaned_melb_data.xlsx — Cleaned and ready for SQL import.

## Key Takeaways

    Applied best practices in data cleaning with clear, justifiable steps.

    Retained data integrity by thoughtfully handling missing values and outliers.

    Prepared dataset for flexible, reliable SQL analysis.

## Author

- Melbourne Housing dataset from [https://www.kaggle.com/datasets/dansbecker/melbourne-housing-snapshot/data
]

