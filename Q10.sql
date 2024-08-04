use EDA;

with table1 as(
	select
		Product.`Product Name`,
        Product.`Brand`,
        Product.`Color`,
        Product.`Unit Cost USD`,
        Product.`Unit Price USD`,
        Product.`SubcategoryKey`,
        Product.`Subcategory`,
        Product.`Category`,
        sales.`Order Number`,
        sales.`Line Item`,
        sales.`Order Date`,
        sales.`Delivery Date`,
        sales.`CustomerKey`,
        sales.`StoreKey`,
        sales.`Quantity`,
        sales.`Currency Code`
        
from 
	Product
join
	sales 
on 
	sales.`ProductKey` = Product.`ProductKey`
),
    
table2 as(
	select 
		table1.`Product Name`,
        table1.`Brand`,
        table1.`Color`,
        table1.`Unit Cost USD`,
        table1.`Unit Price USD`,
        table1.`SubcategoryKey`,
        table1.`Subcategory`,
        table1.`Category`,
        table1.`Order Number`,
        table1.`Line Item`,
        table1.`Order Date`,
        table1.`Delivery Date`,
        table1.`CustomerKey`,
        table1.`StoreKey`,
        table1.`Quantity`,
        table1.`Currency Code`,
        Customer.`Gender`,
        Customer.`Name`,
        Customer.`City`,
        Customer.`State Code`,
        Customer.`State`,
        Customer.`Zip Code`,
        Customer.`Country`,
        Customer.`Continent`,
        Customer.`Birthday`
        
	from
		table1
	join
		Customer
	on
		Customer.`CustomerKey` = table1.`CustomerKey`
),

table3 as(
	select
		table2.`Product Name`,
        table2.`Brand`,
        table2.`Color`,
        table2.`Unit Cost USD`,
        table2.`Unit Price USD`,
        table2.`SubcategoryKey`,
        table2.`Subcategory`,
        table2.`Category`,
        table2.`Order Number`,
        table2.`Line Item`,
        table2.`Order Date`,
        table2.`Delivery Date`,
        table2.`CustomerKey`,
        table2.`Quantity`,
        table2.`Currency Code`,
        table2.`Gender`,
        table2.`Name`,
        table2.`City`,
        table2.`State Code`,
        table2.`State`,
        table2.`Zip Code`,
        table2.`Continent`,
        table2.`Birthday`,
        Stores.`StoreKey`,
        Stores.`Country`,
        Stores.`Square Meters`,
        Stores.`Open Date`
        
	from 
		table2
	join 
		Stores
	on
		Stores.`StoreKey` = table2.`StoreKey`
        
)

select * from table3;
        
		





