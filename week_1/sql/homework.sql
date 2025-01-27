select count(*) from public.trips
where
	1 = 1
	and lpep_pickup_datetime >= '2019-10-01 00:00:00'
	and lpep_dropoff_datetime < '2019-11-01 00:00:00'
	and trip_distance > 1 and trip_distance <= 3

-- task 5:

with with_zones as (
	select "PULocationID", "Zone", total_amount
	from public.trips r
	inner join zones z
	on r."PULocationID" = z."LocationID"
	where
		1 = 1
		and r.lpep_pickup_datetime >= '2019-10-18 00:00:00'
		and r.lpep_pickup_datetime < '2019-10-19 00:00:00'
),

grouped as (
	select "Zone", "PULocationID", sum(total_amount) as sum_amount
	from with_zones
	group by "Zone", "PULocationID"
)

select "Zone" from grouped
order by sum_amount desc
limit 3

-- task 6:

with with_zones as (
	select "PULocationID", "DOLocationID", "Zone" as pickup_zone, tip_amount,
	(select "Zone" from zones where "LocationID" = "DOLocationID") as drop_location
	from public.trips r
	inner join zones z
	on r."PULocationID" = z."LocationID"
	wherell
		1 = 1
		and r.lpep_pickup_datetime >= '2019-10-01 00:00:00'
		and r.lpep_pickup_datetime < '2019-11-01 00:00:00'
		and z."Zone" = 'East Harlem North'
)

select * from with_zones
order by tip_amount desc
limit 1