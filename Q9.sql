use EDA;
with delivery AS (
    SELECT 
        product.`Product Name`,
        product.`Category`,
        product.`Unit Cost USD`,
        product.`Unit Price USD`,
        product.`ProductKey`,
        sales.`Order Date`,
        sales.`Quantity`,
        sales.`CustomerKey`,
        sales.`Currency Code`,
        ABS(product.`Unit Cost USD` - product.`Unit Price USD`) * sales.`Quantity` AS profit
    FROM 
        sales
    JOIN 
        product ON product.`ProductKey` = sales.`ProductKey`
), 
final AS (
    SELECT
		delivery.`Category`,
        delivery.`profit`,
        delivery.`Product Name`,
        delivery.`Order Date`,
        delivery.`Quantity`,
        delivery.`Currency Code`,
        delivery.`CustomerKey`,
        exchangerates.`Date`,
        exchangerates.`Exchange`,
        exchangerates.`Currency`,
        ROUND(delivery.`profit` * exchangerates.`Exchange`, 2) AS total_profit
    FROM 
        delivery
    JOIN 
        exchangerates ON delivery.`Currency Code` = exchangerates.`Currency` 
                        AND delivery.`Order Date` = exchangerates.`Date`
),
final2 as(select
				 customer.`Name`,
                 customer.`Gender`,
				 count(final.Category) as purchasecount 
            from final 
            join customer on customer.`CustomerKey`=final.`CustomerKey`
			group by
				 customer.`Name`,
                 customer.`Gender`
            order by  purchasecount desc  
            limit 10)
 select*from final2;