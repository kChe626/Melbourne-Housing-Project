# **Melbourne Housing Data Project — Python Cleaning, SQL Analysis & Power BI Dashboard**  
![Python](https://img.shields.io/badge/Python-3776AB.svg?style=for-the-badge&logo=Python&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

---

## **Overview**  
This project analyzes **Melbourne housing sales data** through Python data cleaning, SQL analysis, and an interactive Power BI dashboard.  
The goal is to clean raw housing data, extract market insights, and visualize key trends for property pricing and sales behavior.

---

## **Dataset**
- **Source:** [melb_data.csv](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Melbourne_housing_Dashboard/data/melb_data.csv)  
- **Columns:** suburb, address, rooms, type, price, date, distance, bedroom2, bathroom, car, landsize, buildingarea, yearbuilt, councilarea, regionname, method, seller_g, latitude, longitude, propertycount

---

## **Objectives**
- Standardize and clean the dataset for SQL compatibility  
- Explore market trends through SQL queries  
- Build a Power BI dashboard for interactive analysis  

---

## **Data Cleaning Process (Python)**
**Key Steps:**
- Standardized column names and text formatting  
- Converted `date` to proper datetime format  
- Converted numeric fields and filled missing values  
- Imputed `yearbuilt` with median year for missing entries  
- Removed duplicates and validated dataset

**Example Snippets:**  
```python
# Standardize column names
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')

# Convert date to datetime
df['date'] = pd.to_datetime(df['date'], format='%d/%m/%Y', errors='coerce')

# Fill missing yearbuilt with median
median_yearbuilt = df['yearbuilt'].median()
df['yearbuilt'] = pd.to_numeric(df['yearbuilt'], errors='coerce').fillna(median_yearbuilt)
```

**Full Cleaning Script:** [melb_data_cleaned.ipynb](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Melbourne_housing_Dashboard/scripts/melb_data_cleaned.ipynb)  
**Cleaned Dataset:** [melb_data_cleaned.xls](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Melbourne_housing_Dashboard/data/melb_data_cleaned.xls)

---

## **SQL Analysis**
**Objectives:**
- Identify suburbs with the highest average property prices  
- Compare average prices by property type  
- Track monthly sales volumes  
- Assess building area averages by council area

**Example Queries:**
```sql
-- Top 5 suburbs by average price
SELECT suburb, ROUND(AVG(price), 2) AS avg_price
FROM melb_data_cleaned
GROUP BY suburb
ORDER BY avg_price DESC
LIMIT 5;

-- Average building area by council area
SELECT councilarea, ROUND(AVG(buildingarea), 2) AS avg_building_area
FROM melb_data_cleaned
GROUP BY councilarea
ORDER BY avg_building_area DESC;
```

**Full Analysis Script:** [sql_melb_data.sql](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Melbourne_housing_Dashboard/scripts/sql_melb_data.sql)

---

## **Key Insights**
- Certain suburbs consistently have higher median prices than others  
- Houses generally have larger land sizes compared to units and townhouses  
- Sales volume shows seasonal fluctuations aligned with market cycles  
- Properties closer to the city center tend to have higher prices

---

## **Preview**
![Melbourne Housing Dashboard](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Melbourne_housing_Dashboard/image/Housing_Dashboard.gif)

---

## **Use Cases**
- **Real Estate Analysis:** Compare property values by region and type  
- **Urban Planning:** Assess land and building size distributions  
- **Investment Strategy:** Identify high-value suburbs and growth areas  
- **Market Monitoring:** Track housing sales trends over time

---

## **How to Open**
1. Download the Power BI dashboard: [Power_Bi_melb_data.pbix](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Melbourne_housing_Dashboard/scripts/melb_data_cleaned.ipynb)  
2. Open in Power BI Desktop  
3. Connect to the cleaned dataset: [melb_data_cleaned.xls](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Melbourne_housing_Dashboard/data/melb_data_cleaned.xls)  

---

## **Business Relevance**
This analysis supports real estate and municipal planning operations by highlighting regional pricing trends, sales cycles, and property characteristics. These insights assist in resource allocation, project prioritization, and urban development planning.

---

## **Files**
- [Python Cleaning Script](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Melbourne_housing_Dashboard/scripts/melb_data_cleaned.ipynb)
- [Cleaned Dataset](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Melbourne_housing_Dashboard/data/melb_data_cleaned.xls) 
- [SQL Analysis Script](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Melbourne_housing_Dashboard/scripts/sql_melb_data.sql)   
- [Power BI Dashboard](https://github.com/kChe626/Melbourne-Housing-Project/blob/main/Power_Bi_melb_data.pbix)


## Dataset Source

- Melbourne Housing dataset from [https://www.kaggle.com/datasets/dansbecker/melbourne-housing-snapshot/data]


