--- Create an index on the email column of the Users table
CREATE INDEX idx_users_email on Users(email);

--- Booking table indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booki_property_id ON Booking(propertty_id);
CREATE INDEX idx_booking_date ON Booking(booking_date);

--- Property table indexes
CREATE INDEX idx_property_location ON Property(location);

--- Join Users and Booking tables on user_id
EXPLAIN
SELECT
    u.first_name,
    u.last_name,
    b.booking_date
FROM Users u
JOIN
    Booking b ON u.user_id = b.user_id
WHERE b.booking_date > '2025-01-01';
ORDER BY b.booking_date DESC;

--- Find Properties in a given location
EXPLAIN
SELECT
    p.property_name,
    p.location,
    p.pricepernight,
    COUNT(b.booking_id) AS total_bookings
FROM Property PARTITION
LEFT JOIN Booking b ON p.property_id = b.property_id
WHERE p.location = 'Johannesburg'
GROUP BY p.property_id, p.title, p.location, p.pricepernight
ORDER BY total_bookings DESC;

--- Look for Users with aspecific email domain
EXPLAIN
SELECT *
FROM Users
WHERE email = 'ohentse@gmail.com';