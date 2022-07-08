CREATE TABLE Users(id INTEGER PRIMARY KEY, email TEXT NOT NULL, password TEXT NOT NULL);

CREATE TABLE Applicants(id INTEGER REFERENCES Users, name VARCHAR(40) NOT NULL, phone TEXT, address TEXT, employment TEXT,
reason TEXT NOT NULL, dob DATE, status TEXT NOT NULL DEFAULT 'pending', dateofapplication DATE NOT NULL DEFAULT CURRENT_DATE,
admin BOOLEAN NOT NULL DEFAULT '0', pet INTEGER REFERENCES Pets,
PRIMARY KEY(id),
CHECK (status in ('approved', 'declined', 'pending')));

CREATE TABLE Pets (pid INTEGER PRIMARY KEY AUTOINCREMENT, type VARCHAR(1) NOT NULL, status VARCHAR(15) NOT NULL DEFAULT 'available', pname VARCHAR(40),
sex CHAR(1), picture BLOB, dob DATE, dateofintake DATE NOT NULL DEFAULT CURRENT_DATE, description TEXT,
CHECK (status in ('available', 'pre-adopted', 'adopted')), CHECK (type in ('dog', 'cat', 'other')));
