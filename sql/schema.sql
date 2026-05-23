CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  email TEXT NOT NULL UNIQUE
);

CREATE TABLE buildings (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE rooms (
  id SERIAL PRIMARY KEY,
  building_id INTEGER NOT NULL REFERENCES buildings(id),
  name TEXT NOT NULL UNIQUE,
  capacity INTEGER NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('meeting room', 'lecture room', 'studio', 'workshop room')),
  approval TEXT NOT NULL CHECK (approval IN ('yes', 'no'))
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  room_id INTEGER NOT NULL REFERENCES rooms(id),
  user_id INTEGER NOT NULL REFERENCES users(id),
);

CREATE TABLE occurrences (
  id SERIAL PRIMARY KEY,
  booking_id INTEGER NOT NULL REFERENCES bookings(id),
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL CHECK (end_time > start_time), 
  status TEXT NOT NULL CHECK (status IN ('pending', 'confirmed', 'cancelled', 'rejected')),
  cancel_time TIMESTAMP CASE status (
    WHEN 'cancelled' THEN DEFAULT CURRENT_TIMESTAMP
    ELSE cancel_time IS NULL
  ),
  cancel_reason TEXT CHECK (
    WHEN status <> 'cancelled' THEN cancel_reason IS NULL
  )
);

CREATE TABLE equipments (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE equipment_instances (
  id SERIAL PRIMARY KEY,
  equipment_id INTEGER NOT NULL REFERENCES equipments(id),
  room_id INTEGER NOT NULL REFERENCES rooms(id)
);