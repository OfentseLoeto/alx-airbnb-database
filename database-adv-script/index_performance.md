## index prformance Notes

## Identified High-Usage columns
- Users: `user_id` (joins), `email` (login lookup)
- Booking: `user_id` , `property_id`, `booking_date`
Properties: `property_id`, `location`

## Steps
1. Run queries from `database_index.sql` with **EXPLAIN ANALYZE** *before creating indexes*.
   - Expect **sequential scan** and high execution times.
2. Execute the `CREATE INDEX` commands from the `database_index.sql`
3. Run the same queries again with **`EXPLAIN ANALYZE`** *after indexes are created*.
   - Expect **index scan* or *index seek** with much lower execution time.
4. Compare the query plans and execution times.

## Example Observations:
-  **Join on Users and Bookings**
   - Before: Sequential scan on `Booking`
   - After: Index Scan on `idx_booking_user_id`

- **Filter by booking_date**
   - Before: Full table scan across all bookings
   - After: Index scan using `idx_booking_date`, reducing time significantly.

- **Search by email**
   - Before: Sequential scan for User_table
   - After: Index scan on `idx_user_email`

## Conclution
Adding indexes to high-usage columns (`user_id`, `property_id`, `booking_date`, `email`, `location`) improves performance for joins, filtering, and ordering operations.
Using **`EPLAIN ANALYZE`** makes it possible to see both the queries plan and the actual execution time, which allow clear before/after comparison.