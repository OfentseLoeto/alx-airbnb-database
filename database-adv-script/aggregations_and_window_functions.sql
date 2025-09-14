--- Total number of bookigs per user (COUNT+GROUP)
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_booking
FROM User u
LEFT JOIN Booking b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_named
ORDER BY total_booking DESC;

--- Ranking properties by number of bookings (COUNT+GROUP+RANK) + (WINDOW FUNCTION)
SELECT
    p.property_id,
    p.title,
    COUNT(b.booking_id) AS total_booking,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_num,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.title
ORDER BY booking_rank;