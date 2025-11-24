# Sales Performance & KPI Analysis (SQL)

## 📌 Overview
Analyzed 50,000+ rows of sales data to evaluate performance trends across product categories, regions, and sales representatives. Used advanced SQL (CTEs, window functions) to compute YoY growth, moving averages, and rankings.

## 🧰 Tools Used
- SQL  
- PostgreSQL/MySQL  
- Excel (data cleaning)  

## 🧩 Skills Demonstrated
- Window functions  
- CTEs  
- Sales KPI modeling  
- Trend analysis  
- Ranking and segmentation  

## 🧠 Example SQL Queries

### Top Performing Reps and YoY Regional Growth
```sql
SELECT rep_name,
       SUM(sales_amount) AS total_sales,
       RANK() OVER (ORDER BY SUM(sales_amount) DESC) AS sales_rank
FROM sales
GROUP BY rep_name;


WITH yearly AS (
  SELECT region,
         EXTRACT(YEAR FROM order_date) AS year,
         SUM(sales_amount) AS revenue
  FROM sales
  GROUP BY region, year
)
SELECT *,
       (revenue - LAG(revenue) OVER (PARTITION BY region ORDER BY year)) 
       / NULLIF(LAG(revenue) OVER (PARTITION BY region ORDER BY year), 0) AS yoy_growth
FROM yearly;
