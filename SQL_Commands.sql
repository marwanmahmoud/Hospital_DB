CREATE TABLE Patient(
	PID INTEGER NOT NULL,
	Name VARCHAR(255),
	Gender VARCHAR(6),
	Address varchar(255),
	Date_Admitted DATE,
	Date_Discharged DATE,
	RID INTEGER,
	PRIMARY KEY (PID),
	FOREIGN KEY (RID) REFERENCES Room (RID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Room(
	RID INTEGER NOT NULL,
	Room_Cost FLOAT,
	No_of_Beds INTEGER,
	PRIMARY KEY (RID)
);

CREATE TABLE Room_Type(
	RID INTEGER NOT NULL,
	Type VARCHAR(255) NOT NULL,
	PRIMARY KEY (RID, Type),
	FOREIGN KEY (RID) REFERENCES Room (RID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE Medicine(
	Code INTEGER NOT NULL,
	Price FLOAT,
	Quality VARCHAR(255)
);

CREATE TABLE Takes(
	PID INTEGER NOT NULL,
	Code INTEGER NOT NULL,
	Time TIME,
	PRIMARY KEY (PID, Code),
	FOREIGN KEY (Code) REFERENCES Medicine (Code)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Employee(
	EID INTEGER NOT NULL,
	Salary INTEGER,
	E_Address VARCHAR(255),
	Gender VARCHAR(255),
	E_Name VARCHAR(255),
	Jop_Type VARCHAR(255),
	PRIMARY KEY (EID)
);

CREATE TABLE E_Contact_Num(
	EID INTEGER NOT NULL,
	Contact_Num VARCHAR(255) NOT NULL,
	PRIMARY KEY (EID, Contact_Num),
	FOREIGN KEY (EID) REFERENCES Employee (EID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Doctor(
	EID INTEGER NOT NULL,
	Type VARCHAR(255),
	Dep_ID INTEGER,
	PRIMARY key (EID),
	FOREIGN key (EID) REFERENCES Employee
	ON DELETE CASCADE
	ON UPDATE CASCADE
	FOREIGN KEY (Dep_ID) REFERENCES Department
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Departmnt(
	Dep_ID INTEGER NOT NULL,
	Dep_Name VARCHAR(255),
	PRIMARY KEY (Dep_ID)
);

CREATE TABLE Dep_Location(
	Dep_ID INTEGER NOT NULL,
	Location VARCHAR(255),
	PRIMARY KEY (Dep_ID),
	FOREIGN KEY (Dep_ID) REFERENCES Departmnt
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Trainee(
	EID INTEGER NOT NULL,
	PRIMARY KEY (EID),
	FOREIGN KEY (EID) REFERENCES Doctor (EID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Permanent(
	EID INTEGER NOT NULL,
	PRIMARY KEY (EID),
	FOREIGN KEY (EID) REFERENCES Doctor (EID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Visitor(
	EID INTEGER NOT NULL,
	PRIMARY KEY (EID),
	FOREIGN KEY (EID) REFERENCES Doctor (EID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Nurse(
	EID INTEGER NOT NULL,
	RID INTEGER NOT NULL,
	Shift_Hours INTEGER,
	Experiance VARCHAR(500),
	PRIMARY KEY (EID, RID),
	FOREIGN KEY (EID) REFERENCES Employee (EID)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	FOREIGN KEY (RID) REFERENCES Room (RID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Receptionist(
	EID INTEGER NOT NULL,
	PRIMARY KEY (EID),
	FOREIGN KEY (EID) REFERENCES Employee (EID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Record(
	RID INTEGER NOT NULL,
	Description VARCHAR(500),
	Patient_ID INTEGER,
	Appointment TIMESTAMP,
	EID INTEGER,
	PRIMARY KEY (RID),
	FOREIGN KEY (EID) REFERENCES Receptionist (EID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

