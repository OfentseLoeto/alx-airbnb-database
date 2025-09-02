CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid() ,
    first_name VARCHAR(100) NOT NULL ,
    last_name VARCHAR(100) NOT NULL ,
    email VARCHAR(150) UNIQUE NOT NULL ,
    password_hash VARCHAR(255) NOT NULL ,
    role ENUM('guest' , 'host' , 'admin') NOT NULL ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- Explicit index for performance on emailS 