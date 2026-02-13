-- --- PROJECT SQL QUERIES ---

1. Revenue by Location (Which states are making us rich?)
SELECT location, SUM(purchase_amount_usd) as total_revenue
FROM customers
GROUP BY location
ORDER BY total_revenue DESC
LIMIT 10;


2. Most Popular Items by Gender
SELECT gender, item_purchased, COUNT(*) as count
FROM customers
GROUP BY gender, item_purchased
ORDER BY count DESC
LIMIT 10;

3.Average Rating per Category (Quality Check)
SELECT category, ROUND(AVG(review_rating), 2) as avg_rating
FROM customers
GROUP BY category
ORDER BY avg_rating DESC;

4.High-Value "Whale" Customers
Customers who have made more than 40 previous purchases and spend above the average to indentify VIP marketing list
SELECT customer_id, location, previous_purchases, purchase_amount_usd
FROM customers
WHERE previous_purchases > 40 
  AND purchase_amount_usd > (SELECT AVG(purchase_amount_usd) FROM customers)
ORDER BY previous_purchases DESC;

5.Seasonal Revenue Performance
To indentify the season that makes most cash
SELECT season, 
       COUNT(*) as total_orders, 
       SUM(purchase_amount_usd) as total_revenue,
       ROUND(AVG(purchase_amount_usd), 2) as avg_order_value
FROM customers
GROUP BY season
ORDER BY total_revenue DESC;

6.Most Popular Payment Method by Shipping Type
SELECT shipping_type, payment_method, COUNT(*) as usage_count
FROM customers
GROUP BY shipping_type, payment_method
ORDER BY shipping_type, usage_count DESC;
