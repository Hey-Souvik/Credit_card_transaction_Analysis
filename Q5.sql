--Q5 
/*write a query to print 3 columns:  city, highest_expense_type , lowest_expense_type*/
with cte as (
select city,exp_type,sum(amount) as total_spend
from credit_card_transcations
group by city,exp_type)
--order by city,total_spend
, cte2 as (
select *
,rank() over(partition by city order by total_spend desc) rn_high
,rank() over(partition by city order by total_spend) rn_low
from cte)
select city
, max(case when rn_high=1 then exp_type end) as highest_expense_type
, max(case when rn_low=1 then exp_type end) as lowest_expense_type
from cte2
where rn_high=1 or rn_low=1
group by city;