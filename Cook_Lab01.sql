#-- ------------------------------------------------------------------
#-- 0). First, How Many Rows are in the Products Table?
#-- ------------------------------------------------------------------
select count(*) from products;

#-- ------------------------------------------------------------------
#-- 1). Product Name and Unit/Quantity
#-- ------------------------------------------------------------------
select product_name, quantity_per_unit from products;

#-- ------------------------------------------------------------------
#-- 2). Product ID and Name of Current Products
#-- ------------------------------------------------------------------
select id, product_name from products where discontinued = 0;

#-- ------------------------------------------------------------------
#-- 3). Product ID and Name of Discontinued Products
#-- ------------------------------------------------------------------
select id, product_name from products where discontinued = 1;

#-- ------------------------------------------------------------------
#-- 4). Name & List Price of Most & Least Expensive Products
#-- ------------------------------------------------------------------
select product_name, list_price from products 
where list_price = (select min(list_price) from products) 
or list_price = (select max(list_price) from products);

#-- ------------------------------------------------------------------
#-- 5). Product ID, Name & List Price Costing Less Than $20
#-- ------------------------------------------------------------------
select id, product_name, list_price from products where list_price < 20;

#-- ------------------------------------------------------------------
#-- 6). Product ID, Name & List Price Costing Between $15 and $20
#-- ------------------------------------------------------------------
select id, product_name, list_price from products where list_price > 15 and list_price < 20;


#-- ------------------------------------------------------------------
#-- 7). Product Name & List Price Costing Above Average List Price
#-- ------------------------------------------------------------------
select product_name, list_price from products where list_price > (select AVG(list_price) from products);

#-- ------------------------------------------------------------------
#-- 8). Product Name & List Price of 10 Most Expensive Products 
#-- ------------------------------------------------------------------
select product_name, list_price from products order by list_price DESC limit 10;

#-- ------------------------------------------------------------------ 
#-- 9). Count of Current and Discontinued Products 
#-- ------------------------------------------------------------------
SELECT discontinued, count(*) from products group by discontinued;



#-- ------------------------------------------------------------------
#-- EXTRA CREDIT -----------------------------------------------------
#-- ------------------------------------------------------------------


#-- ------------------------------------------------------------------
#-- 11). Products with Supplier Company & Address Info
#-- ------------------------------------------------------------------
SELECT products.product_name, suppliers.company, suppliers.address, suppliers.city,
suppliers.state_province, suppliers.zip_postal_code, suppliers.country_region 
FROM products
INNER JOIN suppliers ON products.id = suppliers.id;


#-- ------------------------------------------------------------------
#-- 12). Number of Products per Category With Less Than 5 Units
#-- ------------------------------------------------------------------
select category, count(*) from products 
where quantity_per_unit < 5 
group by category;


#-- ------------------------------------------------------------------
#-- 13). Number of Products per Category Priced Less Than $20.00
#-- ------------------------------------------------------------------
select category, count(*) from products
where list_price < 20
group by category;