--Q6
/*write a query to find percentage contribution of spends by females for each expense type*/

with cte1 as(
select exp_type,gender,sum(amount)as spend_by_female from credit_card_transcations
where gender='F'
group by exp_type,gender
),
cte2 as(
select exp_type, sum(amount)as total_spend from credit_card_transcations
group by exp_type
)
select exp_type,round((spend_by_female/total_spend)*100,2) as pct_contr_female from (
select cte1.*,cte2.total_spend from
cte2 inner join 
cte1 on cte1.exp_type=cte2.exp_type)a