# Melbourne Housing Data Cleaning Project

## Project Purpose

The purpose of this project is to clean and prepare the Melbourne Housing Market dataset for further analysis and SQL-based querying. This step-by-step cleaning pipeline ensures the dataset is free from missing values, type inconsistencies, and structural anomalies. It prepares the data for tasks like exploratory data analysis (EDA), feature engineering, or machine learning.

---

## Skills Used

- Data Cleaning
- Data Type Conversion
- Missing Value Imputation
- Feature Engineering
- Logical Validation
- CSV Exporting

---

##  Tools Used

- Python
- pandas
- Jupyter Notebook
- Excel (for verification)

---

## Process Summary

### 1. Convert Data Types
- `Date` converted from string to `datetime64`
- `Postcode` converted from float to string

### 2. Handle Missing Values
- `Car`: Filled missing values with median (`2.0`)
- `CouncilArea`: Filled with mode (most common value)
- Dropped `BuildingArea` and `YearBuilt` due to excessive missing values

### 3. Rename Columns for Clarity
- Renamed `Bedroom2` to `Bedrooms`

### 4. Flag Logical Inconsistencies
- Created `room_bedroom_mismatch` column where `Rooms < Bedrooms`

---

## 📤 Final Output

- Cleaned dataset saved as: `cleaned_melbourne_data.csv`
- All missing values handled
- Data structure suitable for SQL or machine learning

---

## 📂 File Overview

| File Name | Description |
|-----------|-------------|
| `cleaned_melbourne_data.csv` | Final cleaned dataset |
| `melbourne_cleaning.ipynb` | Notebook with full cleaning process |
| `README.md` | Project overview |

---

## ✍️ Author
https://www.kaggle.com/datasets/dansbecker/melbourne-housing-snapshot/data

