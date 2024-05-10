SELECT * FROM `Retail Sales`.retails;
#Exploring the data Structures
# Shows the tables in the current schema. 
show tables;
# Describe query is used to view the structure, including the column names and data types. 
DESCRIBE retails;
#1.Descriptive Statistics
#Get basic counts and summary statistics for all numeric columns:
SELECT
  COUNT(*) AS total_transactions,
  SUM(Quantity) AS total_quantity,
  SUM(`Total Amount`) AS total_revenue,
  AVG(`Price per Unit`) AS average_price,
  AVG(Age) AS average_age
FROM retails;
#Find minimum and maximum values for specific columns:
SELECT
  MIN(`Price per Unit`) AS min_price,
  MAX(`Price per Unit`) AS max_price,
  MIN(Age) AS min_age,
  MAX(Age) AS max_age
FROM retails;
#2. Analyzing Sales by Product Category:
#Top 5 selling product categories by quantity:
SELECT `Product Category`, SUM(Quantity) AS total_quantity
FROM retails
GROUP BY `Product Category`
ORDER BY total_quantity DESC
LIMIT 5;
#3. Analyzing Customer Behavior:
#Average spending per customer:
SELECT
  `Customer ID`,
  AVG(`Total Amount`) AS average_spending
FROM retails
GROUP BY `Customer ID`;
#Frequency of purchases per customer:
SELECT
`Customer ID`,
  COUNT(*) AS number_of_purchases
FROM retails
GROUP BY `Customer ID`
ORDER BY number_of_purchases DESC;
#4. Analyzing Sales Trends:
#Total sales per month:
SELECT
  YEAR(Date) AS year,
  MONTH(Date) AS month,
  SUM(`Total Amount`) AS Monthly_sales
FROM retails
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY year, month;
#Identify the day of the week with the highest sales:
SELECT
  DAYNAME(date) AS day_of_week,
  SUM(`Total Amount`) AS daily_sales
FROM retails
GROUP BY DAYNAME(date)
ORDER BY daily_sales DESC
LIMIT 1;
#5. Segmenting Customers by Gender:
#Average spending by gender:
SELECT
  gender,
  AVG(`Total Amount`) AS average_spending
FROM retails	
GROUP BY gender;


