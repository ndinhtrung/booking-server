# PostgreSQL with Docker

A minimal setup for testing SQL files on PostgreSQL locally using Docker Compose.

## Project Structure

```text
project/
├── compose.yaml
├── README.md
└── sql/
    ├── schema.sql
    ├── seed.sql
    └── queries.sql
```

## Setup

**1. Start the database**
```bash
docker compose up -d
```

**2. Connect to psql**
```bash
docker compose exec db psql -U postgres -d bookingserver
```

**3. Exit psql**
```
\q
```

**4. Stop the database**
```bash
docker compose down -v
```
`-v` removes the PostgreSQL volume so the database is recreated from `schema.sql` and `seed.sql` next time.

## Running Test Queries

Run all queries inside `sql/queries.sql`:

```bash
docker compose exec -T db psql -U postgres -d bookingserver < sql/queries.sql
```

`-T` disables TTY mode so input redirection works correctly.

## psql Command Reference

| Command                                                    | Description                          |
|------------------------------------------------------------|--------------------------------------|
| `\dt`                                                      | List all tables in current database  |
| `\d table_name`                                            | Describe a table’s columns and keys  |
| `SELECT * FROM table_name`                                 | Read all rows from a table           |
| `SELECT * FROM table_name WHERE condition`                 | Read only some rows                  |
| `INSERT INTO table_name (columns) VALUES (values)`         | Add a new row                        |
| `UPDATE table_name SET column = value WHERE condition`     | Change existing rows                 |
| `DELETE FROM table_name WHERE condition`                   | Remove rows                          |