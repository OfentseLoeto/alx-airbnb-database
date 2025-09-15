-- Partitioning Booking table by start_date to improve query performance
DROP TABLE IF EXISTS Booking;

-- Reacreste Booking table (if exixt) for clean setup
CREATE TABLE Bookings (
    booking_id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    PRRIMARY KEY (booking_id, start_date),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Test query performance with EXPLAIN ANALYZE
-- Fetch bookings for the yaer 2024
SELECT booking_id, user_id, property_id, start_date, end_date
FROM Bookings
WHERE start_date BETWEEN'2024-01-01' AND '2024-12-31';

-- Fetch bookings for the year 2025
SELECT booking_id, user_id, property_id, start_date, end_date
FROM Bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

-- Compare: Wide range query across multiple patitions
SELECT booking_id, user_id, property_id, start_date, end_date
FROM Bookings
WHERE start_date BETWEEN '2023-01-01' AND 2025-12-31';
-- This query will scan multiple partitions, demonstrating the performance benefits of partitioning.

