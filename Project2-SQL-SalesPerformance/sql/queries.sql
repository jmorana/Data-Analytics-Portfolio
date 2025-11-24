-- Top performing reps
SELECT
    rep_name,
    SUM(sales_amount) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales_amount) DESC) AS sales_rank
FROM sales
GROUP BY rep_name;

-- Monthly sales trend with moving average
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales_amount) AS monthly_revenue,
    AVG(SUM(sales_amount)) OVER (
        ORDER BY DATE_TRUNC('month', order_date)
    ) AS moving_avg
FROM sales
GROUP BY month
ORDER BY month;

-- YoY regional growth
WITH yearly AS (
    SELECT
        region,
        EXTRACT(YEAR FROM order_date) AS year,
        SUM(sales_amount) AS revenue
    FROM sales
    GROUP BY region, year
)
SELECT
    *,
    (revenue - LAG(revenue) OVER (PARTITION BY region ORDER BY year)) /
    NULLIF(LAG(revenue) OVER (PARTITION BY region ORDER BY year), 0)
    AS yoy_growth
FROM yearly;
