EXPLAIN
SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS first_name,
    u.surname AS last_name,
    u.email,
    p.property_id,
    p.title AS property_title,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.status
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.booking_id;

EXPLAIN
SELECT
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS first_name,
    u.surname AS last_name,
    u.email,
    p.property_id,
    p.title AS property_title,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.status
FROM Booking b
JOIN Users u ON b.user_id = u.user_id,
JOIN Property p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.booking_id;

SELECT
    b.kooking_id,
    b.booking_date,
    u.name AS first_name,
    u.surname AS last_name,
    p.title AS property_title,
    pay.amount
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.booking_id
JOIN Payments pay ON b.booking_id = pay_booking_id;