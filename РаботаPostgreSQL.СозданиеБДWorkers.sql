CREATE TABLE IF NOT EXISTS Workers (
   WorkerID SERIAL PRIMARY KEY,
   WorkerName TEXT NOT NULL,
   DepartmentName TEXT NOT NULL,
   Director_ID INTEGER REFERENCES Workers(WorkerID)
)
