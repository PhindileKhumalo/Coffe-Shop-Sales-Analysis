
-- TO check all the column names in my data
-- To check the data types in my data 

SELECT *
FROM CASESTUDY.BRIGHT_COFFEE.SHOP
LIMIT 10 ;


-- Check categorical columnns

SELECT  DISTINCT store_location
FROM CASESTUDY.BRIGHT_COFFEE.SHOP;

SELECT DISTINCT product_category
FROM CASESTUDY.BRIGHT_COFFEE.SHOP;


SELECT DISTINCT product_type
FROM CASESTUDY.BRIGHT_COFFEE.SHOP;


SELECT DISTINCT product_detail
FROM CASESTUDY.BRIGHTLEARN.COFFE_SHOP;




SELECT MIN(transaction_date) AS first_operating_date
FROM CASESTUDY.BRIGHT_COFFEE.SHOP;

SELECT MAX(transaction_date) AS last_operating_date
FROM CASESTUDY.BRIGHT_COFFEE.SHOP;

SELECT MIN ( transaction_time) AS opening_hour
FROM CASESTUDY.BRIGHT_COFFEE.SHOP;


SELECT MAX ( transaction_time) AS closing_hour
FROM CASESTUDY.BRIGHT_COFFEE.SHOP;


----- Date and Time functions
SELECT transaction_date,
    DAYNAME(transaction_date) AS day_name, 
    CASE 
        WHEN day_name IN ('Sun','Sat') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_classification,
    MONTHNAME(transaction_date) AS month_name,
    
    -- transaction_time,
    
        CASE
            WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
            WHEN transaction_time BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
            WHEN transaction_time >='18:00:00' THEN 'Evening'
        END AS time_bucket,
   HOUR(transaction_time) AS hour_of_day,

   ------ categorical data ____
   store_location,
   product_category,
   product_detail,
   product_type,
   -- unit_price,
   -- transaction_qty,

   ----IDs
   COUNT (DISTINCT transaction_id) AS number_of_sales,

   -- Revenue Calculations

SUM (transaction_qty * unit_price )AS revenue
FROM CASESTUDY.BRIGHT_COFFEE.SHOP
GROUP BY ALL;






