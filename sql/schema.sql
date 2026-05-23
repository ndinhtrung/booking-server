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
  building_id INTEGER NOT NULL REFERENCES buildings(id) ON DELETE CASCADE,
  name TEXT NOT NULL UNIQUE,
  capacity INTEGER NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('meeting room', 'lecture room', 'studio', 'workshop room')),
  require_approval BOOLEAN NOT NULL
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  room_id INTEGER NOT NULL REFERENCES rooms(id) ON DELETE RESTRICT,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  approval_granted BOOLEAN
);

CREATE TABLE occurrences (
  id SERIAL PRIMARY KEY,
  booking_id INTEGER NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL CHECK (end_time > start_time), 
  status TEXT NOT NULL CHECK (status IN ('pending', 'confirmed', 'cancelled', 'rejected')),
  cancel_time TIMESTAMP CHECK (
    ((status = 'cancelled') AND (cancel_time IS NOT NULL)) --how to insert current timestamp
    OR 
    ((status <> 'cancelled') AND (cancel_time IS NULL))
  ),
  cancel_reason TEXT CHECK (
    ((status <> 'cancelled') AND (cancel_reason IS NULL))
    OR 
    (status = 'cancelled')
  )
);

CREATE TABLE equipments (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE equipment_instances (
  id SERIAL PRIMARY KEY,
  equipment_id INTEGER NOT NULL REFERENCES equipments(id) ON DELETE RESTRICT,
  room_id INTEGER REFERENCES rooms(id) ON DELETE RESTRICT
);
