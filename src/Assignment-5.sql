----First I am Creating a table and insert data
CREATE TABLE email_signup (
    id INT,
    email_id VARCHAR(50),
    signup_date DATE
);

-- Now I am going to Insert the  data
INSERT INTO email_signup  VALUES
(1, 'Rajesh@Gmail.com', '2022-02-01'),
(2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'),
(3, 'Hitest@Gmail.com', '2020-09-08'),
(4, 'Salil@Gmmail.com', '2019-07-05'),
(5, 'Himanshu@Yahoo.com', '2023-05-09'),
(6, 'Hitesh@Twitter.com', '2015-01-01'),
(7, 'Rakesh@facebook.com', null);

----Here I verify our Table--
select *
from email_signup;
---Here I write a query to find latest gmail account--
select distinct email_id
from email_signup;
---here i replace the Null values by Given data --
update email_signup
set signup_date ='1970-01-01'
where id =7;

-- Step 2: Write a query
SELECT 
    COUNT(CASE WHEN email_id LIKE '%@gmail.com' THEN 1 END) AS count_gmail_account,
    MAX(signup_date) AS latest_signup_date,
    MIN(signup_date) AS first_signup_date,
    DATEDIFF(DAY, MIN(signup_date), MAX(signup_date)) AS diff_in_days
FROM email_signup
WHERE email_id LIKE '%@gmail.com';




