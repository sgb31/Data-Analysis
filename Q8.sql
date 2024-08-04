use EDA;

WITH Belender AS (
    SELECT 
        Customer.`Gender`,
        sales.`ProductKey`
    FROM 
        Customer
    JOIN 
        sales ON Customer.`CustomerKey` = sales.`CustomerKey`
),
tablee AS (
    SELECT
        Belender.`Gender`,
        Product.`ProductKey`,
        Product.`Color`
    FROM 
        Product
    JOIN 
        Belender ON Belender.`ProductKey` = Product.`ProductKey`
)

SELECT Gender,Color,count(color) as total 
FROM tablee
GROUP BY Color,Gender;
