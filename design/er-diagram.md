# ER Diagram: Flashcard Study Tracker

The diagram below shows both the entities that exist in the current schema and two entities that a real version would require. Elements that diverge from the current schema are annotated with **[proposed]**.

```mermaid
erDiagram

    USER {
        int     id          PK
        text    email
        text    password_hash
        timestamp created_at
    }

    DECK {
        int     id          PK
        int     user_id     FK
        text    name
        text    description
        timestamp created_at
    }

    CARD {
        int     id          PK
        int     deck_id     FK
        text    question
        text    answer
        timestamp created_at
    }

    TAG {
        int     id          PK
        int     user_id     FK
        text    name
        timestamp created_at
    }

    CARD_TAG {
        int     card_id     FK
        int     tag_id      FK
    }

    STUDY_EVENT {
        int     id          PK
        int     card_id     FK
        int     user_id     FK
        int     rating
        timestamp reviewed_at
    }

    USER ||--o{ DECK         : "owns"
    DECK ||--o{ CARD         : "contains"
    USER ||--o{ TAG          : "owns [proposed]"
    CARD ||--o{ CARD_TAG     : "labelled by"
    TAG  ||--o{ CARD_TAG     : "labels"
    CARD ||--o{ STUDY_EVENT  : "reviewed in [proposed]"
    USER ||--o{ STUDY_EVENT  : "performed by [proposed]"
```