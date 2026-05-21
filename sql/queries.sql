-- Show all decks
SELECT * FROM decks;

-- Show all cards
SELECT * FROM cards;

-- Count cards per deck
SELECT
  d.name AS deck_name,
  COUNT(c.id) AS total_cards
FROM decks d
LEFT JOIN cards c
  ON d.id = c.deck_id
GROUP BY d.id, d.name
ORDER BY total_cards DESC;

-- Show cards with their deck names
SELECT
  c.id,
  d.name AS deck,
  c.question,
  c.answer
FROM cards c
JOIN decks d
  ON c.deck_id = d.id
ORDER BY d.name, c.id;

-- Search for cards containing "Flask"
SELECT *
FROM cards
WHERE question ILIKE '%Flask%'
   OR answer ILIKE '%Flask%';

-- Insert a test deck
INSERT INTO decks (name, description)
VALUES ('Databases', 'Extra test deck.');

-- Insert a test card
INSERT INTO cards (deck_id, question, answer)
VALUES (
  3,
  'What is PostgreSQL?',
  'An open-source relational database system.'
);

-- Verify inserted data
SELECT
  d.name,
  c.question
FROM decks d
JOIN cards c
  ON d.id = c.deck_id
ORDER BY d.id;

-- Update a card
UPDATE cards
SET answer = 'SQL means Structured Query Language.'
WHERE id = 1;

-- Verify update
SELECT * FROM cards WHERE id = 1;

-- Delete test card
DELETE FROM cards
WHERE question = 'What is PostgreSQL?';

-- Delete test deck
DELETE FROM decks
WHERE name = 'Databases';

-- Final state
SELECT * FROM decks;
SELECT * FROM cards;