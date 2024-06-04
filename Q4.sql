--Q4
/*write a query to find city which had lowest percentage spend for gold card type*/

select city,sum(amount) as total_spend
, sum(case when card_type='Gold' then amount else 0 end) as gold_spend
,sum(case when card_type='Gold' then amount else 0 end)*1.0/sum(amount)*100 as gold_contribution
from credit_card_transcations
group by city
having sum(case when card_type='Gold' then amount else 0 end) > 0
order by gold_contribution 