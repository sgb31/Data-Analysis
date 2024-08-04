use EDA;

WITH region AS (
    SELECT 
        sales.`Order Number`,
        sales.`Line Item`,
        sales.`Order Date`,
        sales.`Delivery Date`,
        sales.`CustomerKey`,
        sales.`StoreKey`,
        sales.`ProductKey`,
        sales.`Quantity`,
        sales.`Currency Code`,
        Stores.`Country`,
        Stores.`State`,
        Stores.`Square Meters`,
        Stores.`Open Date`
    FROM 
        sales
    JOIN 
        Stores ON sales.`StoreKey` = Stores.`StoreKey`
)
SELECT 
    region.`Country`,
    SUM(region.`Quantity`) AS total_quantity
FROM 
    region
GROUP BY 
    region.`Country`;