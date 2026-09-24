USE UniversityEntryGateDB;

-- Trigger 1:
-- Prevent duplicate active entry for the same student
DELIMITER //

CREATE TRIGGER prevent_duplicate_student_entry
BEFORE INSERT ON EntryLog
FOR EACH ROW
BEGIN
    IF NEW.Student_ID IS NOT NULL AND EXISTS (
        SELECT 1
        FROM EntryLog
        WHERE Student_ID = NEW.Student_ID
        AND Exit_Time IS NULL
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Student is already inside the university.';
    END IF;
END //

DELIMITER ;


-- Trigger 2:
-- Prevent an exit time earlier than the entry time
DELIMITER //

CREATE TRIGGER validate_exit_time
BEFORE UPDATE ON EntryLog
FOR EACH ROW
BEGIN
    IF NEW.Exit_Time IS NOT NULL
       AND NEW.Exit_Time < NEW.Entry_Time THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Exit time cannot be earlier than entry time.';
    END IF;
END //

DELIMITER ;


-- Trigger 3:
-- Automatically record updates in the audit table
DELIMITER //

CREATE TRIGGER audit_entry_update
AFTER UPDATE ON EntryLog
FOR EACH ROW
BEGIN
    INSERT INTO EntryLogAudit
    (Entry_ID, Action_Type, Description)
    VALUES
    (
        NEW.Entry_ID,
        'UPDATE',
        CONCAT(
            'Entry record updated. Entry ID: ',
            NEW.Entry_ID
        )
    );
END //

DELIMITER ;
