-- UUIDs for easy referencing
-- USER UUIDs
SET @user_host_id = '0c2a5c40-1d8f-4a0b-9c3f-4e5a6f7b8c9d';
SET @user_guest_id = '1e2f3g4h-5i6j-7k8l-9m0n-1o2p3q4r5s6t';
SET @user_admin_id = '2f3g4h5i-6j7k-8l9m-0n1o-2p3q4r5s6t7u';

-- PROPERTY UUIDs
SET @property_cozy_cottage_id = '3d4e5f6a-7b8c-9d0e-1f2a-3b4c5d6e7f8a';
SET @property_city_apartment_id = '4a5b6c7d-8e9f-0a1b-2c3d-4e5f6a7b8c9d';

-- BOOKING UUIDs
SET @booking_id_1 = '5b6c7d8e-9f0a-1b2c-3d4e-5f6a7b8c9d0e';

-- Insert data into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
(@user_host_id, 'Jane', 'Smith', 'jane.smith@gmail.com', 'hashed_password_host', '1234567890', 'host'),
(@user_guest_id, 'Peter', 'Jones', 'peter.jones@gmail.com', 'hashed_password_guest', NULL, 'guest'),
(@user_admin_id, 'Admin', 'User', 'admin@gmail.com', 'hashed_password_admin', '0987654321', 'admin');

-- Insert data into Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight) VALUES
(@property_cozy_cottage_id, @user_host_id, 'Cozy Cottage', 'A beautiful and cozy cottage perfect for a weekend getaway.', 'Rural Retreat, UK', 150.00),
(@property_city_apartment_id, @user_host_id, 'Modern City Apartment', 'A spacious apartment with a great view of the city center.', 'Downtown, USA', 250.00);

-- Insert data into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
(@booking_id_1, @property_cozy_cottage_id, @user_guest_id, '2025-10-15', '2025-10-18', 450.00, 'confirmed');

-- Insert data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
(UUID(), @booking_id_1, 450.00, 'credit_card');

-- Insert data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
(UUID(), @property_cozy_cottage_id, @user_guest_id, 5, 'Absolutely loved my stay! The cottage was even more charming than the pictures.');

-- Insert data into Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
(UUID(), @user_guest_id, @user_host_id, 'Hi Jane, I am looking forward to my stay at your cottage!'),
(UUID(), @user_host_id, @user_guest_id, 'Hello Peter, looking forward to having you. Let me know if you need anything.');