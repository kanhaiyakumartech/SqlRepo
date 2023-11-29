----1)	create a table named sales_data with columns: product_id, sale_date, and quantity_sold. ---
CREATE TABLE sales_data (
    product_id INT,
    sale_date DATE,
    quantity_sold INT
);
---2.Now we have to insert the given data --
INSERT INTO sales_data  VALUES
(1, '2022-01-01', 20),
(2, '2022-01-01', 15),
(1, '2022-01-02', 10),
(2, '2022-01-02', 25),
(1, '2022-01-03', 30),
(2, '2022-01-03', 18),
(1, '2022-01-04', 12),
(2, '2022-01-04', 22);
----here i verify our data is insert or not in table --
select *
from sales_data;
---3. assign rank by partition based on product_id and in each product id find the lowest sold quantity---
SELECT product_id,sale_date,quantity_sold,
    RANK() OVER (PARTITION BY product_id ORDER BY quantity_sold) AS rank_within_product,
    MIN(quantity_sold) OVER (PARTITION BY product_id) AS lowest_sold_quantity
FROM sales_data;
-----  3: Retrieve value from a previous row and the next row
SELECT
    product_id,
    sale_date,
    quantity_sold,
    LAG(quantity_sold) OVER (ORDER BY sale_date) AS previous_quantity,
    LEAD(quantity_sold) OVER (ORDER BY sale_date) AS next_quantity
FROM sales_data;
------- Step 4: Return the first and last values in an ordered set

-- Step 4: Return the first and last values in an ordered set
SELECT
    product_id,
    FIRST_VALUE(sale_date) OVER (PARTITION BY product_id ORDER BY sale_date) AS first_sale_date,
    LAST_VALUE(sale_date) OVER (PARTITION BY product_id ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_sale_date
FROM sales_data
GROUP BY product_id;


