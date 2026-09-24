USE UniversityEntryGate;

-- Procedure:
-- Record the exit of a person from the university

DELIMITER //

CREATE PROCEDURE RecordExit(
    IN p_entry_id INT
)
BEGIN
    UPDATE EntryLog
    SET exit_time = NOW()
    WHERE entry_id = p_entry_id
      AND exit_time IS NULL;
END //

DELIMITER ;


-- Function:
-- Calculate the duration of a visit in minutes

DELIMITER //

CREATE FUNCTION VisitDuration(
    p_entry_id INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE duration_minutes INT;

    SELECT TIMESTAMPDIFF(
        MINUTE,
        entry_time,
        exit_time
    )
    INTO duration_minutes
    FROM EntryLog
    WHERE entry_id = p_entry_id;

    RETURN duration_minutes;
END //

DELIMITER ;
