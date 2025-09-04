Database Schema for a AirBnB Booking Application:

 Schema Overview
 
The database is composed of six main tables, each representing a key entity within the application. The tables are linked together using primary and foreign keys to maintain data integrity and define relationships between the entities.

User: Stores information about users, including guests, hosts, and administrators.

Property: Contains details of properties listed by hosts.

Booking: Records reservation details for properties.

Payment: Tracks all payment transactions related to bookings.

Review: Holds user-submitted ratings and comments for properties.

Message: Manages communication between users.


Relationships:

The schema is connected through the following foreign key relationships:

Property.host_id -> User.user_id (A property is owned by a host user).

Booking.user_id -> User.user_id (A booking is made by a guest user).

Booking.property_id -> Property.property_id (A booking is for a specific property).

Payment.booking_id -> Booking.booking_id (A payment is tied to a specific booking).

Review.user_id -> User.user_id (A review is written by a specific user).

Review.property_id -> Property.property_id (A review is for a specific property).

Message.sender_id -> User.user_id (A message is sent by a specific user).

Message.recipient_id -> User.user_id (A message is sent to a specific user).