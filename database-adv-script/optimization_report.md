# Performance Query Analysis
This document explain the purpose and structure of the `performance.sql` script.
It shows how to analyze and optimize a query that retrieve booking along with user, property, payment details.

--
## Files
- **performance.sql** - contains the initial query, EXPLAIN analysis, and refactored query.
- **performance.md** - Documentation and notes.

--

## Initial Query:
The first query retrives **all bookings** along with:
- User details (`Users`)
- Property details (`Properties`)
- Payment details (`Payments`)

```sql
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
JOIN Property p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.property_id