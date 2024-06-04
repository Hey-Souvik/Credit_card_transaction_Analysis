--Q1
 /*write a query to print top 5 cities with highest spends 
 and their percentage contribution of total credit card spends*/
with cte1 as (select top 5 city,sum(amount) as spend_per_city from credit_card_transcations
group by city
order by spend_per_city desc ),
cte2 as(
select sum(amount) as total_creditcard_spend from credit_card_transcations 
),
cte3 as(
select * from cte1 inner join
cte2 on 1=1)
select city,spend_per_city,
round((spend_per_city/total_creditcard_spend)*100,2) as percent_contribution from cte3;