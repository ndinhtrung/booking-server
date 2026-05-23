INSERT INTO users (name, email)
VALUES 
  ('A', 'a@gmail.com')

INSERT INTO buildings (name)
VALUES
  ('biz')

INSERT INTO rooms (building_id, capacity, type, approval,)
VALUES 
  (1, 5, 'studio', 'yes')

INSERT INTO bookings (room_id, user_id)
VALUES 
  (1, 1)

INSERT INTO occurrences (booking_id, start_time, end_time, status)
VALUES
  (1, '2028-01-19 03:14:07', '2038-01-19 03:14:07', 'cancelled'),

