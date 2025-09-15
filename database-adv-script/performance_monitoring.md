-- Profiling a frquently used query (Booking + Users + Payments)

SHOW PROFILE; -- Ensure profiling is enable in MySQL
SET profiling = 1;

-- Enitial query with filters
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.booking_date,
    u.name AS first_name,
    u.name AS last_name,
    pay.amount
FROM Booking b
JOIN Users ON b.user_id = u.user_id
JOIN Payments pay ON b.booking_id = pay.booking_id
WHERE b.bookng_date >= '2024-01-01'
    AND pay.status = 'Completd';

SHOW PROFLES; -- Show recently executed queris with time
SHOW PROFILE FOR QUERY 1; -- Breakdown of time spend in each stage