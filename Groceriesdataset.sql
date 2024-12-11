create database Groceries_dataset;
use groceries_dataset;
show tables;
-- show fist 10 rows from the table 
select * from groceries_dataset limit 10;
-- how many records are there in table?
select count(*) from groceries_dataset;

/*what are the min, max, avg item description for
 the groceries*/
select 
round(min(itemdescription), 2) as min_itemdescription,
round(max(itemdescription), 2) as max_itemdescription,
round(avg(itemdescription), 2) as avg_itemdescription
from groceries_dataset;

 -- what is the distribution of itemdesription for the groceries?
SELECT itemDescription, COUNT(*) AS item_count
FROM groceries_dataset
GROUP BY itemDescription;

SELECT itemDescription, COUNT(*) AS item_count
FROM groceries_dataset
GROUP BY itemDescription
HAVING COUNT(*) > 100;

###like operator--
SELECT * 
FROM groceries_dataset
WHERE itemDescription LIKE '%milk%';
###logical operators (AND)#
SELECT * 
FROM groceries_dataset
WHERE itemDescription LIKE '%milk%' AND Date > '01-01-2015';

#order by#
SELECT itemDescription, COUNT(*) AS item_count
FROM groceries_dataset
GROUP BY itemDescription
ORDER BY item_count DESC;

###control flow function####
SELECT itemDescription,
    CASE 
        WHEN itemDescription LIKE '%milk%' THEN 'Dairy'
        WHEN itemDescription LIKE '%fruit%' THEN 'Fruit'
        WHEN itemDescription LIKE '%vegetables%' THEN 'Vegetable'
        ELSE 'Other'
    END AS category
FROM groceries_dataset;
##combining both control flow and CTEs
WITH PurchaseCount AS (
    SELECT Member_number, COUNT(*) AS purchase_count
    FROM groceries_dataset
    GROUP BY Member_number
)
SELECT Member_number, purchase_count
FROM PurchaseCount
WHERE purchase_count > 50;


WITH CategorizedItems AS (
    SELECT itemDescription,
        CASE 
            WHEN itemDescription LIKE '%milk%' THEN 'Dairy'
            WHEN itemDescription LIKE '%fruit%' THEN 'Fruit'
            WHEN itemDescription LIKE '%vegetables%' THEN 'Vegetable'
            ELSE 'Other'
        END AS category
    FROM groceries_dataset
)
SELECT category, COUNT(*) AS total_items
FROM CategorizedItems
GROUP BY category;


