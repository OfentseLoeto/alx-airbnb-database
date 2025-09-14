SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email
FROM
    Booking AS b
INNER JOIN
    Users AS u ON b.user_id = u.user_id;

SELECT
    p.property_id,
    p.location,
    p.pricepernight,
    r.rating,
    r.comment
FROM
    Property AS p
LEFT JOIN
    Review AS r ON p.property_id = r.property_id;

UNION

SELECT
    u.user_id,
    u.firt_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.strart_date,
    b.end_date
FROM
    Users AS u
FULL OUTER JOIN
    Booking AS b on u.user_id = b.user_id
WHERE
    u.user_id IS NULL;