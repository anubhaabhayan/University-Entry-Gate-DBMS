USE UniversityEntryGateDB;

-- Insert Students
INSERT INTO Student
(Student_Name, Roll_No, Department, Course, Phone)
VALUES
('Anubha Abhayan', 'MCA001', 'Computer Applications', 'MCA', '9876543210'),
('Vaishnavi Sharma', 'MCA002', 'Computer Applications', 'MCA', '9876543211'),
('Chonda Singh', 'BCA003', 'Computer Applications', 'BCA', '9876543212'),
('Rahul Kumar', 'BCA004', 'Computer Applications', 'BCA', '9876543213'),
('Priya Verma', 'MCA005', 'Computer Applications', 'MCA', '9876543214');


-- Insert Visitors
INSERT INTO Visitor
(Visitor_Name, Phone, Purpose, Address)
VALUES
('Rohit Mehta', '9811111111', 'Meeting with Professor', 'Delhi'),
('Neha Sharma', '9822222222', 'Admission Enquiry', 'Faridabad'),
('Amit Kumar', '9833333333', 'Official Meeting', 'Gurgaon'),
('Sneha Joseph', '9844444444', 'Parent Visit', 'Delhi');


-- Insert Security Guards
INSERT INTO SecurityGuard
(Guard_Name, Phone, Shift)
VALUES
('Rajesh Kumar', '9900000001', 'Morning'),
('Suresh Singh', '9900000002', 'Evening'),
('Vikram Sharma', '9900000003', 'Night');


-- Insert Gates
INSERT INTO Gate
(Gate_Name, Location)
VALUES
('Main Gate', 'University Main Entrance'),
('North Gate', 'North Campus'),
('South Gate', 'South Campus'),
('Hostel Gate', 'Hostel Entrance');


-- Insert Vehicles
INSERT INTO Vehicle
(Vehicle_Number, Vehicle_Type, Owner_Name)
VALUES
('DL01AB1234', 'Car', 'Rohit Mehta'),
('DL02CD5678', 'Bike', 'Neha Sharma'),
('HR26EF9012', 'Car', 'Amit Kumar'),
('DL03GH3456', 'Bike', 'Priya Verma');


-- Insert Entry Logs
INSERT INTO EntryLog
(Student_ID, Visitor_ID, Guard_ID, Gate_ID, Vehicle_ID,
 Entry_Time, Exit_Time, Entry_Type, Purpose)
VALUES
(1, NULL, 1, 1, 4,
 '2026-09-24 08:30:00', '2026-09-24 15:30:00',
 'Student', 'Regular Classes'),

(2, NULL, 1, 1, NULL,
 '2026-09-24 09:00:00', '2026-09-24 16:00:00',
 'Student', 'Regular Classes'),

(NULL, 1, 1, 1, 1,
 '2026-09-24 10:15:00', '2026-09-24 11:30:00',
 'Visitor', 'Meeting with Professor'),

(NULL, 2, 2, 2, 2,
 '2026-09-24 11:00:00', '2026-09-24 12:30:00',
 'Visitor', 'Admission Enquiry'),

(3, NULL, 2, 2, NULL,
 '2026-09-24 09:15:00', NULL,
 'Student', 'Laboratory Work'),

(NULL, 3, 3, 3, 3,
 '2026-09-24 14:00:00', NULL,
 'Visitor', 'Official Meeting');
