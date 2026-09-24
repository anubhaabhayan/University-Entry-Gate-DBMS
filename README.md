# University Entry Gate Management System

## DBMS Assignment

The **University Entry Gate Management System** is a Database Management System designed to manage and monitor the entry and exit activities of a university.

The system maintains information about students, visitors, security guards, university gates, vehicles, and entry/exit records.

## Objectives

* Maintain university entry and exit records.
* Manage student and visitor information.
* Track security guards and university gates.
* Maintain vehicle information.
* Record entry and exit activities.
* Monitor gate usage and entry statistics.
* Provide useful database views for information retrieval.
* Apply triggers for data validation.
* Use stored procedures and functions for database operations.

## Database Entities

The system consists of the following main entities:

1. **Student**
2. **Visitor**
3. **Security Guard**
4. **Gate**
5. **Vehicle**
6. **Entry Log**

## Database Tables

### 1. Student

Stores information about university students.

**Attributes:**

* student_id (Primary Key)
* student_name
* roll_no
* department
* phone

### 2. Visitor

Stores information about visitors entering the university.

**Attributes:**

* visitor_id (Primary Key)
* visitor_name
* phone
* purpose
* organization

### 3. Security Guard

Stores information about security guards.

**Attributes:**

* guard_id (Primary Key)
* guard_name
* phone
* shift

### 4. Gate

Stores information about university gates.

**Attributes:**

* gate_id (Primary Key)
* gate_name
* location
* status

### 5. Vehicle

Stores information about vehicles entering the university.

**Attributes:**

* vehicle_id (Primary Key)
* vehicle_number
* vehicle_type
* owner_name

### 6. Entry Log

Stores entry and exit records of people entering the university.

**Attributes:**

* entry_id (Primary Key)
* person_name
* person_type
* phone
* vehicle_id (Foreign Key)
* gate_id (Foreign Key)
* guard_id (Foreign Key)
* entry_time
* exit_time
* purpose

## Project Files

| File                          | Description                                          |
| ----------------------------- | ---------------------------------------------------- |
| `01_Database_Creation.sql`    | Creates the database and tables                      |
| `02_Sample_Data.sql`          | Inserts sample records                               |
| `03_Queries.sql`              | Contains SQL queries for data retrieval and analysis |
| `04_Views.sql`                | Creates database views                               |
| `05_Triggers.sql`             | Contains database triggers for data validation       |
| `06_Procedures_Functions.sql` | Contains stored procedures and functions             |
| `ER_Diagram.png`              | Shows database entities and relationships            |

## Main Features

### Entry Management

Records the entry and exit time of students and visitors.

### Gate Management

Maintains information about university gates, their locations, and their current status.

### Visitor Management

Stores visitor details, purpose of visit, organization, and entry information.

### Vehicle Management

Maintains vehicle number, vehicle type, and owner information.

### Security Management

Stores security guard information and tracks entry records handled by guards.

### Entry Monitoring

The system can identify people who are currently inside the university by checking entry records where the exit time has not been recorded.

### Data Validation

Database triggers are used to validate entry information and prevent invalid records.

### Database Views

Views provide simplified access to entry information, vehicle entries, gate statistics, and currently active entries.

### Stored Procedures and Functions

Stored procedures and functions are used to perform database operations such as recording exits and calculating visit duration.

## SQL Operations and Analysis

The project includes queries for:

* Displaying student records
* Displaying visitor records
* Displaying security guard records
* Displaying gate information
* Displaying vehicle information
* Viewing complete entry logs
* Viewing entry details with gate and guard information
* Viewing vehicle entry information
* Counting entries by person type
* Counting entries at each gate
* Identifying currently active entries
* Displaying open gates

## Database Concepts Used

* Database Creation
* Primary Keys
* Foreign Keys
* Unique Constraints
* Default Values
* Table Relationships
* SQL Queries
* SELECT Statements
* JOIN Operations
* Aggregate Functions
* GROUP BY
* Views
* Triggers
* Stored Procedures
* Functions

## ER Diagram

The ER diagram represents the entities, attributes, primary keys, foreign keys, and relationships used in the University Entry Gate Management System.

The main relationship structure is:

* One vehicle can be associated with multiple entry records.
* One gate can have multiple entry records.
* One security guard can handle multiple entry records.

## Technology Used

* **MySQL**
* **SQL**
* **GitHub**
* **ER Diagram**

## Conclusion

The University Entry Gate Management System provides a structured database solution for managing university entry and exit activities. It demonstrates important DBMS concepts including database creation, table design, primary keys, foreign keys, relationships, SQL queries, views, triggers, stored procedures, and functions.

The system can help university security personnel maintain organized entry records, monitor gate activities, manage visitor and vehicle information, and retrieve useful information through SQL queries.
