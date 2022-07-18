CREATE TABLE IF NOT EXISTS Departments (
   DepartmentID SERIAL PRIMARY KEY,
   DepartmentName TEXT NOT NULL,
   DirectorName TEXT NOT NULL
)

CREATE TABLE IF NOT EXISTS Workers (
   WorkerID SERIAL PRIMARY KEY,
   WorkerName TEXT NOT NULL,
   DirectorName TEXT NOT NULL,
   Department_ID INTEGER NOT NULL REFERENCES Departments(DepartmentID)
)