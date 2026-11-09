-- creating db Apple Product 
CREATE DATABASE AppleProduct;

USE AppleProduct;

--count data from table
SELECT COUNT(*) FROM dbo.AppleProducts;

--total Missing productid
SELECT COUNT(*) AS Missing_ProductID
FROM dbo.AppleProducts WHERE product_id IS NULL;

--EXACT DUPLICATE ROWS
SELECT product_id,category,model_name,release_year
      ,price,rating,color,storage,ram,cpu ,gpu,battery_mAh,warranty,country_origin,
      COUNT(*) AS ExactDupeCount
FROM AppleProducts
GROUP BY product_id,category,model_name,release_year
      ,price,rating,color,storage,ram,cpu ,gpu,battery_mAh,warranty,country_origin
HAVING  COUNT(*)>1;

-- cleaned data
SELECT product_id,category,model_name,release_year
      ,ROUND(price,2) as price,ROUND(rating,2) as rating,
       color,storage,ram,cpu ,gpu,battery_mAh,warranty,country_origin,in_stock
INTO dbo.AppleProductsCleaned
FROM dbo.AppleProducts;

-- SELECT ALL DATA FROM dbo.AppleProductsCleaned
SELECT * FROM dbo.AppleProductsCleaned;