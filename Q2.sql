USE EDA;
WITH quantity AS(select product.`Product Name`,

	   sales.`Quantity`

from sales join product on product.`Productkey`=sales.`ProductKey`)

select quantity.`Product Name` ,

	   SUM(quantity.`Quantity`) AS overall_quantity 

FROM quantity

GROUP BY quantity.`Product Name` 

ORDER BY overall_quantity DESC

LIMIT 50;
 