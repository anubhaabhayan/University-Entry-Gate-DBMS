USE UniversityEntryGateDB;

-- View 1: Security Guard View
-- Shows the basic information required by security guards
CREATE VIEW SecurityGuardView AS
SELECT
    e.Entry_ID,
    e.Entry_Type,
    e.Entry_Time,
    e.Exit_Time,
    g.Gate_Name,
    sg.Guard_Name,
    e.Purpose
FROM EntryLog e
JOIN Gate g
    ON e.Gate_ID = g.Gate_ID
JOIN SecurityGuard sg
    ON e.Guard_ID = sg.Guard_ID;


-- View 2: Student Entry View
-- Shows student entry and exit information
CREATE VIEW StudentEntryView AS
SELECT
    s.Student_Name,
    s.Roll_No,
    s.Department,
    s.Course,
    g.Gate_Name,
    e.Entry_Time,
    e.Exit_Time,
    e.Purpose
FROM Student s
JOIN EntryLog e
    ON s.Student_ID = e.Student_ID
JOIN Gate g
    ON e.Gate_ID = g.Gate_ID;


-- View 3: Visitor Entry View
-- Shows visitor information and visit details
CREATE VIEW VisitorEntryView AS
SELECT
    v.Visitor_Name,
    v.Phone,
    v.Purpose,
    g.Gate_Name,
    e.Entry_Time,
    e.Exit_Time
FROM Visitor v
JOIN EntryLog e
    ON v.Visitor_ID = e.Visitor_ID
JOIN Gate g
    ON e.Gate_ID = g.Gate_ID;


-- View 4: Management Resource View
-- Provides entry statistics for management
CREATE VIEW ManagementResourceView AS
SELECT
    g.Gate_Name,
    COUNT(e.Entry_ID) AS Total_Entries,
    COUNT(CASE WHEN e.Entry_Type = 'Student' THEN 1 END) AS Student_Entries,
    COUNT(CASE WHEN e.Entry_Type = 'Visitor' THEN 1 END) AS Visitor_Entries
FROM Gate g
LEFT JOIN EntryLog e
    ON g.Gate_ID = e.Gate_ID
GROUP BY g.Gate_ID, g.Gate_Name;


-- View 5: Currently Inside View
-- Shows people who have entered but have not exited
CREATE VIEW CurrentlyInsideView AS
SELECT
    e.Entry_ID,
    e.Entry_Type,
    e.Entry_Time,
    e.Purpose,
    g.Gate_Name
FROM EntryLog e
JOIN Gate g
    ON e.Gate_ID = g.Gate_ID
WHERE e.Exit_Time IS NULL;
