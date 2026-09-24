CREATE DATABASE UniversityEntryGate;

USE UniversityEntryGate;

CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    roll_no VARCHAR(30) UNIQUE NOT NULL,
    department VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Visitor (
    visitor_id INT PRIMARY KEY AUTO_INCREMENT,
    visitor_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    purpose VARCHAR(200),
    organization VARCHAR(150)
);

CREATE TABLE SecurityGuard (
    guard_id INT PRIMARY KEY AUTO_INCREMENT,
    guard_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    shift VARCHAR(30)
);

CREATE TABLE Gate (
    gate_id INT PRIMARY KEY AUTO_INCREMENT,
    gate_name VARCHAR(100) NOT NULL,
    location VARCHAR(150),
    status VARCHAR(20) DEFAULT 'Open'
);

CREATE TABLE Vehicle (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_number VARCHAR(20) UNIQUE NOT NULL,
    vehicle_type VARCHAR(50),
    owner_name VARCHAR(100)
);

CREATE TABLE EntryLog (
    entry_id INT PRIMARY KEY AUTO_INCREMENT,
    person_name VARCHAR(100) NOT NULL,
    person_type VARCHAR(30) NOT NULL,
    phone VARCHAR(15),
    vehicle_id INT,
    gate_id INT NOT NULL,
    guard_id INT NOT NULL,
    entry_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    exit_time DATETIME,
    purpose VARCHAR(200),

    FOREIGN KEY (vehicle_id)
        REFERENCES Vehicle(vehicle_id),

    FOREIGN KEY (gate_id)
        REFERENCES Gate(gate_id),

    FOREIGN KEY (guard_id)
        REFERENCES SecurityGuard(guard_id)
);
