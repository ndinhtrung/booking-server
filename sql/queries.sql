-- What are all occurrences of a single booking?
-- Tested with booking with id = 3  

SELECT * 
FROM occurrences AS o
INNER JOIN bookings AS bo on bo.id = o.booking_id
WHERE bo.id = 3;

-- What is the number of projectors in a certain building? 
-- Tested with building School of Science and Technology

SELECT COUNT(*) as projector_count
FROM equipment_instances AS ei
INNER JOIN equipments AS e ON e.id = ei.equipment_id
INNER JOIN rooms AS r ON r.id = ei.room_id
INNER JOIN buildings AS bu ON bu.id = r.building_id
WHERE e.name = 'Projector' AND bu.name = 'School of Science and Technology';

-- Which organization cancels bookings the most this year?  
SELECT u.name, COUNT(DISTINCT bo.id) AS cancellations_count
FROM occurrences AS o
LEFT JOIN bookings AS bo ON bo.id = o.booking_id
LEFT JOIN users AS u ON u.id = bo.user_id
WHERE o.status = 'cancelled'
GROUP BY u.name
ORDER BY cancellations_count DESC
LIMIT 1;


-- On average, how long do people cancel their bookings before the bookings start?  
SELECT AVG(start_time - cancel_time) AS average_cancel_period
FROM occurrences
WHERE status = 'cancelled';

-- What is the average duration of a booking? 
SELECT AVG(end_time - start_time) AS average_duration
FROM occurrences
WHERE status = 'confirmed';

-- How many times have each organization booked each room?
SELECT 
    u.name AS org_name, 
    r.name AS room_name,
    COALESCE(COUNT(DISTINCT bo.id), 0) AS booking_count
FROM users AS u
LEFT JOIN bookings AS bo on bo.user_id = u.id
LEFT JOIN rooms AS r on r.id = bo.room_id
GROUP BY u.name, r.name
ORDER BY u.name;

-- Which 5 types of equipment have the most instances?
SELECT e.name, COUNT(ei.id) AS instance_count
FROM equipments AS e
LEFT JOIN equipment_instances AS ei ON ei.equipment_id = e.id
GROUP BY e.name
ORDER BY instance_count DESC
LIMIT 5;