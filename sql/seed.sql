INSERT INTO decks (name, description)
VALUES
  ('SQL Basics', 'Starter deck for SQL concepts.'),
  ('Web Development', 'Starter deck for backend web ideas.');

INSERT INTO cards (deck_id, question, answer)
VALUES
  (1, 'What does SQL stand for?', 'Structured Query Language'),
  (1, 'What is a primary key?', 'A unique identifier for a record in a database table.'),
  (2, 'What is Flask?', 'A micro web framework for Python.'),
  (2, 'What is a route in Flask?', 'A URL pattern that is associated with a view function that handles requests to that URL.');