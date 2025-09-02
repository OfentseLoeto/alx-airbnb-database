CREATE TABLE Bookings (
    booking_id CHAR(36) NOT NULL PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL (10, 2 ) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fr_property FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES Users(user_id)
) ENGINE=InnoDB;

-- Create BEFORE INSERT triger that set booking_id to UUId() if not provided
DELIMETER $$
CREATE TRIGER before_insert_bookings
BEFORE INSERT ON Bookings
FOR EACH ROW 
BEGIN
  IF NEW.booking_id IS NULL OR NEW.booking_id = '' THEN
    SET NEW.Booking_ID = UUId();
  END IF;
END$$
DELIMETER;