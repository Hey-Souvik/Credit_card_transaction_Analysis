--Q2
/*write a query to print highest spend month and amount spent in that month for each card type*/
with cte as (
select card_type,DATEPART(year,transaction_date) as yo,DATENAME(month,transaction_date) as mo
, sum(amount) as monthly_expense
from credit_card_transcations
group by card_type,DATEPART(year,transaction_date),DATENAME(month,transaction_date))
select * from ( 
select *
, rank() over(partition by card_type order by monthly_expense desc) as rn
from cte) A
where rn=1;