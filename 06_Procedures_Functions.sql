USE UniversityEntryGateDB;

-- Procedure 1:
-- Record the exit of a person from the university
DELIMITER //

CREATE PROCEDURE RecordExit(
    IN p_Entry_ID INT
)
BEGIN
    UPDATE EntryLog
    SET Exit_Time = NOW()
    WHERE Entry_ID = p_Entry_ID
      AND Exit_Time IS NULL;
END //

DELIMITER ;


-- Function 1:
-- Calculate the duration of a visit in minutes
DELIMITER //

CREATE FUNCTION VisitDuration(
    p_Entry_ID INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE duration_minutes INT;

    SELECT TIMESTAMPDIFF(
        MINUTE,
        Entry_Time,
        Exit_Time
    )
    INTO duration_minutes
    FROM EntryLog
    WHERE Entry_ID = p_Entry_ID;

    RETURN duration_minutes;
END //

DELIMITER ;
