SQL Joins PracticeThis document provides a set of complex SQL queries designed to help you master the different types of joins: INNER JOIN, LEFT JOIN, and FULL OUTER JOIN. The queries are based on a hypothetical database schema for a simple booking platform.Database SchemaThe queries assume the following database structure:Users Table: Stores user information.user_id (Primary Key)usernameemailBookings Table: Stores booking details and links them to users and properties.booking_id (Primary Key)user_id (Foreign Key)property_id (Foreign Key)start_dateend_dateProperties Table: Contains property information.property_id (Primary Key)property_namelocationReviews Table: Contains reviews for properties.review_id (Primary Key)property_id (Foreign Key)ratingcomment1. INNER JOINObjective: To retrieve all bookings and the respective users who made those bookings.An INNER JOIN returns only the rows where there is a match in both tables. It's the most common type of join and is used when you only care about the records that exist in both datasets.SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.username,
    u.email
FROM
    Bookings AS b
INNER JOIN
    Users AS u ON b.user_id = u.user_id;
2. LEFT JOINObjective: To retrieve all properties and their reviews, including properties that have no reviews.A LEFT JOIN (or LEFT OUTER JOIN) returns all rows from the left table (Properties) and the matched rows from the right table (Reviews). If a property has no reviews, the columns from the Reviews table will return NULL, ensuring no property is left out of the result set.SELECT
    p.property_name,
    p.location,
    r.rating,
    r.comment
FROM
    Properties AS p
LEFT JOIN
    Reviews AS r ON p.property_id = r.property_id;
3. FULL OUTER JOINObjective: To retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.A FULL OUTER JOIN returns all records when there is a match in either the left or the right table. This is useful for finding "orphaned" records on either side of the join.Note on MySQL: Older versions of MySQL do not support the FULL OUTER JOIN syntax directly. The query below uses a combination of LEFT JOIN, RIGHT JOIN, and the UNION operator to achieve the same result. This is a common workaround for this limitation.-- This query works on all standard SQL databases
SELECT
    u.user_id,
    u.username,
    b.booking_id,
    b.start_date,
    b.end_date
FROM
    Users AS u
FULL OUTER JOIN
    Bookings AS b ON u.user_id = b.user_id;


-- This query is the workaround for older MySQL versions
SELECT
    u.user_id,
    u.username,
    b.booking_id,
    b.start_date,
    b.end_date
FROM
    Users AS u
LEFT JOIN
    Bookings AS b ON u.user_id = b.user_id

UNION

SELECT
    u.user_id,
    u.username,
    b.booking_id,
    b.start_date,
    b.end_date
FROM
    Users AS u
RIGHT JOIN
    Bookings AS b ON u.user_id = b.user_id
WHERE
    u.user_id IS NULL;
