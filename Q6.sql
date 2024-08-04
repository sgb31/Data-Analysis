use EDA;
select Product.`Brand`,round(sum(Product.`Unit Price USD` - Product.`Unit Cost USD`),2) as totalprofit
from product
group by Product.`Brand`;


