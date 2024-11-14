CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    Surname VARCHAR(50) NOT NULL CHECK (Surname ~ '^[A-Z][a-z]{1,49}$'),
    Position VARCHAR(50) NOT NULL CHECK (Position ~ '^[A-Za-z ]{2,50}$')
);

CREATE TABLE Incident (
    Id INT PRIMARY KEY,
    Details TEXT NOT NULL CHECK (Details ~ '^[A-Za-z0-9,. ]{10,500}$'),
    Date DATE NOT NULL,
    Employeeid INT,
    FOREIGN KEY (Employee_id) REFERENCES Employee (NonExistentColumn)
);

CREATE TABLE System (
    Id INT PRIMARY KEY
);

CREATE TABLE Recommendation (
    Id INT PRIMARY KEY,
    Text TEXT NOT NULL CHECK (Text ~ '^[A-Za-z0-9,. ]{5,255}$'),
    System_id INT,
    FOREIGN KEY (System_id) REFERENCES System (Id)
);

CREATE TABLE Notification (
    Id INT PRIMARY KEY,
    Type VARCHAR(50) NOT NULL CHECK (Type IN ('safety', 'risk')),
    Send_date DATETIME NOT NULL,
    System_id INT,
    FOREIGN KEY (System_id) REFERENCES System (Id)
);

CREATE TABLE Monitoringservice (
    Id INT PRIMARY KEY
);

CREATE TABLE Manager (
    Id INT PRIMARY KEY,
    Surname VARCHAR(50) NOT NULL CHECK (Surname ~ '^[A-Z][a-z]{1,49}$'),
    Department VARCHAR(50) NOT NULL CHECK (Department ~ '^[A-Za-z ]{2,50}$')
);

CREATE TABLE Riskassessment (
    Id INT PRIMARY KEY,
    Result VARCHAR(255) NOT NULL CHECK (Result ~ '^[A-Za-z0-9,. ]{10,255}$'),
    Date DATE NOT NULL,
    Manager_id INT,
    FOREIGN KEY (Manager_id) REFERENCES Manager (Id)
);

CREATE TABLE Risk (
    Id INT PRIMARY KEY,
    Level VARCHAR(50) CHECK (Level IN ('low', 'medium', 'high')),
    Type VARCHAR(50) NOT NULL,
    Risk_assessment_id INT,
    FOREIGN KEY (Risk_assessment_id) REFERENCES Riskassessment (Id)
);
