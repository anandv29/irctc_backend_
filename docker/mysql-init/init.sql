CREATE DATABASE IF NOT EXISTS irctc;
USE irctc;

CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userEMAIL VARCHAR(255) NOT NULL UNIQUE,
    userPassword VARCHAR(255) NOT NULL,
    userName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS train (
    id INT AUTO_INCREMENT PRIMARY KEY,
    trainName VARCHAR(255),
    source VARCHAR(255),
    destination VARCHAR(255),
    seats INT
);

CREATE TABLE IF NOT EXISTS tickets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    trainId INT,
    bookingDate DATETIME,
    status VARCHAR(50),
    FOREIGN KEY(userId) REFERENCES user(id),
    FOREIGN KEY(trainId) REFERENCES train(id)
);
