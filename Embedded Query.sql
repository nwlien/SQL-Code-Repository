SELECT count(c.artist_id)
from (
select
a.artist_id, count(a.artist_id) as 'Count',
sum(case when b.product_region_code = 'China' then 1 else 0 end) as 'China',
sum(case when b.product_region_code = 'EPTV' then 1 else 0 end) as 'EPTV',
sum(case when b.product_region_code = 'India' then 1 else 0 end) as 'India',
sum(case when b.product_region_code = 'NA' then 1 else 0 end) as 'NA',
sum(case when b.product_region_code = 'Europe' then 1 else 0 end) as 'Europe',
sum(case when b.product_region_code = 'LatAm' then 1 else 0 end) as 'LatAm',
sum(case when b.product_region_code = 'Japan' then 1 else 0 end) as 'Japan',
sum(case when b.product_region_code = 'Korea' then 1 else 0 end) as 'Korea',
sum(case when b.product_region_code = 'UK' then 1 else 0 end) as 'UK'
FROM dbo.ARTIST a
join dbo.artist_product_region b on a.artist_id = b.artist_id
group by a.artist_id) c
where c.China = 1
and c.Count = 1