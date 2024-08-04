use EDA;

WITH quantity AS (

     SELECT Sales.`Quantity`,

			Stores.`StoreKey`,

            Stores.`Country`

     FROM Sales

     JOIN Stores ON Sales.`StoreKey`= Stores.`StoreKey`

)

select sum(quantity.`Quantity`) as totalquantity ,quantity.`Country` from quantity

group by quantity.`Country`;
 