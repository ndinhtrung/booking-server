-- What are all occurrences of a single booking?  

SELECT * 
FROM occurrences AS o
INNER JOIN bookings AS b on b.id = o.booking_id
WHERE b.id = 1;

-- What is the number of projectors in a certain building?  

SELECT COUNT(*)
FROM equipment_instances AS ei
INNER JOIN equipments AS e ON e.id = ei.equipment_id
INNER JOIN rooms AS r ON r.id = ei.room_id
INNER JOIN buildings AS b ON b.id = r.building_id
WHERE e.name = 'Projector' AND b.name = 'Vare';

-- Which organization cancels bookings the most this year?  
--to answer this, we have to assume that a booking can only be cancelled
--by the organization, not the school. 
--another challenge is how we count the number of cancellations, because
--cancellations of recurring bookings should be counted as one.

-- On average, how long do people cancel their bookings before the bookings start?  
SELECT AVG(start_time - cancel_time) AS average_cancel_period
FROM occurrences
WHERE status = 'cancelled';

-- What is the average duration of a booking? 
SELECT AVG(end_time - start_time) AS average_duration
FROM occurrences
WHERE status = 'confirmed';

-- How many times have each organization booked each room?
SELECT u.name, r.name, COALESCE(COUNT(bo.id), 0) AS booking_count
FROM users AS u
LEFT JOIN bookings AS bo on bo.user_id = u.id
LEFT JOIN occurrences AS o on o.booking_id = bo.id AND o.status = 'confirmed'
LEFT JOIN rooms AS r on r.id = o.room_id
GROUP BY u.name, r.name
ORDER BY u.name;

-- Which types of equipment have the most instances?
SELECT e.name, COUNT(ei.id) AS instance_count
FROM equipments AS e
LEFT JOIN equipment_instances AS ei ON ei.equipment_id = e.id
GROUP BY e.name
ORDER BY instance_count DESC
LIMIT 5;