--Q8
/*during weekends which city has highest total spend to total no of transcations ratio */
select city, sum(amount)*1.0/count(*) as ratio 
from credit_card_transcations
where datepart(weekday,transaction_date) in (1,7)
group by city
order by ratio desc