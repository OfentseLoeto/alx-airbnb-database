## index prformance Notes

## Identified High-Usage columns
- Users: `user_id` (joins), `email` (login lookup)
- Booking: `user_id` , `property_id`, `booking_date`
Properties: `property_id`, `location`

## Steps
1. Run queries from `database_index.sql` with EXPLAIN
2. Execute the `CREATE INDEX` commands from the `database_index.sql`
3. Run the same queries again with `EXPLAIN`.
4. Compare execution plan:
   - Before: Sequentialscan / Full Table Scan
   - After: Index Scan or Index Seek

## Example Observation
   - Query filtering by `booking_date` dropped execution time from ~120ms (seq scan) to ~5ms (index scan).
