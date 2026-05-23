INSERT INTO users (name, email)
VALUES 
  ('Guild of Arts', 'arts@guild.fi'),
  ('Guild of Science', 'sci@guild.fi'),
  ('Financial Club', 'finance@club.fi');

INSERT INTO buildings (name)
VALUES
  ('School of Arts'),
  ('School of Science and Technology'),
  ('School of Business');

INSERT INTO rooms (building_id, capacity, name, type, require_approval)
VALUES 
  (1, 20, 'Art Studio 1', 'studio', FALSE),
  (1, 15, 'Art Studio 2', 'studio', FALSE),
  (2, 50, 'Lecture Hall A', 'lecture room', TRUE),
  (2, 40, 'Lecture Hall B', 'lecture room', TRUE),
  (2, 30, 'Self-Study Room', 'meeting room', FALSE),
  (2, 20, 'Computer Lab', 'workshop room', TRUE),
  (3, 100, 'Business Conference Hall', 'meeting room', TRUE),
  (3, 25, 'Guest Lecture Room', 'lecture room', FALSE);

INSERT INTO bookings (user_id, room_id, approval_granted)
VALUES
  (1, 1, NULL), 
  (1, 2, NULL), 
  (2, 3, TRUE), 
  (2, 4, FALSE), 
  (3, 5, NULL), 
  (2, 6, TRUE), 
  (1, 7, FALSE), 
  (2, 8, NULL);

INSERT INTO occurrences (booking_id, start_time, end_time, status, cancel_time, cancel_reason)
VALUES
  (1, '2028-01-19 03:14:07', '2038-01-19 03:14:07', 'cancelled', CURRENT_TIMESTAMP, 'Not enough participants'),
  (2, '2028-01-20 10:00:00', '2028-01-20 12:00:00', 'confirmed', NULL, NULL),
  (3, '2028-01-21 14:00:00', '2028-01-21 16:00:00', 'pending', NULL, NULL),
  (3, '2028-02-04 14:00:00', '2028-02-04 16:00:00', 'pending', NULL, NULL),
  (3, '2028-02-11 14:00:00', '2028-02-11 16:00:00', 'pending', NULL, NULL),
  (4, '2028-01-22 09:00:00', '2028-01-22 11:00:00', 'confirmed', NULL, NULL),
  (4, '2028-01-29 09:00:00', '2028-01-29 11:00:00', 'rejected', NULL, NULL),
  (4, '2028-02-05 09:00:00', '2028-02-05 11:00:00', 'rejected', NULL, NULL),
  (5, '2028-01-23 13:00:00', '2028-01-23 15:00:00', 'confirmed', NULL, NULL),
  (6, '2028-01-24 08:00:00', '2028-01-24 10:00:00', 'pending', NULL, NULL),
  (7, '2028-01-25 17:00:00', '2028-01-25 19:00:00', 'cancelled', CURRENT_TIMESTAMP, 'Event cancelled by organizer'),
  (8, '2028-01-26 11:00:00', '2028-01-26 13:00:00', 'confirmed', NULL, NULL);

INSERT INTO equipments (name)
VALUES
  ('Projector'),
  ('Whiteboard'),
  ('Video Conferencing System'),
  ('Sound System'),
  ('Microphone');

INSERT INTO equipment_instances (equipment_id, room_id)
VALUES
  (1, 3), (1, 4), (1, 6),
  (2, 1), (2, 2), (2, 3), (2, 4),
  (3, 3), (3, 4), (3, 6), (3, 7), (3, 8),
  (4, 7), (4, 8),
  (5, 7), (5, 8),
  (1, NULL), (2, NULL), (3, NULL), (4, NULL), (5, NULL);
  

