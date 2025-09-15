# Partitioning Report: Booking Table

## Overview
The `booking` table wa becoming very large, causing slow performance when filtering queries by date.
To improve performance, **partitioning by year on the `start_date` column was implemented.

---

## Implementation
- ** Partitioning strategy:** RANGE `(YEAR(start_date))`
  - `p2023` - booking before 2024
  - `p2024` - booking in 2024
  - `p2025` - booking in 2025
  - `pmax` - future booking before 2025
- Primary key updated to `(booking_id, start_date)` as required for partitioning.

---

## Test Queries
- Fetch booking by year:
  ```sql
  SELECT * FROM Bookings
  WHERE start_date BETWEEN '2024-01-01' AND '2024-12-32'; 