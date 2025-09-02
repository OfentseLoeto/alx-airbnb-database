Discovered that the two tables that can cause redundency and violations of normalizations principles are the properties and bookings table:

Normalization steps:

# Properties:
          - Attributes: 'host_id, name, description, location, and price_per_night'
          - location stored as plain text may cause redundency.
Improvement:
          - Normalize into a Location table.

# Bookings:
          - Attributes: property_id, user_id, start_date, end_date, total_price, status.
Improvement:
          - Removed the total_price and calculate dynamically 
