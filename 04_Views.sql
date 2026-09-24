USE UniversityEntryGate;

-- View 1: Security Guard View
CREATE VIEW SecurityGuardView AS
SELECT
    e.entry_id,
    e.person_name,
    e.person_type,
    e.entry_time,
    e.exit_time,
    g.gate_name,
    sg.guard_name,
    e.purpose
FROM EntryLog e
JOIN Gate g
    ON e.gate_id = g.gate_id
JOIN SecurityGuard sg
    ON e.guard_id = sg.guard_id;


-- View 2: Entry Details View
CREATE VIEW EntryDetailsView AS
SELECT
    e.entry_id,
    e.person_name,
    e.person_type,
    e.phone,
    g.gate_name,
    g.location,
    sg.guard_name,
    sg.shift,
    e.entry_time,
    e.exit_time,
    e.purpose
FROM EntryLog e
JOIN Gate g
    ON e.gate_id = g.gate_id
JOIN SecurityGuard sg
    ON e.guard_id = sg.guard_id;


-- View 3: Vehicle Entry View
CREATE VIEW VehicleEntryView AS
SELECT
    e.entry_id,
    e.person_name,
    e.person_type,
    v.vehicle_number,
    v.vehicle_type,
    v.owner_name,
    g.gate_name,
    e.entry_time,
    e.exit_time
FROM EntryLog e
JOIN Vehicle v
    ON e.vehicle_id = v.vehicle_id
JOIN Gate g
    ON e.gate_id = g.gate_id;


-- View 4: Gate Statistics View
CREATE VIEW GateStatisticsView AS
SELECT
    g.gate_id,
    g.gate_name,
    g.location,
    g.status,
    COUNT(e.entry_id) AS total_entries
FROM Gate g
LEFT JOIN EntryLog e
    ON g.gate_id = e.gate_id
GROUP BY
    g.gate_id,
    g.gate_name,
    g.location,
    g.status;


-- View 5: Currently Inside View
CREATE VIEW CurrentlyInsideView AS
SELECT
    e.entry_id,
    e.person_name,
    e.person_type,
    e.phone,
    g.gate_name,
    sg.guard_name,
    e.entry_time,
    e.purpose
FROM EntryLog e
JOIN Gate g
    ON e.gate_id = g.gate_id
JOIN SecurityGuard sg
    ON e.guard_id = sg.guard_id
WHERE e.exit_time IS NULL;
