-- Section 1: Database Design & Table Creation (DDL)
-- Q1: Create all necessary tables with appropriate data types and constraints
CREATE DATABASE Hospital_Management_System_Database;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    ContactNumber VARCHAR(15) UNIQUE,
    Address VARCHAR(255),
    BloodGroup VARCHAR(5)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Specialty VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME NOT NULL,
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentID INT,
    Diagnosis VARCHAR(255),
    TreatmentDetails TEXT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY AUTO_INCREMENT,
    TreatmentID INT,
    MedicineName VARCHAR(100),
    Dosage VARCHAR(50),
    Duration VARCHAR(50),
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);

CREATE TABLE Bills (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    AppointmentID INT,
    Amount DECIMAL(10, 2) CHECK (Amount >= 0),
    PaymentDate DATE DEFAULT CURDATE(),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);
