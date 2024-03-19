-- SQL schema for initializing the URL shortener database
create database  Shortener


CREATE TABLE urls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    short_code VARCHAR(255) NOT NULL UNIQUE,
    original_url VARCHAR(2048) NOT NULL,
    user_id INT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expiration_date TIMESTAMP NULL,
    click_count INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);