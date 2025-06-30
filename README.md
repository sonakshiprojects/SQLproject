# SQL-Based Sales & Customer Analytics Project

## 📌 Project Objective
The goal is to derive actionable insights about customer behavior, product performance, and market distribution, complemented by a Power BI dashboard for visual representation.

---

## 🧩 Dataset Description
The project uses four datasets:
- **dcustomers.csv** –  Dimensional customer data (demographics)
- **rcustomers.csv** – Customer behavioral metrics
- **dproducts.csv** – Dimensional product data
- **rproducts.csv** – Product performance metrics

---

## 📁 Project Structure

- `data_cleaning.sql` – Data preprocessing: NULL checks, removal of 'n/a', standardizing missing values
- `customer_analysis.sql` – Customer purchase behavior and demographic insights
- `customer_demographics.sql` – Gender, country, age group, marital status breakdowns
- `customer_rfm.sql` – RFM segmentation based on recency, frequency, monetary value
- `product_analysis.sql` – Total sales, top-selling products, and quantity distribution
- `product_performance.sql` – Product segment revenue, launch trends
- `productvscustomers.sql` – Correlation of customer segments and product usage
- `time_based_analysis.sql` – Temporal trends in customer onboarding and product launches

---

## 🧽 Data Cleaning Performed
- Removed or filtered rows where:
  - Columns had `NULL`, `N/A`, `n/a`, `unknown`, `missing`, etc.
- Ensured gender, country, and marital status values are valid
- Removed unrealistic ages and invalid negative values
- Removed entries with blank numeric values (like Age)

---

## 📊 Key Insights

- There are more Male customers than Female, but Female customers contributed more to total sales.
- Majority of customers are from the United States, followed by Australia and the United Kingdom.
- Most customers created accounts in 2026, showing a recent rise in customer acquisition.
- Married customers slightly outnumber single customers, indicating mature demographics.
- Customers aged 50 and above contribute the highest total quantity purchased and average order value.
- High-value customers are mostly associated with the 'New' customer segment, indicating recent engagement.
- The 'Bikes' category dominates total sales, with the Mountain-200 series being the top-selling product.
- Road Bikes are the most preferred subcategory for older age groups (50+), contributing significantly to revenue.
- Product launches peaked in 2013, showing the company’s expansion strategy.
- VIP and Regular segments have strong overlap with High-Performer product segments.

---

## 📈 Dashboard Highlights (Power BI)
- 5 interactive pages:
  1. **Customer Demographics**
  2. **Customer RFM & Segments**
  3. **Product Performance**
  4. **Product–Customer Correlation**
  5. **Insights**
- Filterable visuals by gender, segment, category, and country
- KPIs for total sales, average revenue, customer count
- Final panel summarizing project insights and author details

---

## 🛠 Tools Used
- **SQL Server Management Studio (SSMS)** – Data querying & cleaning
- **Power BI** – Dashboard and visual insights
- **VS Code** – SQL file management & project structure

---

## ✅ Summary
This project emphasizes SQL proficiency in data analysis contexts by focusing on real-world business questions such as customer value, product trends, and performance over time. Visualizations support the analysis but are secondary to SQL logic and insights.

---

## 👤 Author
**Name**: Sonakshi Kumar  
**GitHub**: [github.com/sonakshiprojects](https://github.com/sonakshiprojects)  

