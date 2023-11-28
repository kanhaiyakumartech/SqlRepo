CREATE TABLE gold_member_users
(
userid INT PRIMARY KEY ,
user_name VARCHAR(20) NOT NULL,
signup_date VARCHAR(20) NOT NULL,
);
SELECT* 
from gold_member_users;

insert into gold_member_users values (1,'JOHN','09-22-2017');
insert into gold_member_users values(2,'Mary','04-21-2017');
select*
from gold_member_users;

CREATE TABLE users
(
userid int PRIMARY KEY NOT NULL,
user_name varchar(20) not null,
signup_date VARCHAR(20) NOT NULL,
);
select *
from users;
INSERT INTO users VALUES(1,'JOhn','09-22-2017');
INSERT INTO users VALUES(2,'Michel','01-15-2015');
INSERT INTO users VALUES(3,'Mary','04-11-2014');
select * from users;
CREATE TABLE sales(
userid int PRIMARY KEY NOT NULL,
user_name VARCHAR(20) NOT NULL,
created_date VARCHAR(20) NOT NULL,
product_id int 
);
select *
from sales;
INSERT INTO sales VALUES
(1,'John','04-19-2017',2),
(2,'Mary','12-18-2019',1);
select * from sales;
Insert into sales VALUES(3,'Michel','07-20-2020',3);
Insert into sales VALUES(4,'John','10-23-2019',2);
Insert into sales VALUES(5,'John','03-19-2018',3);
Insert into sales VALUES(6,'Mary','12-20-2016',2);
Insert into sales VALUES(7,'John','11-09-2016',1 ),
                         (8,'John','05-20-2016',3), 
                          (9,'Michel','09-24-2017',1), 
                          (10,'John','03-11-2017',2), 
                           (11,'John','03-11-2016',1),
                            (12,'Mary','11-10-2016',1),
                             (13,'Mary','12-07-2017',2);
select* from sales;
--table-4---
CREATE TABLE product
(
product_id int ,
product_name VARCHAR(20),
price decimal(10,2)
);
select * from product;
insert into product values
(1,'Mobile',980), 
(2,'Ipad',870), 
(3,'Laptop',330);

select * from product;
---To show all Tables we use ---
select *
from INFORMATION_SCHEMA.TABLES;

-- Count all the records of all four tables using a single query
SELECT
    table_name,
    record_count
FROM (
    SELECT 'gold_member_users' AS table_name, COUNT(*) AS record_count FROM gold_member_users
    UNION ALL
    SELECT 'users' AS table_name, COUNT(*) AS record_count FROM users
    UNION ALL
    SELECT 'sales' AS table_name, COUNT(*) AS record_count FROM sales
    UNION ALL
    SELECT 'product' AS table_name, COUNT(*) AS record_count FROM product
) AS counts;

select*
from product;
-----What is the total amount each customer spent on ecommerce company----
SELECT
    s.userid,
    SUM(p.price) AS total_amount_spent
FROM
    sales s
JOIN
    product p ON s.product_id = p.product_id
GROUP BY
    s.userid;
	----7.Find the distinct dates of each customer visited the website:
SELECT DISTINCT userid, created_date
FROM sales;
-- 8. Find the first product purchased by each customer using 3 tables(users, sales, product)
SELECT u.userid, MIN(p.product_name) AS first_product_purchased
FROM users u
JOIN sales s ON u.userid = s.userid
JOIN product p ON s.product_id = p.product_id
GROUP BY u.userid;
-- 9. What is the most purchased item of each customer and how many times the customer has purchased it
SELECT userid, product_name, COUNT(*) AS item_count
FROM sales s
JOIN product p ON s.product_id = p.product_id
GROUP BY userid, product_name;
-- 10. Find out the customer who is not the gold_member_user
SELECT u.userid
FROM users u
WHERE NOT EXISTS (
    SELECT 1 
    FROM gold_member_users gm 
    WHERE gm.userid = u.userid
);
-- 11. What is the amount spent by each customer when he was the gold_member user
SELECT u.userid, SUM(p.price) AS total_amount_spent
FROM gold_member_users u
JOIN sales s ON u.userid = s.userid
JOIN product p ON s.product_id = p.product_id
GROUP BY u.userid;
-- 12. Find the Customers' names whose name starts with M
select USER_NAME
from users
where user_name like'M%';
-- 13. Find the Distinct customer Id of each customer
select distinct userid
from users;
-- 14. Change the Column name from product table as price_value from price
EXEC sp_rename 'product.price', 'price_value', 'COLUMN';
select *
from product;
-- 15. Change the Column value product_name – Ipad to Iphone from product table
UPDATE product
SET product_name = 'Iphone'
WHERE product_name = 'Ipad';
select *
from product;
-- 16. Change the table name of gold_member_users to gold_membership_users
EXEC sp_rename 'gold_member_users', 'gold_membership_users';
-- 17. Create a new column as Status in the table created above gold_membership_users
-- The Status values should be 2 Yes and No if the user is a gold member, then status should be Yes else No.
-- Begin the transaction
BEGIN TRANSACTION;
DELETE FROM users WHERE userid = 1;
ROLLBACK;
-- 19. Insert one more record as the same (3,'Laptop',330) as the product table
INSERT INTO product (product_id, product_name,price_value) VALUES 
(3, 'Laptop', 330);
select *
from product
-- 20. Write a query to find the duplicates in the product table
SELECT product_name, COUNT(*)
FROM product
GROUP BY product_name
HAVING COUNT(*) > 1;

