
.mode csv
.separator ,
.headers on
.once kal_el.csv

with kal_el_powers as (select * from powers where character_name = "kal_el")
select power, sum(1) as count from kal_el_powers group by power 
order by sum(1) desc
