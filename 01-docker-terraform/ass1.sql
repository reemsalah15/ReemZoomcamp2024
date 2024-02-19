/*
Question 3. Count records
How many taxi trips were totally made on September 18th 2019?
*/

SELECT COUNT(*) 
FROM 
	green_taxi_data
WHERE 
    DATE(lpep_dropoff_datetime) = '2019-09-18' AND
    DATE(lpep_pickup_datetime) = '2019-09-18';
	
/*
Question 4. Longest trip for each day
Which was the pick up day with the longest trip distance?
Use the pick up time for your calculations.
*/
SELECT max(trip_distance) AS MAX_DISTANCE,DATE(lpep_pickup_datetime)
FROM 
	green_taxi_data
GROUP BY lpep_pickup_datetime
ORDER BY MAX_DISTANCE DESC;

/*
Question 5. Three biggest pick up Boroughs
Consider lpep_pickup_datetime in '2019-09-18' and ignoring Borough has Unknown
Which were the 3 pick up Boroughs that had a sum of total_amount superior to 50000?
*/
SELECT SUM(gtd."total_amount") AS TOTAL_AMT,z."Borough"
FROM green_taxi_data AS gtd JOIN zones AS z
ON gtd."PULocationID" = z."LocationID"
WHERE DATE(gtd.lpep_pickup_datetime) = '2019-09-18' OR z."Borough" = 'Unknown'
GROUP BY z."Borough"
ORDER BY TOTAL_AMT DESC
LIMIT 3;

/*
Question 6. Largest tip

For the passengers picked up in September 2019 in the zone name Astoria 
which was the drop off zone that had the largest tip?
We want the name of the zone, not the id.
*/
SELECT dz."Zone", MAX(gtd."tip_amount") AS max_tip
FROM green_taxi_data gtd 
	JOIN zones pz ON gtd."PULocationID" = pz."LocationID"
	JOIN zones dz ON gtd."DOLocationID" = dz."LocationID"
WHERE 	
	DATE(gtd."lpep_pickup_datetime") BETWEEN '2019-09-01' AND '2019-09-30' 
	AND pz."Zone" = 'Astoria'
GROUP BY dz."Zone" 
ORDER BY max_tip DESC
LIMIT 1;
