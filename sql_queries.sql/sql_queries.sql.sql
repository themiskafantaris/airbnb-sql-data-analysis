
with duplicate as 
(select id,ROW_NUMBER() over (partition by id order by id)as rownum
from listings)
delete from listings
WHERE id IN (
SELECT id
FROM duplicate
WHERE rownum > 1
);
WITH CTE AS (
SELECT id,ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) AS RowNum
FROM reviews
)
DELETE FROM CTE where RowNum>1;

-- 1. Posa einai ta synolika katalymata?
select count(id) as KATALYMATA
from listings

-- 2. Poses einai synolika oi axiologiseis?
select count(id) as KRITIKES
from reviews

-- 3. Poses kratiseis exoun ginei?
 SELECT COUNT(available) as KRATISEIS
 from calendar
 where available='no'

 -- 4. Posoi monadikoi oikodespotes/hosts yparxoun?
 select count(distinct host_id) as MONADIKOI_OIKODESPOTES
 from listings

 -- 5. Poies einai oi monadikes perioxes katalymatwn?
 select distinct neighbourhood_cleansed  as MONADIKES_PERIOXES_KATALYMATON 
 from listings

 -- 6. pososto  katalymatwn ana perioxi Poies perioxes exoyn ta perissotera katalymata?
 select neighbourhood_cleansed, concat(cast(round(count(id)*100.0/(select count(*) from listings),2) as decimal(5,2)),'%')  AS pososto
from listings
group by neighbourhood_cleansed
order by count(id) desc

-- 7. Posoi einai superhosts/non-superhosts?
select host_is_superhost,count(*) as total_listings
from listings
where host_is_superhost is not null
group by host_is_superhost
order by total_listings desc

-- 8. Posa katalymata exei o kathe oikodespotis/host?

select HOST_NAME, count(*) as number_of_listings_per_host
from listings
group by host_name
order by number_of_listings_per_host desc

--  Poio einai to pososto katalumatwn pou katexei o kathe oikodespotis/host?
SELECT host_name, concat( cast( round( COUNT(host_name)*100.0/(SELECT COUNT(*) FROM listings),3) as decimal(5,3)),'%') AS percentage
FROM Listings
where host_name is not null
GROUP BY host_name
order by percentage desc

--

-- 9. Emfanise ta katalymata poy anikoun se geitonies pou ksekinoun apo P (elliniko)
select * from listings
wherE NEIGHBOURHOOD_CLEANSED like 'Π%'

-- 10. Emfanise ta katalymata pou exoun timi apo 0 ews 100 euro ana vradia
select * from listings 
where price between 0 and 100

-- Poia ta monadika katalymata pou exoun labei reviews?

select id as katalymata_me_review from listings 
intersect select listing_id 
from reviews

-- 11. Poia katalymata den emfanizontai pote ston pinaka reviews, ara den exoun labei pote axiologisi?
select id as katalymata_xoris_review from listings 
except select listing_id 
from reviews

-- 12. Posoi oikodespotes/hosts exoun profile photo?
select count( distinct( host_id))
from listings 
where host_has_profile_pic=1

-- 13. Poies einai oi top 10 pio akribes perioxes me basi tin timi ana vradia?
select top 10
neighbourhood_cleansed,avg(price) as mesi_timi
from listings
group by neighbourhood_cleansed
order by avg (price)desc

-- 14. Poios typos property exei tin megalyteri mesi timi?
 select top 1 property_type, avg(price) as mesi_timi
from listings
group by property_type
order by mesi_timi desc

-- 15. Poies einai oi perioxes oi opoies exoun mesi timi ana vradia perissotero apo 200 euro?
select neighbourhood_cleansed, avg(price) as mesi_timi
from listings
group by neighbourhood_cleansed
having avg(price) >= 200
order by mesi_timi desc

-- 16. Poioi einai oi Top 10 typoi katalymatwn me tis perissoteres kratiseis?
select top 10
listings.property_type, count(calendar.available) as KRATISEIS_ANA_property_type
from calendar
join listings on listings.id=calendar.listing_id
WHERE calendar.available = 'no'
group by property_type
order by count(calendar.available) desc

-- 17. Poses axiologiseis exei lavei kathe room type?
select listings.room_type, count(reviews.id) as ARITHMOS_AKSIOLOGISEON_roomtype
from reviews join listings on listings.id=reviews.listing_id
group by room_type
order by count(reviews.id) desc;

--  Poses axiologiseis exei lavei kathe typos domatiou?
select listings.property_type, count(reviews.id) as ARITHMOS_AKSIOLOGISEON_propertype
from reviews join listings on listings.id=reviews.listing_id
group by property_type
order by count(reviews.id) desc;
--18. emfanisi top 10 katalymatwn (onomasia, oikodespotis,timi,aksiologiseis, kratiseis)
select top 10
listings.name, listings.host_name, listings.price, count(calendar.available) as κρατησεις,count(reviews.id) as αξιολογησεις
from listings
 right join calendar on listings.id=calendar.listing_id
  right join reviews on listings.id=reviews.listing_id
where available='no'
group by listings.name,listings.host_name, listings.price 
order by κρατησεις desc , αξιολογησεις desc

-- Kathe fora pou vrisketai mia stili me times t/f, metatrepoume antistoixa se Yes/No
Alter table calendar alter column available varchar(3)
update calendar set available= case
 when available='t' then 'Yes'
 when  available='f' then 'No'     
 end;
 
-- Epeidi o pinakas calendar periexei to sima tou $ den mporoume na paroume athroisma i meso oro gi' auto prepei na diagrafei
 UPDATE calendar
SET adjusted_price = REPLACE(adjusted_price, '$', '')

