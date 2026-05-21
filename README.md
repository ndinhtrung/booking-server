# PostgreSQL with Docker

A minimal setup for testing SQL files on PostgreSQL locally using Docker Compose.

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