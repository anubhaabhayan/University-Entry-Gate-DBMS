USE UniversityEntryGate;

-- Trigger 1:
-- Prevent duplicate active entry for the same person

DELIMITER //

CREATE TRIGGER prevent_duplicate_active_entry
BEFORE INSERT ON EntryLog
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM EntryLog
        WHERE person_name = NEW.person_name
        AND exit_time IS NULL
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Person is already inside the university.';
    END IF;
END //

DELIMITER ;


-- Trigger 2:
-- Prevent exit time earlier than entry time

DELIMITER //

CREATE TRIGGER validate_exit_time
BEFORE UPDATE ON EntryLog
FOR EACH ROW
BEGIN
    IF NEW.exit_time IS NOT NULL
       AND NEW.exit_time < NEW.entry_time THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exit time cannot be earlier than entry time.';
    END IF;
END //

DELIMITER ;
