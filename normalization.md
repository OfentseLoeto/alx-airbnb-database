Discovered that the two tables that can cause redundency and violations of normalizations principles are the properties and bookings table:

Normalization steps:

# Properties:
          - Attributes: 'host_id, name, description, location, and price_per_night'
          - location stored as plain text may cause redundency.
Improvement:
          - Normalize into a Location table.

CREATE TABLE Locations (
    location_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100)
);

ALTER TABLE Properties
ADD COLUMN location_id UUID,
DROP COLUMN location,
ADD CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES Locations(location_id);

# Bookings:
          - Attributes: property_id, user_id, start_date, end_date, total_price, status.
Improvement:
          - Removed the total_price and calculate dynamically 

-- Query to calculate total_price dynamically
SELECT 
    b.booking_id,
    p.price_per_night * (DATE_PART('day', b.end_date - b.start_date)) AS total_price
FROM Bookings b
JOIN Properties p ON b.property_id = p.property_id;


