USE UniversityEntryGateDB;

-- 1. Display all entry records
SELECT *
FROM EntryLog;


-- 2. Find total number of entries
SELECT COUNT(*) AS Total_Entries
FROM EntryLog;


-- 3. Find number of entries at each gate
SELECT 
    g.Gate_Name,
    COUNT(e.Entry_ID) AS Total_Entries
FROM Gate g
LEFT JOIN EntryLog e
    ON g.Gate_ID = e.Gate_ID
GROUP BY g.Gate_ID, g.Gate_Name;


-- 4. Find the busiest gate
SELECT 
    g.Gate_Name,
    COUNT(e.Entry_ID) AS Total_Entries
FROM Gate g
JOIN EntryLog e
    ON g.Gate_ID = e.Gate_ID
GROUP BY g.Gate_ID, g.Gate_Name
ORDER BY Total_Entries DESC
LIMIT 1;


-- 5. Find entries according to entry type
SELECT 
    Entry_Type,
    COUNT(*) AS Total_Entries
FROM EntryLog
GROUP BY Entry_Type;


-- 6. Find the number of students entering the university
SELECT COUNT(*) AS Student_Entries
FROM EntryLog
WHERE Entry_Type = 'Student';


-- 7. Find the number of visitors entering the university
SELECT COUNT(*) AS Visitor_Entries
FROM EntryLog
WHERE Entry_Type = 'Visitor';


-- 8. Find people who have not exited yet
SELECT 
    Entry_ID,
    Entry_Type,
    Entry_Time,
    Purpose
FROM EntryLog
WHERE Exit_Time IS NULL;


-- 9. Find entries handled by each security guard
SELECT
    sg.Guard_Name,
    COUNT(e.Entry_ID) AS Entries_Handled
FROM SecurityGuard sg
LEFT JOIN EntryLog e
    ON sg.Guard_ID = e.Guard_ID
GROUP BY sg.Guard_ID, sg.Guard_Name;


-- 10. Find vehicle entries
SELECT
    v.Vehicle_Number,
    v.Vehicle_Type,
    v.Owner_Name,
    e.Entry_Time,
    e.Exit_Time
FROM Vehicle v
JOIN EntryLog e
    ON v.Vehicle_ID = e.Vehicle_ID;


-- 11. Find entries between two times
SELECT *
FROM EntryLog
WHERE Entry_Time
BETWEEN '2026-09-24 08:00:00'
AND '2026-09-24 12:00:00';


-- 12. Display student entry details
SELECT
    s.Student_Name,
    s.Roll_No,
    s.Department,
    e.Entry_Time,
    e.Exit_Time,
    g.Gate_Name
FROM Student s
JOIN EntryLog e
    ON s.Student_ID = e.Student_ID
JOIN Gate g
    ON e.Gate_ID = g.Gate_ID;


-- 13. Display visitor entry details
SELECT
    v.Visitor_Name,
    v.Phone,
    v.Purpose,
    e.Entry_Time,
    e.Exit_Time,
    g.Gate_Name
FROM Visitor v
JOIN EntryLog e
    ON v.Visitor_ID = e.Visitor_ID
JOIN Gate g
    ON e.Gate_ID = g.Gate_ID;


-- 14. Find the purpose of visitor visits
SELECT
    Purpose,
    COUNT(*) AS Number_of_Visits
FROM EntryLog
WHERE Entry_Type = 'Visitor'
GROUP BY Purpose;


-- 15. Daily entry statistics
SELECT
    DATE(Entry_Time) AS Entry_Date,
    COUNT(*) AS Total_Entries
FROM EntryLog
GROUP BY DATE(Entry_Time)
ORDER BY Entry_Date;


-- 16. Find entries handled by each gate and guard
SELECT
    g.Gate_Name,
    sg.Guard_Name,
    COUNT(e.Entry_ID) AS Total_Entries
FROM EntryLog e
JOIN Gate g
    ON e.Gate_ID = g.Gate_ID
JOIN SecurityGuard sg
    ON e.Guard_ID = sg.Guard_ID
GROUP BY g.Gate_Name, sg.Guard_Name;


-- 17. Find vehicles currently inside the university
SELECT
    v.Vehicle_Number,
    v.Vehicle_Type,
    v.Owner_Name
FROM Vehicle v
JOIN EntryLog e
    ON v.Vehicle_ID = e.Vehicle_ID
WHERE e.Exit_Time IS NULL;


-- 18. Find peak entry hours
SELECT
    HOUR(Entry_Time) AS Entry_Hour,
    COUNT(*) AS Number_of_Entries
FROM EntryLog
GROUP BY HOUR(Entry_Time)
ORDER BY Number_of_Entries DESC;


-- 19. Find all entries for a particular gate
SELECT
    e.Entry_ID,
    e.Entry_Type,
    e.Entry_Time,
    e.Exit_Time,
    e.Purpose
FROM EntryLog e
JOIN Gate g
    ON e.Gate_ID = g.Gate_ID
WHERE g.Gate_Name = 'Main Gate';


-- 20. Find current people inside the university
SELECT
    Entry_ID,
    Entry_Type,
    Entry_Time,
    Purpose
FROM EntryLog
WHERE Exit_Time IS NULL;
