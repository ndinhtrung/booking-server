# ER Diagram: Room Booking Service

```mermaid
erDiagram

    BUILDING {
        int        id               PK
        text       name
    }

    ROOM {
        int        id               PK
        int        building_id      FK
        text       name
        int        capacity
        text       type
    }

    USER {
        int        id               PK
        text       name
        text       email
    }

    BOOKING {
        int        id               PK
        int        room_id          FK
        int        user_id          FK
    }

    OCCURENCE {
        int        id               PK
        int        booking_id       FK
        text       name
        timestamp  start_time
        timestamp  end_time
        text       status
        timestamp  cancel_time
        text       cancel_reason
    }

    EQUIPMENT {
        int        id               PK
        text       name
    }

    EQUIPMENT_INSTANCE {
        int        id               PK
        int        equipment_id     FK
        int        room_id          FK
    }

    BUILDING  ||--o{ ROOM                : "be inside"
    ROOM      ||--o{ BOOKING             : "allow"
    USER      ||--o{ BOOKING             : "reserve"
    BOOKING   ||--o{ OCCURENCE           : "have"
    ROOM      ||--o{ EQUIPMENT_INSTANCE  : "contain"
    EQUIPMENT ||--o{ EQUIPMENT_INSTANCE  : "include"
```