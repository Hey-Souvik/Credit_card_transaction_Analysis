--Q9
/*which city took least number of days to reach its 500th transaction 
after the first transaction in that city*/
with cte as (
select *
, row_number() over(partition by city order by transaction_date,transaction_id) as rn
from credit_card_transcations)
select city, min(transaction_date) as first_transaction,max(transaction_date) as last_transaction
, datediff(day,min(transaction_date),max(transaction_date)) as days_to_500
from cte
where rn in (1,500)
group by city
having count(*)=2
order by days_to_500 asc